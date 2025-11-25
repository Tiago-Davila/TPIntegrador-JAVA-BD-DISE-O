// src/App.tsx
import React from 'react';
import { BrowserRouter, Routes, Route, Navigate, Outlet } from 'react-router-dom';
import { SidebarLeft } from './components/SidebarLeft';
import { SidebarRight } from './components/SidebarRight'; // La barra derecha "genérica" del inicio
import { Feed } from './components/Feed';
import { UserProfile } from './components/UserProfile';
import { ProgramProfilePage } from './pages/ProgramProfilePage'; // Importamos la nueva página

// Layout para páginas "normales" (Inicio, Perfil) que usan la barra derecha genérica
const MainLayout = () => (
    <>
        {/* Contenido Central (Feed o Perfil) */}
        <div className="flex flex-col flex-1 relative overflow-y-auto scrollbar-hide">
            {/* Top Auth Bar (Desktop) */}
            <div className="absolute top-4 right-4 flex gap-3 z-20 hidden md:flex">
                
            </div>
            <Outlet /> {/* Aquí se renderiza Feed o UserProfile */}
        </div>
        {/* Barra derecha genérica */}
        <SidebarRight />
    </>
);

function App() {
  return (
    <BrowserRouter>
        <div className="min-h-screen bg-background text-textMain flex flex-col">
        {/* Header Móvil (Opcional, se mantiene igual) */}
        <header className="md:hidden flex justify-between items-center p-4 border-b border-gray-800 sticky top-0 bg-background z-50">
            <div className="w-8 h-8 bg-gradient-to-tr from-blue-600 to-red-600 rounded-full flex items-center justify-center"><span className="font-bold text-white text-xs">SR</span></div>
        </header>

        <div className="flex flex-1 relative overflow-hidden">
            
            {/* Sidebar Izquierda (Siempre visible) */}
            <SidebarLeft />

            {/* RUTAS */}
            <Routes>
    {/* Rutas con Sidebar Derecho Genérico */}
    <Route element={<MainLayout />}>
        <Route path="/" element={<Feed />} />
        
        {/* OPCIÓN A: Ruta dinámica obligatoria (siempre necesita ID: /perfil/1) */}
        <Route path="/perfil/:id" element={<UserProfile />} />
        
        {/* OPCIÓN B (Recomendada): Ruta flexible. 
            Captura tanto "/perfil" (para tu propio usuario) como "/perfil/5" (para otros) */}
        <Route path="/perfil" element={<UserProfile />} />
    </Route>

    {/* Ruta del Programa */}
    <Route path="/programa/:id" element={<ProgramProfilePage />} />

    <Route path="*" element={<Navigate to="/" replace />} />
</Routes>
            
        </div>
        </div>
    </BrowserRouter>
  );
}

export default App;