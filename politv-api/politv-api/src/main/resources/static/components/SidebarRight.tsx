import React, { useEffect, useState } from 'react';
import { Wifi } from 'lucide-react';
import { Community } from '../types';
import { fetchLiveCommunities } from '../services/api';

export const SidebarRight: React.FC = () => {
    const [communities, setCommunities] = useState<Community[]>([]);

    useEffect(() => {
        fetchLiveCommunities().then(setCommunities);
    }, []);

  return (
    <aside className="hidden lg:flex flex-col w-80 h-screen sticky top-0 border-l border-gray-800 bg-background pt-8 px-6 gap-8 overflow-y-auto">
      
      {/* Live Communities Section */}
      <div className="bg-card rounded-xl border border-gray-800 p-4 shadow-lg">
        <h3 className="text-primary font-bold text-lg mb-4 border-b border-gray-700 pb-2">
            Comunidades en Vivo
        </h3>
        <div className="space-y-3">
            {communities.map(comm => (
                <div key={comm.id} className="flex items-center justify-between bg-white/5 p-2 rounded-lg hover:bg-white/10 cursor-pointer transition-colors">
                    <div className="flex items-center gap-3">
                        <img src={comm.logoUrl} alt={comm.name} className="w-8 h-8 rounded-full" />
                        <span className="text-sm font-medium text-gray-200">{comm.name}</span>
                    </div>
                    <div className="flex items-center text-gray-400">
                        <Wifi size={18} className="animate-pulse" />
                        {/* Simulate signal waves icon roughly */}
                        <span className="text-xs ml-1">((•))</span> 
                    </div>
                </div>
            ))}
        </div>
      </div>

      {/* VIP Subscription Card */}
      <div className="bg-card rounded-xl border border-red-900/30 p-5 relative overflow-hidden">
        <div className="absolute top-0 left-0 w-1 h-full bg-primary"></div>
        <h3 className="text-xl font-bold text-primary mb-2">Suscribite Vip</h3>
        <p className="text-sm text-gray-400 mb-4 leading-relaxed">
            Suscribite para obtener todas las notificaciones en vivo, beneficios y más.
        </p>
        <button className="w-full bg-primary hover:bg-red-700 text-white font-bold py-2 px-4 rounded-full transition-colors shadow-lg shadow-red-900/20">
            Suscribirse Vip
        </button>
      </div>

    </aside>
  );
};
