import React from 'react';
import { SidebarLeft } from './components/SidebarLeft';
import { SidebarRight } from './components/SidebarRight';
import { Feed } from './components/Feed';

function App() {
  return (
    <div className="min-h-screen bg-background text-textMain flex flex-col">
      
      {/* Top Mobile Header (Optional, mostly for mobile visibility of brand) */}
      <header className="md:hidden flex justify-between items-center p-4 border-b border-gray-800 sticky top-0 bg-background z-50">
        <div className="w-8 h-8 bg-gradient-to-tr from-blue-600 to-red-600 rounded-full flex items-center justify-center">
             <span className="font-bold text-white text-xs">SR</span>
        </div>
        <div className="flex gap-2">
            <button className="bg-primary text-white px-3 py-1 rounded text-xs font-bold">LOGIN</button>
        </div>
      </header>

      {/* Main Grid Layout */}
      <div className="flex flex-1">
        
        {/* Left Sidebar */}
        <SidebarLeft />

        {/* Center Content with Top Auth Bar */}
        <div className="flex flex-col flex-1 relative">
            {/* Top Auth Bar (Desktop) - Floats absolute top right or flex justify-end */}
            <div className="absolute top-4 right-4 flex gap-3 z-10 hidden md:flex">
                <button className="bg-primary hover:bg-red-700 text-white font-bold py-1.5 px-6 rounded-full text-sm transition-colors shadow-lg">
                    INICIAR SESION
                </button>
                <button className="bg-gray-400 hover:bg-gray-300 text-black font-bold py-1.5 px-6 rounded-full text-sm transition-colors shadow-lg">
                    REGISTRARSE
                </button>
            </div>

            <Feed />
        </div>

        {/* Right Sidebar */}
        <SidebarRight />
        
      </div>
    </div>
  );
}

export default App;
