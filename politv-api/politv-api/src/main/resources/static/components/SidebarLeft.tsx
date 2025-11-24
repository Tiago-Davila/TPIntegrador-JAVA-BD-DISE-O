import React from 'react';
import { NavLink, Link } from 'react-router-dom'; // IMPORTANTE: Usar Link/NavLink
import { Home, Search, Calendar, CheckCircle, Circle, Settings, User } from 'lucide-react';

export const SidebarLeft: React.FC = () => {
  return (
    <aside className="hidden md:flex flex-col w-64 h-screen sticky top-0 border-r border-gray-800 bg-background pt-4 pb-6 px-4 overflow-y-auto">
      {/* Logo Area */}
      <Link to="/" className="mb-8 px-2 block">
        <div className="w-10 h-10 bg-gradient-to-tr from-blue-600 to-red-600 rounded-full flex items-center justify-center cursor-pointer hover:opacity-90 transition-opacity">
             <span className="font-bold text-white">SR</span>
        </div>
      </Link>

      {/* Main Navigation */}
      <nav className="space-y-1 mb-8">
        {/* Usamos NavLink para que detecte automáticamente si está activo */}
        <NavItem to="/" icon={<Home size={20} />} label="Inicio" />
        <NavItem to="/buscar" icon={<Search size={20} />} label="Buscar" />
        <NavItem to="/calendario" icon={<Calendar size={20} />} label="Calendario" />
      </nav>

      <hr className="border-gray-700 mb-6" />

      {/* Favorites Section (Sin cambios por ahora) */}
      <div className="mb-8">
        <h3 className="text-gray-400 text-sm font-semibold mb-3 uppercase tracking-wider px-2">Favoritos</h3>
        <div className="space-y-3">
            <FavoriteItem name="Bendita" imageUrl="https://ui-avatars.com/api/?name=Bendita&background=random" />
            <FavoriteItem name="Tyc_Sports" imageUrl="https://ui-avatars.com/api/?name=TyC&background=random" />
            <FavoriteItem name="Telefe" imageUrl="https://ui-avatars.com/api/?name=Telefe&background=random" />
        </div>
      </div>

      <hr className="border-gray-700 mb-6" />

      {/* Resources/Settings Section */}
      <div>
        <h3 className="text-gray-400 text-sm font-semibold mb-3 uppercase tracking-wider px-2">Recursos</h3>
        <nav className="space-y-1">
           {/* Agregamos el link al Perfil aquí */}
          <NavItem to="/perfil" icon={<User size={20} className="text-primary" />} label="Perfil" />
          <NavItem to="/configuracion" icon={<Settings size={20} />} label="Configuración" />
        </nav>
      </div>
    </aside>
  );
};

// Actualizamos NavItem para usar NavLink y aceptar una prop 'to'
const NavItem = ({ icon, label, to }: { icon: React.ReactNode, label: string, to: string }) => (
  <NavLink
    to={to}
    className={({ isActive }) => `flex items-center gap-3 px-3 py-2 rounded-md transition-colors ${
      isActive 
        ? 'bg-white/10 text-white font-bold' // Estilo activo
        : 'text-gray-400 hover:bg-white/5 hover:text-white' // Estilo inactivo
    }`}
  >
    {icon}
    <span className="text-sm">{label}</span>
  </NavLink>
);

// (FavoriteItem queda igual...)
const FavoriteItem = ({ name, imageUrl }: { name: string, imageUrl: string }) => (
    <a href="#" className="flex items-center gap-3 px-2 py-1 group">
        <img src={imageUrl} alt={name} className="w-6 h-6 rounded-full object-cover ring-2 ring-transparent group-hover:ring-primary transition-all" />
        <span className="text-sm text-gray-300 group-hover:text-white transition-colors">{name}</span>
    </a>
);