import { Route, Routes } from 'react-router-dom'
import { MainLayout } from '@/layouts/MainLayout'
import { ProtectedRoute } from '@/components/ProtectedRoute'
import { HomePage } from '@/pages/HomePage'
import { TopicsPage } from '@/pages/TopicsPage'
import { MethodologyPage } from '@/pages/MethodologyPage'
import { AuthorPage } from '@/pages/AuthorPage'
import { LessonPage } from '@/pages/LessonPage'
import { LoginPage } from '@/pages/LoginPage'
import { RegisterPage } from '@/pages/RegisterPage'
import { StudentProfilePage } from '@/pages/StudentProfilePage'
import { TeacherDashboardPage } from '@/pages/TeacherDashboardPage'
import { TeacherMediaPage } from '@/pages/TeacherMediaPage'
import { TeacherConstructorPage } from '@/pages/TeacherConstructorPage'
import { AdminDashboardPage } from '@/pages/AdminDashboardPage'
import { NotFoundPage } from '@/pages/NotFoundPage'

export default function App() {
  return (
    <Routes>
      <Route element={<MainLayout />}>
        <Route index element={<HomePage />} />
        <Route path="topics" element={<TopicsPage />} />
        <Route path="methodology" element={<MethodologyPage />} />
        <Route path="author" element={<AuthorPage />} />
        <Route path="lesson/:topicId" element={<LessonPage />} />
        <Route path="login" element={<LoginPage />} />
        <Route path="register" element={<RegisterPage />} />

        <Route path="profile" element={<ProtectedRoute requiredRole="student"><StudentProfilePage /></ProtectedRoute>} />
        <Route path="teacher" element={<ProtectedRoute requiredRole="teacher"><TeacherDashboardPage /></ProtectedRoute>} />
        <Route path="teacher/media/:topicId" element={<ProtectedRoute requiredRole="teacher"><TeacherMediaPage /></ProtectedRoute>} />
        <Route path="teacher/constructor/:topicId" element={<ProtectedRoute requiredRole="teacher"><TeacherConstructorPage /></ProtectedRoute>} />
        <Route path="admin" element={<ProtectedRoute requiredRole="admin"><AdminDashboardPage /></ProtectedRoute>} />

        <Route path="*" element={<NotFoundPage />} />
      </Route>
    </Routes>
  )
}
