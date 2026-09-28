-- Adds extended interactive task types to an existing Talpyn database.
alter type public.block_type add value if not exists 'fill_blank';
alter type public.question_type add value if not exists 'fill_blank';
