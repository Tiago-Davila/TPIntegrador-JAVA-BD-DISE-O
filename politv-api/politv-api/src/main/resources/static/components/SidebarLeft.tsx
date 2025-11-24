import React from 'react';
import { Home, Search, Calendar, CheckCircle, Circle, Settings, User, Tv } from 'lucide-react';

export const SidebarLeft: React.FC = () => {
  return (
    <aside className="hidden md:flex flex-col w-64 h-screen sticky top-0 border-r border-gray-800 bg-background pt-4 pb-6 px-4 overflow-y-auto">
      {/* Logo Area */}
      <div className="mb-8 px-2">
        {/* Placeholder for the Logo in the image */}
        <div className="w-10 h-10 bg-gradient-to-tr from-blue-600 to-red-600 rounded-full flex items-center justify-center">
             <span className="font-bold text-white">SR</span>
        </div>
      </div>

      {/* Main Navigation */}
      <nav className="space-y-1 mb-8">
        <NavItem icon={<Home size={20} />} label="Inicio" active />
        <NavItem icon={<Search size={20} />} label="Buscar" />
        <NavItem icon={<Calendar size={20} />} label="Calendario" />
      </nav>

      <hr className="border-gray-700 mb-6" />

      {/* Favorites Section */}
      <div className="mb-8">
        <h3 className="text-gray-400 text-sm font-semibold mb-3 uppercase tracking-wider px-2">Favoritos</h3>
        <div className="space-y-3">
            <FavoriteItem name="Bendita" imageUrl="https://picsum.photos/seed/bendita/24/24" />
            <FavoriteItem name="Tyc_Sports" imageUrl="https://picsum.photos/seed/tyc/24/24" />
            <FavoriteItem name="Telefe" imageUrl="https://picsum.photos/seed/telefe/24/24" />
            <FavoriteItem name="Corta por Lozano" imageUrl="https://picsum.photos/seed/lozano/24/24" />
        </div>
      </div>

      <hr className="border-gray-700 mb-6" />

      {/* Resources/Settings Section */}
      <div>
        <h3 className="text-gray-400 text-sm font-semibold mb-3 uppercase tracking-wider px-2">Recursos</h3>
        <nav className="space-y-1">
          <NavItem icon={<CheckCircle size={20} className="text-blue-400" />} label="Suscribirse" />
          <NavItem icon={<Circle size={20} className="text-gray-400" />} label="Invitado" />
          <NavItem icon={<Settings size={20} />} label="Configuración" />
        </nav>
      </div>
    </aside>
  );
};

const NavItem = ({ icon, label, active = false }: { icon: React.ReactNode, label: string, active?: boolean }) => (
  <a
    href="#"
    className={`flex items-center gap-3 px-3 py-2 rounded-md transition-colors ${
      active 
        ? 'bg-white/10 text-white' 
        : 'text-gray-400 hover:bg-white/5 hover:text-white'
    }`}
  >
    {icon}
    <span className="text-sm font-medium">{label}</span>
  </a>
);

const FavoriteItem = ({ name, imageUrl }: { name: string, imageUrl: string }) => (
    <a href="#" className="flex items-center gap-3 px-2 py-1 group">
        <img src={imageUrl} alt={name} className="w-6 h-6 rounded-full object-cover ring-2 ring-transparent group-hover:ring-primary transition-all" />
        <span className="text-sm text-gray-300 group-hover:text-white transition-colors">{name}</span>
    </a>
);
