import { useEffect, useRef, useState } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '@/hooks/useAuth'
import { supabase } from '@/lib/supabase'
import { uploadMaterial, FileValidationError } from '@/lib/storage'
import { ICON_SETS, type IconName } from '@/features/lesson/IconRow'
import type { LessonBlock, Question, QuestionOption, Topic, Track } from '@/types/database'

type BekitTaskType = 'multiple_choice' | 'short_answer' | 'matching' | 'fill_blank'
type BekitUiKind = BekitTaskType | 'visual_matching' | 'sorting' | 'grouping' | 'expression_builder' | 'find_error' | 'measurement'

const BEKIT_KIND_LABEL: Record<BekitUiKind, string> = {
  multiple_choice: 'көп таңдау',
  short_answer: 'қысқа жауап',
  matching: 'сәйкестендіру (сандар)',
  visual_matching: 'сәйкестендіру (сурет-атау)',
  sorting: 'ретке қою',
  grouping: 'топтастыру',
  expression_builder: 'өрнек құрастыру',
  find_error: 'қатені тап',
  measurement: 'сызғышпен өлшеу',
  fill_blank: 'бос орынды толтыру',
}

/** The DB has no dedicated block_type for expression_builder/find_error/
 * measurement, and visual matching reuses 'matching' — all distinguished
 * by configuration.kind, so the UI "kind" is derived from block_type +
 * configuration.kind. */
function bekitUiKind(task: BekitTask): BekitUiKind {
  const bt = task.block.block_type as string
  if (bt === 'ordering') return 'sorting'
  if (bt === 'drag_drop') return 'grouping'
  if (bt === 'fill_blank') return 'fill_blank'
  if (bt === 'matching') {
    return task.block.configuration.kind === 'visual' ? 'visual_matching' : 'matching'
  }
  if (bt === 'question') {
    const k = task.block.configuration.kind as string | undefined
    if (k === 'expression_builder') return 'expression_builder'
    if (k === 'find_error') return 'find_error'
    if (k === 'measurement') return 'measurement'
    return 'short_answer'
  }
  return bt as BekitTaskType
}

interface BekitTask {
  block: LessonBlock
  question: Question | null
  options: QuestionOption[]
}

const TRACK_LABEL: Record<Track, string> = { base: 'Негізгі математика', logic: 'Логика' }

// --- small shared bits -----------------------------------------------------

function SaveStatus({ state }: { state: 'idle' | 'saving' | 'saved' | 'error' }) {
  if (state === 'saving') return <p className="status">Сақталуда...</p>
  if (state === 'saved') return <p className="form-success">Сақталды.</p>
  if (state === 'error') return <p className="form-error">Сақтау кезінде қате шықты.</p>
  return null
}

// --- Көр editor --------------------------------------------------------------

type KorKind = 'story' | 'scene'

function KorEditor({ topicId, initial }: { topicId: string; initial: LessonBlock | null }) {
  const initialKind = (initial?.configuration.kind as string | undefined) ?? (initial ? 'story' : 'story')
  const [kind, setKind] = useState<KorKind>(initialKind === 'scene' ? 'scene' : 'story')
  const [slidesText, setSlidesText] = useState(
    initial ? ((initial.configuration.slides as string[] | undefined) ?? []).join('\n') : ''
  )
  const [mediaUrl, setMediaUrl] = useState(initial?.media_url ?? '')
  const [caption, setCaption] = useState((initial?.configuration.caption as string) ?? '')
  const [sceneItemsText, setSceneItemsText] = useState(
    ((initial?.configuration.items as { icon: string; label: string }[] | undefined) ?? [])
      .map((i) => `${i.icon},${i.label}`).join('\n')
  )
  const [saveState, setSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')
  const [uploadError, setUploadError] = useState<string | null>(null)
  const fileRef = useRef<HTMLInputElement>(null)

  async function handleFile(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0]
    if (!file) return
    setUploadError(null)
    try {
      const result = await uploadMaterial(file, 'infographics')
      setMediaUrl(result.publicUrl)
    } catch (err) {
      setUploadError(err instanceof FileValidationError ? err.message : 'Файлды жүктеу кезінде қате шықты.')
    }
  }

  async function save() {
    setSaveState('saving')
    const payload =
      kind === 'scene'
        ? {
            content: null,
            media_url: null,
            block_type: 'infographic',
            configuration: {
              kind: 'scene',
              items: sceneItemsText
                .split('\n')
                .map((l) => l.split(','))
                .filter(([icon, label]) => icon?.trim() && label?.trim())
                .map(([icon, label]) => ({ icon: icon.trim(), label: label.trim() })),
              caption,
            },
          }
        : {
            content: null,
            media_url: mediaUrl || null,
            block_type: 'text',
            configuration: { kind: 'story', slides: (() => { const s = slidesText.split('\n').map((x) => x.trim()).filter(Boolean); return s.length ? s : [''] })() },
          }
    const { error } = initial
      ? await supabase.from('lesson_blocks').update(payload).eq('id', initial.id)
      : await supabase.from('lesson_blocks').insert({ topic_id: topicId, stage: 'kor', sort_order: 0, ...payload })
    setSaveState(error ? 'error' : 'saved')
  }

  const canSave = kind === 'scene' ? sceneItemsText.trim() !== '' && caption.trim() !== '' : slidesText.trim() !== ''

  return (
    <div className="panel">
      <h3>Көр — көрсету</h3>
      <label>
        Түрі
        <select value={kind} onChange={(e) => setKind(e.target.value as KorKind)}>
          <option value="story">Слайдтар (мәтін бірінен соң бірі)</option>
          <option value="scene">Сурет-карталар (бірнеше зат бір мезгілде)</option>
        </select>
      </label>

      {kind === 'story' && (
        <>
          <p className="status" style={{ fontWeight: 400 }}>Әр слайд бөлек жолда жазылады. Оқушы «Келесі» батырмасымен слайдтарды бірінен соң бірін көреді.</p>
          <label>
            Слайдтар мәтіні
            <textarea value={slidesText} onChange={(e) => setSlidesText(e.target.value)} rows={4} placeholder={'Бірінші слайд мәтіні\nЕкінші слайд мәтіні'} />
          </label>
          <label>
            Инфографика/сурет (міндетті емес)
            <input ref={fileRef} type="file" accept="image/jpeg,image/png,image/webp,image/svg+xml" onChange={handleFile} />
          </label>
          {mediaUrl && <p className="status">Жүктелген сурет: <a href={mediaUrl} target="_blank" rel="noreferrer">ашу</a></p>}
          {uploadError && <p className="form-error">{uploadError}</p>}
        </>
      )}

      {kind === 'scene' && (
        <>
          <p className="status" style={{ fontWeight: 400 }}>Бірнеше затты бір мезгілде көрсету үшін. Әр жол — «белгіше,атауы» (мысалы: apple,Алма).</p>
          <label>
            Заттар
            <textarea value={sceneItemsText} onChange={(e) => setSceneItemsText(e.target.value)} rows={4} placeholder={'apple,Алма\nstar,Жұлдыз'} />
          </label>
          <label>
            Астыңғы жазба
            <input type="text" value={caption} onChange={(e) => setCaption(e.target.value)} />
          </label>
        </>
      )}

      <button type="button" className="button primary" onClick={save} disabled={!canSave}>Сақтау</button>
      <SaveStatus state={saveState} />
    </div>
  )
}

// --- Құрастыр editor ----------------------------------------------------------

type QurastyrKind = 'combine-split' | 'count-click' | 'number-line' | 'clock' | 'balance-scale' | 'money'
const QURASTYR_KIND_LABEL: Record<QurastyrKind, string> = {
  'combine-split': 'Санды құрастыру (+/− батырмалы)',
  'count-click': 'Санау (белгішелерді басып санау)',
  'number-line': 'Сандық түзу',
  clock: 'Сағат циферблаты',
  'balance-scale': 'Тепе-теңдік таразы',
  money: 'Ақша/дүкен сценарийі',
}

function QurastyrEditor({ topicId, initial }: { topicId: string; initial: LessonBlock | null }) {
  const initialKind = (initial?.configuration.kind as string | undefined) ?? 'combine-split'
  const [kind, setKind] = useState<QurastyrKind>((Object.keys(QURASTYR_KIND_LABEL).includes(initialKind) ? initialKind : 'combine-split') as QurastyrKind)
  const [total, setTotal] = useState(String((initial?.configuration.total as number) ?? 10))
  const [startLeft, setStartLeft] = useState(String((initial?.configuration.startLeft as number) ?? 5))
  const [icon, setIcon] = useState<IconName>((initial?.configuration.icon as IconName) ?? 'apple')
  const [count, setCount] = useState(String((initial?.configuration.count as number) ?? 5))
  const [content, setContent] = useState(initial?.content ?? '')
  const [lineMin, setLineMin] = useState(String((initial?.configuration.min as number) ?? 0))
  const [lineMax, setLineMax] = useState(String((initial?.configuration.max as number) ?? 10))
  const [lineTarget, setLineTarget] = useState(String((initial?.configuration.target as number) ?? 5))
  const [hour, setHour] = useState(String((initial?.configuration.hour as number) ?? 3))
  const [minute, setMinute] = useState(String((initial?.configuration.minute as number) ?? 0))
  const [leftWeightsText, setLeftWeightsText] = useState(((initial?.configuration.leftWeights as number[] | undefined) ?? [3, 4]).join(', '))
  const [rightKnown, setRightKnown] = useState(String((initial?.configuration.rightKnown as number) ?? 2))
  const [moneyItemsText, setMoneyItemsText] = useState(
    ((initial?.configuration.items as { label: string; price: number }[] | undefined) ?? [{ label: 'Дәптер', price: 150 }])
      .map((i) => `${i.label},${i.price}`).join('\n')
  )
  const [saveState, setSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')

  function buildPayload(): { content: string | null; configuration: Record<string, unknown> } {
    switch (kind) {
      case 'combine-split':
        return { content: null, configuration: { kind, total: Number(total), startLeft: Number(startLeft) } }
      case 'count-click':
        return { content, configuration: { kind, icon, count: Number(count) } }
      case 'number-line':
        return { content, configuration: { kind, min: Number(lineMin), max: Number(lineMax), target: Number(lineTarget) } }
      case 'clock':
        return { content, configuration: { kind, hour: Number(hour), minute: Number(minute) } }
      case 'balance-scale':
        return {
          content,
          configuration: {
            kind,
            leftWeights: leftWeightsText.split(',').map((n) => Number(n.trim())).filter((n) => Number.isFinite(n)),
            rightKnown: Number(rightKnown),
          },
        }
      case 'money': {
        const items = moneyItemsText
          .split('\n')
          .map((line) => line.split(','))
          .filter(([label, price]) => label?.trim() && Number.isFinite(Number(price)))
          .map(([label, price]) => ({ label: label.trim(), price: Number(price.trim()) }))
        return { content, configuration: { kind, items } }
      }
    }
  }

  async function save() {
    setSaveState('saving')
    const payload = buildPayload()
    const { error } = initial
      ? await supabase.from('lesson_blocks').update(payload).eq('id', initial.id)
      : await supabase.from('lesson_blocks').insert({ topic_id: topicId, stage: 'qurastyr', block_type: 'number_builder', sort_order: 0, ...payload })
    setSaveState(error ? 'error' : 'saved')
  }

  const needsContent = kind !== 'combine-split'
  const canSave = !needsContent || content.trim() !== ''

  return (
    <div className="panel">
      <h3>Құрастыр — интерактив түрі</h3>
      <label>
        Түрі
        <select value={kind} onChange={(e) => setKind(e.target.value as QurastyrKind)}>
          {(Object.keys(QURASTYR_KIND_LABEL) as QurastyrKind[]).map((k) => (
            <option key={k} value={k}>{QURASTYR_KIND_LABEL[k]}</option>
          ))}
        </select>
      </label>

      {kind === 'combine-split' && (
        <div className="two">
          <label>
            Жалпы сан
            <input type="number" min={1} value={total} onChange={(e) => setTotal(e.target.value)} />
          </label>
          <label>
            Бастапқы сол жақ бөлік
            <input type="number" min={0} value={startLeft} onChange={(e) => setStartLeft(e.target.value)} />
          </label>
        </div>
      )}

      {(kind === 'count-click' || kind === 'number-line' || kind === 'clock' || kind === 'balance-scale' || kind === 'money') && (
        <label>
          Тапсырма мәтіні
          <input type="text" value={content} onChange={(e) => setContent(e.target.value)} placeholder="Тапсырманың сұрақ мәтінін жаз" />
        </label>
      )}

      {kind === 'count-click' && (
        <div className="two">
          <label>
            Белгіше
            <select value={icon} onChange={(e) => setIcon(e.target.value as IconName)}>
              {(Object.keys(ICON_SETS) as IconName[]).map((k) => (
                <option key={k} value={k}>{ICON_SETS[k]} {k}</option>
              ))}
            </select>
          </label>
          <label>
            Саны
            <input type="number" min={1} max={20} value={count} onChange={(e) => setCount(e.target.value)} />
          </label>
        </div>
      )}

      {kind === 'number-line' && (
        <div className="two">
          <label>Ең кіші сан<input type="number" value={lineMin} onChange={(e) => setLineMin(e.target.value)} /></label>
          <label>Ең үлкен сан<input type="number" value={lineMax} onChange={(e) => setLineMax(e.target.value)} /></label>
          <label>Дұрыс сан (нысана)<input type="number" value={lineTarget} onChange={(e) => setLineTarget(e.target.value)} /></label>
        </div>
      )}

      {kind === 'clock' && (
        <div className="two">
          <label>
            Сағат (1–12)
            <input type="number" min={1} max={12} value={hour} onChange={(e) => setHour(e.target.value)} />
          </label>
          <label>
            Минут
            <select value={minute} onChange={(e) => setMinute(e.target.value)}>
              <option value="0">00</option>
              <option value="15">15</option>
              <option value="30">30</option>
              <option value="45">45</option>
            </select>
          </label>
        </div>
      )}

      {kind === 'balance-scale' && (
        <div className="two">
          <label>
            Сол жақ салмақтар (үтірмен бөліп жаз, мысалы 3, 4)
            <input type="text" value={leftWeightsText} onChange={(e) => setLeftWeightsText(e.target.value)} />
          </label>
          <label>
            Оң жақтағы белгілі салмақ
            <input type="number" value={rightKnown} onChange={(e) => setRightKnown(e.target.value)} />
          </label>
        </div>
      )}

      {kind === 'money' && (
        <label>
          Заттар мен бағалары (әр жолда «атауы,бағасы», мысалы Дәптер,150)
          <textarea value={moneyItemsText} onChange={(e) => setMoneyItemsText(e.target.value)} rows={4} />
        </label>
      )}

      <button type="button" className="button primary" onClick={save} disabled={!canSave}>Сақтау</button>
      <SaveStatus state={saveState} />
    </div>
  )
}

// --- Түсіндір editor -----------------------------------------------------------

function TusindirEditor({ topicId, initial }: { topicId: string; initial: LessonBlock | null }) {
  const [content, setContent] = useState(initial?.content ?? '')
  const [saveState, setSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')

  async function save() {
    setSaveState('saving')
    const payload = { content }
    const { error } = initial
      ? await supabase.from('lesson_blocks').update(payload).eq('id', initial.id)
      : await supabase.from('lesson_blocks').insert({ topic_id: topicId, stage: 'tusindir', block_type: 'short_answer', sort_order: 0, ...payload })
    setSaveState(error ? 'error' : 'saved')
  }

  return (
    <div className="panel">
      <h3>Түсіндір — ойлану сұрағы</h3>
      <label>
        Сұрақ мәтіні
        <textarea value={content} onChange={(e) => setContent(e.target.value)} rows={3} placeholder="Неге бұлай болды деп ойлайсың?" />
      </label>
      <button type="button" className="button primary" onClick={save} disabled={content.trim() === ''}>Сақтау</button>
      <SaveStatus state={saveState} />
    </div>
  )
}

// --- Қолдан editor -------------------------------------------------------------

function QoldanEditor({ topicId, initialBlock, initialQuestion }: { topicId: string; initialBlock: LessonBlock | null; initialQuestion: Question | null }) {
  const [content, setContent] = useState(initialBlock?.content ?? '')
  const [usePartWhole, setUsePartWhole] = useState(initialBlock ? initialBlock.configuration.total !== undefined : false)
  const [total, setTotal] = useState(String((initialBlock?.configuration.total as number) ?? 10))
  const [known, setKnown] = useState(String((initialBlock?.configuration.known as number) ?? 4))
  const [knownLabel, setKnownLabel] = useState((initialBlock?.configuration.knownLabel as string) ?? '')
  const [unknownLabel, setUnknownLabel] = useState((initialBlock?.configuration.unknownLabel as string) ?? '')
  const [correctAnswer, setCorrectAnswer] = useState(String(initialQuestion?.correct_answer ?? ''))
  const [hint, setHint] = useState(initialQuestion?.hint ?? '')
  const [saveState, setSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')

  async function save() {
    setSaveState('saving')
    const configuration = usePartWhole
      ? { total: Number(total), known: Number(known), knownLabel, unknownLabel }
      : {}
    const blockPayload = { content, configuration }

    const { data: block, error: blockError } = initialBlock
      ? await supabase.from('lesson_blocks').update(blockPayload).eq('id', initialBlock.id).select('*').single()
      : await supabase.from('lesson_blocks').insert({ topic_id: topicId, stage: 'qoldan', block_type: 'question', sort_order: 0, ...blockPayload }).select('*').single()

    if (blockError || !block) { setSaveState('error'); return }

    const questionPayload = {
      lesson_block_id: block.id,
      question_text: content,
      question_type: 'short_answer' as const,
      correct_answer: Number.isFinite(Number(correctAnswer)) ? Number(correctAnswer) : correctAnswer,
      hint: hint || null,
      points: 1,
    }
    const { error: qError } = initialQuestion
      ? await supabase.from('questions').update(questionPayload).eq('id', initialQuestion.id)
      : await supabase.from('questions').insert(questionPayload)

    setSaveState(qError ? 'error' : 'saved')
  }

  return (
    <div className="panel">
      <h3>Қолдан — тәжірибелік есеп</h3>
      <label>
        Есеп мәтіні
        <textarea value={content} onChange={(e) => setContent(e.target.value)} rows={2} />
      </label>
      <label style={{ flexDirection: 'row', alignItems: 'center', gap: 8 }}>
        <input type="checkbox" checked={usePartWhole} onChange={(e) => setUsePartWhole(e.target.checked)} />
        Бөлік-тұтас көрсеткішін көрсету (қанша белгілі / белгісіз)
      </label>
      {usePartWhole && (
        <div className="two">
          <label>Жалпы сан<input type="number" value={total} onChange={(e) => setTotal(e.target.value)} /></label>
          <label>Белгілі бөлік<input type="number" value={known} onChange={(e) => setKnown(e.target.value)} /></label>
          <label>Белгілі бөлік атауы<input type="text" value={knownLabel} onChange={(e) => setKnownLabel(e.target.value)} /></label>
          <label>Белгісіз бөлік атауы<input type="text" value={unknownLabel} onChange={(e) => setUnknownLabel(e.target.value)} /></label>
        </div>
      )}
      <label>
        Дұрыс жауап (сан)
        <input type="number" value={correctAnswer} onChange={(e) => setCorrectAnswer(e.target.value)} />
      </label>
      <label>
        Кеңес (міндетті емес)
        <input type="text" value={hint} onChange={(e) => setHint(e.target.value)} />
      </label>
      <button type="button" className="button primary" onClick={save} disabled={content.trim() === '' || correctAnswer.trim() === ''}>Сақтау</button>
      <SaveStatus state={saveState} />
    </div>
  )
}

// --- Бекіт editor (list of tasks) ---------------------------------------------

function BekitTaskEditor({
  task, index, total, onChanged, onDeleted, onMove,
}: {
  task: BekitTask
  index: number
  total: number
  onChanged: (updated: BekitTask) => void
  onDeleted: () => void
  onMove: (direction: -1 | 1) => void
}) {
  const [content, setContent] = useState(task.block.content ?? '')
  const [title, setTitle] = useState(task.block.title ?? '')
  const [explanation, setExplanation] = useState(task.question?.explanation ?? '')
  const [correctAnswer, setCorrectAnswer] = useState(String(task.question?.correct_answer ?? ''))
  const [options, setOptions] = useState<string[]>(
    task.options.length ? task.options.map((o) => o.option_text ?? '') : ['', '', '', '']
  )
  const [correctIndex, setCorrectIndex] = useState(Math.max(0, task.options.findIndex((o) => o.is_correct)))
  const [pairsText, setPairsText] = useState(
    ((task.block.configuration.pairs as [number, number][] | undefined) ?? []).map(([a, b]) => `${a},${b}`).join('\n')
  )
  const [visualPairsText, setVisualPairsText] = useState(
    ((task.block.configuration.pairs as { icon: string; label: string }[] | undefined) ?? []).map((p) => `${p.icon},${p.label}`).join('\n')
  )
  const [measureUnit, setMeasureUnit] = useState((task.block.configuration.unit as string) ?? 'см')
  const [measureLength, setMeasureLength] = useState(String((task.block.configuration.length as number) ?? 5))
  const [measureMax, setMeasureMax] = useState(String((task.block.configuration.maxScale as number) ?? 10))
  const [sortItemsText, setSortItemsText] = useState(
    ((task.block.configuration.items as string[] | undefined) ?? []).join('\n')
  )
  const [groupALabel, setGroupALabel] = useState((task.block.configuration.groupALabel as string) ?? 'А тобы')
  const [groupBLabel, setGroupBLabel] = useState((task.block.configuration.groupBLabel as string) ?? 'Ә тобы')
  const [groupItemsText, setGroupItemsText] = useState(
    ((task.block.configuration.items as { label: string; group: 'a' | 'b' }[] | undefined) ?? []).map((i) => `${i.label},${i.group}`).join('\n')
  )
  const [tilesText, setTilesText] = useState(((task.block.configuration.tiles as string[] | undefined) ?? []).join('\n'))
  const [targetText, setTargetText] = useState(((task.block.configuration.target as string[] | undefined) ?? []).join('\n'))
  const [stepsText, setStepsText] = useState(((task.block.configuration.steps as string[] | undefined) ?? []).join('\n'))
  const [errorIndex, setErrorIndex] = useState(String((task.block.configuration.errorIndex as number) ?? 0))
  const [blankTemplate, setBlankTemplate] = useState((task.block.configuration.template as string) ?? '')
  const [blankAnswersText, setBlankAnswersText] = useState(
    ((task.block.configuration.answers as string[] | undefined) ?? []).join('\n')
  )
  const [blankHint, setBlankHint] = useState(task.question?.hint ?? '')
  const [saveState, setSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')
  const [deleting, setDeleting] = useState(false)

  const taskType = bekitUiKind(task)

  async function save() {
    setSaveState('saving')
    const configuration: Record<string, unknown> =
      taskType === 'matching'
        ? { pairs: pairsText.split('\n').map((l) => l.split(',').map((n) => Number(n.trim()))).filter(([a, b]) => Number.isFinite(a) && Number.isFinite(b)) }
        : taskType === 'visual_matching'
        ? {
            kind: 'visual',
            pairs: visualPairsText.split('\n').map((l) => l.split(',')).filter(([icon, label]) => icon?.trim() && label?.trim()).map(([icon, label]) => ({ icon: icon.trim(), label: label.trim() })),
          }
        : taskType === 'measurement'
        ? { kind: 'measurement', unit: measureUnit, length: Number(measureLength), maxScale: Number(measureMax) }
        : taskType === 'sorting'
        ? { items: sortItemsText.split('\n').map((s) => s.trim()).filter(Boolean) }
        : taskType === 'grouping'
        ? {
            groupALabel, groupBLabel,
            items: groupItemsText.split('\n').map((l) => l.split(',')).filter(([label, group]) => label?.trim() && (group?.trim() === 'a' || group?.trim() === 'b')).map(([label, group]) => ({ label: label.trim(), group: group.trim() as 'a' | 'b' })),
          }
        : taskType === 'expression_builder'
        ? { kind: 'expression_builder', tiles: tilesText.split('\n').map((s) => s.trim()).filter(Boolean), target: targetText.split('\n').map((s) => s.trim()).filter(Boolean) }
        : taskType === 'find_error'
        ? { kind: 'find_error', steps: stepsText.split('\n').map((s) => s.trim()).filter(Boolean), errorIndex: Number(errorIndex) }
        : taskType === 'fill_blank'
        ? {
            template: blankTemplate,
            answers: blankAnswersText.split('\n').map((s) => s.trim()).filter(Boolean),
          }
        : {}
    const { error: blockError } = await supabase
      .from('lesson_blocks')
      .update({ title: title || null, content, configuration })
      .eq('id', task.block.id)
    if (blockError) { setSaveState('error'); return }

    let updatedQuestion = task.question
    let updatedOptions = task.options

    if (taskType === 'fill_blank') {
      const answers = (configuration.answers as string[]) ?? []
      const questionPayload = {
        lesson_block_id: task.block.id,
        question_text: blankTemplate,
        question_type: 'fill_blank' as const,
        correct_answer: answers,
        explanation: explanation || null,
        hint: blankHint || null,
        points: 1,
      }
      const { data: q, error: qError } = task.question
        ? await supabase.from('questions').update(questionPayload).eq('id', task.question.id).select('*').single()
        : await supabase.from('questions').insert(questionPayload).select('*').single()
      if (qError || !q) { setSaveState('error'); return }
      updatedQuestion = q
    } else if (taskType === 'expression_builder') {
      const target = (configuration.target as string[]) ?? []
      const questionPayload = {
        lesson_block_id: task.block.id,
        question_text: content,
        question_type: 'expression_builder' as const,
        correct_answer: target.join(' '),
        explanation: explanation || null,
        points: 1,
      }
      const { data: q, error: qError } = task.question
        ? await supabase.from('questions').update(questionPayload).eq('id', task.question.id).select('*').single()
        : await supabase.from('questions').insert(questionPayload).select('*').single()
      if (qError || !q) { setSaveState('error'); return }
      updatedQuestion = q
    } else if (taskType === 'find_error') {
      const questionPayload = {
        lesson_block_id: task.block.id,
        question_text: content,
        question_type: 'find_error' as const,
        correct_answer: Number(errorIndex),
        explanation: explanation || null,
        points: 1,
      }
      const { data: q, error: qError } = task.question
        ? await supabase.from('questions').update(questionPayload).eq('id', task.question.id).select('*').single()
        : await supabase.from('questions').insert(questionPayload).select('*').single()
      if (qError || !q) { setSaveState('error'); return }
      updatedQuestion = q
    } else if (taskType === 'measurement') {
      const questionPayload = {
        lesson_block_id: task.block.id,
        question_text: content,
        question_type: 'measurement' as const,
        correct_answer: Number(measureLength),
        explanation: explanation || null,
        points: 1,
      }
      const { data: q, error: qError } = task.question
        ? await supabase.from('questions').update(questionPayload).eq('id', task.question.id).select('*').single()
        : await supabase.from('questions').insert(questionPayload).select('*').single()
      if (qError || !q) { setSaveState('error'); return }
      updatedQuestion = q
    } else if (taskType === 'multiple_choice') {
      const questionPayload = {
        lesson_block_id: task.block.id,
        question_text: content,
        question_type: 'multiple_choice' as const,
        correct_answer: options[correctIndex] ?? '',
        explanation: explanation || null,
        points: 1,
      }
      const { data: q, error: qError } = task.question
        ? await supabase.from('questions').update(questionPayload).eq('id', task.question.id).select('*').single()
        : await supabase.from('questions').insert(questionPayload).select('*').single()
      if (qError || !q) { setSaveState('error'); return }
      updatedQuestion = q

      // Replace options wholesale — simplest way to keep sort_order/is_correct in sync.
      await supabase.from('question_options').delete().eq('question_id', q.id)
      const rows = options.map((text, i) => ({ question_id: q.id, option_text: text, is_correct: i === correctIndex, sort_order: i }))
      const { data: newOptions, error: optError } = await supabase.from('question_options').insert(rows).select('*')
      if (optError) { setSaveState('error'); return }
      updatedOptions = newOptions ?? []
    } else if (taskType === 'short_answer') {
      const questionPayload = {
        lesson_block_id: task.block.id,
        question_text: content,
        question_type: 'short_answer' as const,
        correct_answer: correctAnswer,
        explanation: explanation || null,
        points: 1,
      }
      const { data: q, error: qError } = task.question
        ? await supabase.from('questions').update(questionPayload).eq('id', task.question.id).select('*').single()
        : await supabase.from('questions').insert(questionPayload).select('*').single()
      if (qError || !q) { setSaveState('error'); return }
      updatedQuestion = q
    }

    setSaveState('saved')
    onChanged({ block: { ...task.block, title: title || null, content, configuration }, question: updatedQuestion, options: updatedOptions })
  }

  async function del() {
    if (!window.confirm('Бұл тапсырманы өшіруді растайсыз ба?')) return
    setDeleting(true)
    const { error } = await supabase.from('lesson_blocks').delete().eq('id', task.block.id)
    setDeleting(false)
    if (!error) onDeleted()
  }

  return (
    <div className="panel">
      <div className="section-title" style={{ marginBottom: 6 }}>
        <h3 style={{ margin: 0 }}>Тапсырма {index + 1} — {BEKIT_KIND_LABEL[taskType]}</h3>
        <div style={{ display: 'flex', gap: 6 }}>
          <button type="button" className="button secondary" disabled={index === 0} onClick={() => onMove(-1)}>↑</button>
          <button type="button" className="button secondary" disabled={index === total - 1} onClick={() => onMove(1)}>↓</button>
        </div>
      </div>

      <label>
        Атауы (тек ішкі белгі үшін, міндетті емес)
        <input type="text" value={title} onChange={(e) => setTitle(e.target.value)} />
      </label>
      <label>
        Тапсырма мәтіні
        <textarea value={content} onChange={(e) => setContent(e.target.value)} rows={2} />
      </label>

      {taskType === 'multiple_choice' && (
        <>
          {options.map((opt, i) => (
            <label key={i} style={{ flexDirection: 'row', alignItems: 'center', gap: 8 }}>
              <input type="radio" name={`correct-${task.block.id}`} checked={correctIndex === i} onChange={() => setCorrectIndex(i)} />
              <input
                type="text"
                value={opt}
                onChange={(e) => setOptions((prev) => prev.map((o, idx) => (idx === i ? e.target.value : o)))}
                placeholder={`${i + 1}-нұсқа`}
                style={{ flex: 1 }}
              />
            </label>
          ))}
          <label>
            Түсіндірме (жауап шыққанда көрінеді, міндетті емес)
            <input type="text" value={explanation} onChange={(e) => setExplanation(e.target.value)} />
          </label>
        </>
      )}

      {taskType === 'short_answer' && (
        <>
          <label>
            Дұрыс жауап
            <input type="text" value={correctAnswer} onChange={(e) => setCorrectAnswer(e.target.value)} />
          </label>
          <label>
            Түсіндірме (міндетті емес)
            <input type="text" value={explanation} onChange={(e) => setExplanation(e.target.value)} />
          </label>
        </>
      )}

      {taskType === 'fill_blank' && (
        <>
          <p className="status" style={{ fontWeight: 400 }}>
            Бос орынның орнына үш төменгі сызық жазыңыз: ___ . Бірнеше бос орын болса, дұрыс жауаптарды төменде сол ретпен жеке жолдарға жазыңыз.
          </p>
          <label>
            Бос орындары бар сөйлем немесе өрнек
            <textarea value={blankTemplate} onChange={(e) => setBlankTemplate(e.target.value)} rows={3} placeholder="7 + ___ = 10" />
          </label>
          <label>
            Дұрыс жауаптар (әр бос орынға бір жауап, жеке жолда)
            <textarea value={blankAnswersText} onChange={(e) => setBlankAnswersText(e.target.value)} rows={3} placeholder={'3'} />
          </label>
          <label>
            Талпынның кеңесі
            <input type="text" value={blankHint} onChange={(e) => setBlankHint(e.target.value)} placeholder="10-ға толықтыратын санды ойлан." />
          </label>
          <label>
            Дұрыс жауаптан кейінгі түсіндірме
            <input type="text" value={explanation} onChange={(e) => setExplanation(e.target.value)} placeholder="7 + 3 = 10." />
          </label>
        </>
      )}

      {taskType === 'matching' && (
        <label>
          Жұптар (әр жолда «сол,оң», мысалы 3,7)
          <textarea value={pairsText} onChange={(e) => setPairsText(e.target.value)} rows={4} placeholder={'1,9\n2,8\n3,7'} />
        </label>
      )}

      {taskType === 'visual_matching' && (
        <label>
          Жұптар (әр жолда «белгіше,атауы», мысалы apple,Алма)
          <textarea value={visualPairsText} onChange={(e) => setVisualPairsText(e.target.value)} rows={4} placeholder={'apple,Алма\nstar,Жұлдыз'} />
        </label>
      )}

      {taskType === 'measurement' && (
        <>
          <div className="two">
            <label>Өлшем бірлігі<input type="text" value={measureUnit} onChange={(e) => setMeasureUnit(e.target.value)} /></label>
            <label>Заттың ұзындығы<input type="number" min={1} value={measureLength} onChange={(e) => setMeasureLength(e.target.value)} /></label>
            <label>Сызғыштың ең үлкен мәні<input type="number" min={2} value={measureMax} onChange={(e) => setMeasureMax(e.target.value)} /></label>
          </div>
          <label>
            Түсіндірме (міндетті емес)
            <input type="text" value={explanation} onChange={(e) => setExplanation(e.target.value)} />
          </label>
        </>
      )}

      {taskType === 'sorting' && (
        <label>
          Дұрыс ретпен элементтер (әр жолда біреу — дұрыс ретпен жазыңыз, оқушыға аралас көрсетіледі)
          <textarea value={sortItemsText} onChange={(e) => setSortItemsText(e.target.value)} rows={4} placeholder={'Бірінші қадам\nЕкінші қадам\nҮшінші қадам'} />
        </label>
      )}

      {taskType === 'grouping' && (
        <>
          <div className="two">
            <label>А тобының атауы<input type="text" value={groupALabel} onChange={(e) => setGroupALabel(e.target.value)} /></label>
            <label>Ә тобының атауы<input type="text" value={groupBLabel} onChange={(e) => setGroupBLabel(e.target.value)} /></label>
          </div>
          <label>
            Элементтер (әр жолда «атауы,a» немесе «атауы,b»)
            <textarea value={groupItemsText} onChange={(e) => setGroupItemsText(e.target.value)} rows={4} placeholder={'5,a\n12,b'} />
          </label>
        </>
      )}

      {taskType === 'expression_builder' && (
        <>
          <label>
            Тіркестер (әр жолда біреу — оқушы басатын барлық «текше» сөздер/сандар)
            <textarea value={tilesText} onChange={(e) => setTilesText(e.target.value)} rows={4} placeholder={'5\n+\n3\n=\n8'} />
          </label>
          <label>
            Дұрыс рет (тек дұрыс жауапты құрайтын тіркестер, ретімен)
            <textarea value={targetText} onChange={(e) => setTargetText(e.target.value)} rows={3} placeholder={'5\n+\n3\n=\n8'} />
          </label>
          <label>
            Түсіндірме (міндетті емес)
            <input type="text" value={explanation} onChange={(e) => setExplanation(e.target.value)} />
          </label>
        </>
      )}

      {taskType === 'find_error' && (
        <>
          <label>
            Қадамдар (әр жолда біреу)
            <textarea value={stepsText} onChange={(e) => setStepsText(e.target.value)} rows={4} placeholder={'5 + 3 = 8\n8 − 2 = 5\n5 + 1 = 7'} />
          </label>
          <label>
            Қате қадамның нөмірі (0-ден бастап санау)
            <input type="number" min={0} value={errorIndex} onChange={(e) => setErrorIndex(e.target.value)} />
          </label>
          <label>
            Түсіндірме (міндетті емес)
            <input type="text" value={explanation} onChange={(e) => setExplanation(e.target.value)} />
          </label>
        </>
      )}

      <div className="actions">
        <button type="button" className="button primary" onClick={save} disabled={content.trim() === ''}>Сақтау</button>
        <button type="button" className="button secondary" onClick={del} disabled={deleting}>{deleting ? 'Өшірілуде...' : 'Тапсырманы өшіру'}</button>
      </div>
      <SaveStatus state={saveState} />
    </div>
  )
}

const BEKIT_KIND_TO_BLOCK_TYPE: Record<BekitUiKind, string> = {
  multiple_choice: 'multiple_choice',
  short_answer: 'short_answer',
  matching: 'matching',
  visual_matching: 'matching',
  sorting: 'ordering',
  grouping: 'drag_drop',
  expression_builder: 'question',
  find_error: 'question',
  measurement: 'question',
  fill_blank: 'fill_blank',
}

function BekitEditor({ topicId, initialTasks }: { topicId: string; initialTasks: BekitTask[] }) {
  const [tasks, setTasks] = useState<BekitTask[]>(initialTasks)
  const [newType, setNewType] = useState<BekitUiKind>('multiple_choice')
  const [adding, setAdding] = useState(false)

  async function addTask() {
    setAdding(true)
    const blockType = BEKIT_KIND_TO_BLOCK_TYPE[newType]
    const configuration =
      newType === 'visual_matching' ? { kind: 'visual', pairs: [] } :
      newType === 'expression_builder' ? { kind: 'expression_builder', tiles: [], target: [] } :
      newType === 'find_error' ? { kind: 'find_error', steps: [], errorIndex: 0 } :
      newType === 'measurement' ? { kind: 'measurement', unit: 'см', length: 5, maxScale: 10 } :
      newType === 'fill_blank' ? { template: '', answers: [] } :
      {}
    const { data: block, error } = await supabase
      .from('lesson_blocks')
      .insert({ topic_id: topicId, stage: 'bekit', block_type: blockType, content: '', configuration, sort_order: tasks.length })
      .select('*')
      .single()
    setAdding(false)
    if (error || !block) return
    setTasks((prev) => [...prev, { block, question: null, options: [] }])
  }

  function updateTask(id: string, updated: BekitTask) {
    setTasks((prev) => prev.map((t) => (t.block.id === id ? updated : t)))
  }

  function removeTask(id: string) {
    setTasks((prev) => prev.filter((t) => t.block.id !== id))
  }

  async function moveTask(index: number, direction: -1 | 1) {
    const targetIndex = index + direction
    if (targetIndex < 0 || targetIndex >= tasks.length) return
    const reordered = [...tasks]
    ;[reordered[index], reordered[targetIndex]] = [reordered[targetIndex], reordered[index]]
    setTasks(reordered)
    // Persist the new sort_order for both swapped rows.
    await Promise.all([
      supabase.from('lesson_blocks').update({ sort_order: index }).eq('id', reordered[index].block.id),
      supabase.from('lesson_blocks').update({ sort_order: targetIndex }).eq('id', reordered[targetIndex].block.id),
    ])
  }

  return (
    <div>
      <h3 style={{ marginBottom: 12 }}>Бекіт — қорытынды тапсырмалар ({tasks.length})</h3>
      {tasks.length === 0 && <p className="status">Әзірге тапсырма жоқ. Кемінде біреуін қосыңыз.</p>}

      <div style={{ display: 'flex', flexDirection: 'column', gap: 14, marginBottom: 18 }}>
        {tasks.map((task, i) => (
          <BekitTaskEditor
            key={task.block.id}
            task={task}
            index={i}
            total={tasks.length}
            onChanged={(updated) => updateTask(task.block.id, updated)}
            onDeleted={() => removeTask(task.block.id)}
            onMove={(direction) => moveTask(i, direction)}
          />
        ))}
      </div>

      <div className="panel">
        <h3>Жаңа тапсырма қосу</h3>
        <label>
          Тапсырма түрі
          <select value={newType} onChange={(e) => setNewType(e.target.value as BekitUiKind)}>
            <option value="multiple_choice">Көп таңдау (4 нұсқа)</option>
            <option value="short_answer">Қысқа жауап (сан/сөз)</option>
            <option value="matching">Сәйкестендіру (сан жұптары)</option>
            <option value="sorting">Ретке қою</option>
            <option value="grouping">Топтастыру (2 топ)</option>
            <option value="visual_matching">Сәйкестендіру (сурет-атау)</option>
            <option value="expression_builder">Өрнек құрастыру (текшелерден)</option>
            <option value="find_error">Қатені тап (қадамдардан)</option>
            <option value="measurement">Сызғышпен өлшеу</option>
            <option value="fill_blank">Бос орынды толтыру</option>
          </select>
        </label>
        <button type="button" className="button primary" onClick={addTask} disabled={adding}>
          {adding ? 'Қосылуда...' : 'Тапсырма қосу'}
        </button>
      </div>
    </div>
  )
}

// --- Main page ------------------------------------------------------------

export function TeacherConstructorPage() {
  const { topicId } = useParams<{ topicId: string }>()
  const { profile } = useAuth()
  const navigate = useNavigate()
  const isNew = topicId === 'new'

  const [topic, setTopic] = useState<Topic | null>(null)
  const [status, setStatus] = useState<'loading' | 'ready' | 'not-found' | 'error'>(isNew ? 'ready' : 'loading')

  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')
  const [learningObjective, setLearningObjective] = useState('')
  const [grade, setGrade] = useState(1)
  const [track, setTrack] = useState<Track>('base')
  const [metaSaveState, setMetaSaveState] = useState<'idle' | 'saving' | 'saved' | 'error'>('idle')
  const [createError, setCreateError] = useState<string | null>(null)

  const [korBlock, setKorBlock] = useState<LessonBlock | null>(null)
  const [qurastyrBlock, setQurastyrBlock] = useState<LessonBlock | null>(null)
  const [tusindirBlock, setTusindirBlock] = useState<LessonBlock | null>(null)
  const [qoldanBlock, setQoldanBlock] = useState<LessonBlock | null>(null)
  const [qoldanQuestion, setQoldanQuestion] = useState<Question | null>(null)
  const [bekitTasks, setBekitTasks] = useState<BekitTask[]>([])

  useEffect(() => {
    if (isNew || !topicId || !profile) return
    let isMounted = true
    async function load() {
      const { data: topicData, error } = await supabase.from('topics').select('*').eq('id', topicId).single()
      if (!isMounted) return
      if (error || !topicData) { setStatus('not-found'); return }
      if (topicData.created_by !== profile!.id && profile!.role !== 'admin') { setStatus('not-found'); return }

      setTopic(topicData)
      setTitle(topicData.title)
      setDescription(topicData.description ?? '')
      setLearningObjective(topicData.learning_objective ?? '')
      setGrade(topicData.grade)
      setTrack(topicData.track)

      const { data: blocks } = await supabase.from('lesson_blocks').select('*').eq('topic_id', topicId).order('sort_order', { ascending: true })
      const all = blocks ?? []
      setKorBlock(all.find((b) => b.stage === 'kor') ?? null)
      setQurastyrBlock(all.find((b) => b.stage === 'qurastyr') ?? null)
      setTusindirBlock(all.find((b) => b.stage === 'tusindir') ?? null)
      const qBlock = all.find((b) => b.stage === 'qoldan') ?? null
      setQoldanBlock(qBlock)
      const bekitBlocks = all.filter((b) => b.stage === 'bekit')

      const blockIds = all.map((b) => b.id)
      const { data: questionData } = blockIds.length
        ? await supabase.from('questions').select('*').in('lesson_block_id', blockIds)
        : { data: [] as Question[] }
      const questions = questionData ?? []
      setQoldanQuestion(questions.find((q) => q.lesson_block_id === qBlock?.id) ?? null)

      const questionIds = questions.map((q) => q.id)
      const { data: optionData } = questionIds.length
        ? await supabase.from('question_options').select('*').in('question_id', questionIds).order('sort_order', { ascending: true })
        : { data: [] as QuestionOption[] }

      setBekitTasks(
        bekitBlocks.map((block) => {
          const question = questions.find((q) => q.lesson_block_id === block.id) ?? null
          const options = (optionData ?? []).filter((o) => o.question_id === question?.id)
          return { block, question, options }
        })
      )
      setStatus('ready')
    }
    load()
    return () => { isMounted = false }
  }, [topicId, profile, isNew])

  async function createTopic() {
    if (!profile) return
    setCreateError(null)
    setMetaSaveState('saving')
    const { data, error } = await supabase
      .from('topics')
      .insert({
        title: title.trim(),
        description: description.trim() || null,
        learning_objective: learningObjective.trim() || null,
        grade,
        track,
        status: 'draft',
        sort_order: 999,
        created_by: profile.id,
      })
      .select('*')
      .single()
    if (error || !data) {
      setMetaSaveState('error')
      setCreateError('Тақырыпты жасау кезінде қате шықты.')
      return
    }
    navigate(`/teacher/constructor/${data.id}`, { replace: true })
  }

  async function saveMeta() {
    if (!topic) return
    setMetaSaveState('saving')
    const { error } = await supabase
      .from('topics')
      .update({
        title: title.trim(),
        description: description.trim() || null,
        learning_objective: learningObjective.trim() || null,
        grade,
        track,
      })
      .eq('id', topic.id)
    if (!error) setTopic({ ...topic, title: title.trim(), description: description.trim() || null, learning_objective: learningObjective.trim() || null, grade, track })
    setMetaSaveState(error ? 'error' : 'saved')
  }

  async function togglePublish() {
    if (!topic) return
    const nextStatus = topic.status === 'published' ? 'draft' : 'published'
    if (nextStatus === 'published') {
      const missing: string[] = []
      if (!korBlock) missing.push('Көр')
      if (!qurastyrBlock) missing.push('Құрастыр')
      if (!tusindirBlock) missing.push('Түсіндір')
      if (!qoldanBlock) missing.push('Қолдан')
      if (bekitTasks.length === 0) missing.push('Бекіт')
      if (missing.length > 0) {
        window.alert(`Жариялау алдында мына кезеңдерді толтырыңыз: ${missing.join(', ')}.`)
        return
      }
    }
    const { error } = await supabase.from('topics').update({ status: nextStatus }).eq('id', topic.id)
    if (!error) setTopic({ ...topic, status: nextStatus })
  }

  if (!isNew && status === 'loading') {
    return <div className="shell section"><div className="skeleton-block" style={{ height: 300, borderRadius: 20 }} /></div>
  }
  if (!isNew && status === 'not-found') {
    return (
      <section className="shell section">
        <div className="empty-state">
          <b>Тақырып табылмады</b>
          <p>Бұл тақырыпты құрастыруға рұқсатыңыз жоқ (тек өзіңіз жасаған тақырыптарды өңдей аласыз) немесе ол жойылған.</p>
          <Link className="text-button" to="/teacher">Мұғалім кабинетіне оралу</Link>
        </div>
      </section>
    )
  }

  return (
    <section className="shell section">
      <span className="eyebrow">Мұғалім кабинеті</span>
      <div className="section-title">
        <h2 style={{ margin: '8px 0 0' }}>{isNew ? 'Жаңа тақырып құру' : `Құрастырушы — ${topic?.title}`}</h2>
        <Link className="text-button" to="/teacher">← Тақырыптарыма оралу</Link>
      </div>

      <div className="panel" style={{ marginBottom: 24 }}>
        <h3>Тақырып туралы</h3>
        <label>
          Атауы
          <input type="text" value={title} onChange={(e) => setTitle(e.target.value)} />
        </label>
        <label>
          Қысқаша сипаттама
          <textarea value={description} onChange={(e) => setDescription(e.target.value)} rows={2} />
        </label>
        <label>
          Оқу мақсаты (міндетті емес)
          <input type="text" value={learningObjective} onChange={(e) => setLearningObjective(e.target.value)} />
        </label>
        <div className="two">
          <label>
            Сынып
            <select value={grade} onChange={(e) => setGrade(Number(e.target.value))}>
              {[1, 2, 3, 4].map((g) => <option key={g} value={g}>{g}-сынып</option>)}
            </select>
          </label>
          <label>
            Бағыт
            <select value={track} onChange={(e) => setTrack(e.target.value as Track)}>
              <option value="base">{TRACK_LABEL.base}</option>
              <option value="logic">{TRACK_LABEL.logic}</option>
            </select>
          </label>
        </div>

        {isNew ? (
          <button type="button" className="button primary" onClick={createTopic} disabled={title.trim() === '' || metaSaveState === 'saving'}>
            {metaSaveState === 'saving' ? 'Жасалуда...' : 'Тақырыпты жасау'}
          </button>
        ) : (
          <div className="actions">
            <button type="button" className="button primary" onClick={saveMeta} disabled={title.trim() === ''}>Сақтау</button>
            <button type="button" className="button secondary" onClick={togglePublish}>
              {topic?.status === 'published' ? 'Жобаға қайтару' : 'Жариялау'}
            </button>
            <span className="status" style={{ alignSelf: 'center' }}>
              Күйі: {topic?.status === 'published' ? 'Жарияланған' : topic?.status === 'archived' ? 'Мұрағатталған' : 'Жоба'}
            </span>
          </div>
        )}
        {createError && <p className="form-error">{createError}</p>}
        <SaveStatus state={metaSaveState} />
      </div>

      {!isNew && topic && (
        <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>
          <KorEditor topicId={topic.id} initial={korBlock} />
          <QurastyrEditor topicId={topic.id} initial={qurastyrBlock} />
          <TusindirEditor topicId={topic.id} initial={tusindirBlock} />
          <QoldanEditor topicId={topic.id} initialBlock={qoldanBlock} initialQuestion={qoldanQuestion} />
          <BekitEditor topicId={topic.id} initialTasks={bekitTasks} />
        </div>
      )}

      {isNew && (
        <p className="status">Алдымен жоғарыдағы мәліметтерді толтырып, «Тақырыпты жасау» батырмасын басыңыз — содан кейін 5 кезеңді толтыру беті ашылады.</p>
      )}
    </section>
  )
}
