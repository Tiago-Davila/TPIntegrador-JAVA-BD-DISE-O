import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom'; // Importamos router
import { SidebarLeft } from './components/SidebarLeft';
import { SidebarRight } from './components/SidebarRight';
import { Feed } from './components/Feed';
import { UserProfile } from './components/UserProfile'; // Importamos el nuevo componente

function App() {
  return (
    // 1. Envolvemos toda la app en BrowserRouter
    <BrowserRouter>
        <div className="min-h-screen bg-background text-textMain flex flex-col">
        
        {/* Header Móvil (Opcional) */}
        <header className="md:hidden flex justify-between items-center p-4 border-b border-gray-800 sticky top-0 bg-background z-50">
            <div className="w-8 h-8 bg-gradient-to-tr from-blue-600 to-red-600 rounded-full flex items-center justify-center">
                <span className="font-bold text-white text-xs">SR</span>
            </div>
        </header>

        {/* Layout Principal de Grid */}
        <div className="flex flex-1 relative overflow-hidden">
            
            {/* Sidebar Izquierda (Navegación) */}
            <SidebarLeft />

            {/* Contenido Central con Rutas */}
            <div className="flex flex-col flex-1 relative overflow-y-auto scrollbar-hide" style={{ maxHeight: '100vh' }}>
                
                {/* Top Auth Bar (Solo Desktop) */}
                

                {/* 2. Definimos las Rutas aquí */}
                <Routes>
                    {/* Ruta para el inicio (Feed) */}
                    <Route path="/" element={<Feed />} />
                    
                    {/* Ruta para el perfil */}
                    <Route path="/perfil" element={<UserProfile />} />

                    {/* Redireccionar cualquier otra ruta al inicio */}
                    <Route path="*" element={<Navigate to="/" replace />} />
                </Routes>
            </div>

            {/* Sidebar Derecha */}
            <SidebarRight />
            
        </div>
        </div>
    </BrowserRouter>
  );
}

export default App;