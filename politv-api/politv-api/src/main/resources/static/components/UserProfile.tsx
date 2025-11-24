import React, { useEffect, useState } from 'react';
import { UserProfileFull } from '../types';
import { fetchUserProfile } from '../services/api';

export const UserProfile: React.FC = () => {
    const [user, setUser] = useState<UserProfileFull | null>(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        loadProfile();
    }, []);

    const loadProfile = async () => {
        setLoading(true);
        try {
            const data = await fetchUserProfile();
            setUser(data);
        } catch (error) {
            console.error("Error cargando perfil:", error);
        } finally {
            setLoading(false);
        }
    };

    if (loading) {
        return (
            <div className="flex-1 flex justify-center items-center h-screen">
                <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-primary"></div>
            </div>
        );
    }

    if (!user) {
        return <div className="flex-1 p-8 text-center text-gray-400">No se pudo cargar el perfil.</div>;
    }

    return (
        <main className="flex-1 min-h-screen px-8 py-12 max-w-5xl mx-auto w-full overflow-y-auto">
            
            {/* Header del Perfil (Avatar grande y nombres) */}
            <div className="flex items-center gap-6 mb-12">
                <img 
                    src={user.avatarUrl} 
                    alt={user.username} 
                    className="w-32 h-32 rounded-full object-cover border-4 border-card shadow-xl"
                />
                <div>
                    <h1 className="text-4xl font-bold text-white mb-1">{user.username}</h1>
                    <p className="text-xl text-gray-400 font-light">{user.handle}</p>
                </div>
            </div>

            {/* Sección: Información de la Cuenta */}
            <section className="mb-12 animate-fadeIn">
                <h2 className="text-2xl font-medium text-gray-200 mb-6">Informacion de la Cuenta</h2>
                
                <div className="space-y-5 max-w-3xl">
                    {/* Campo: Mail */}
                    <InfoField label="Mail:" value={user.email} />
                    
                    {/* Campo: Nombre */}
                    <InfoField label="Nombre:" value={user.fullName} />
                    
                    {/* Campo: Teléfono */}
                    <InfoField label="Teléfono:" value={user.phone} />

                     {/* Campo: Contraseña (Placeholder visual) */}
                    <div className="flex items-center">
                        <label className="w-32 text-xl text-gray-400 font-light">Contraseña:</label>
                        <div className="flex-1 bg-gray-300 rounded-full px-6 py-3">
                            <span className="text-gray-800 text-xl tracking-widest">••••••••</span>
                        </div>
                    </div>
                </div>
            </section>

            {/* Sección: Suscripciones */}
            <section className="animate-fadeIn" style={{ animationDelay: "0.2s" }}>
                <h2 className="text-2xl font-medium text-gray-200 mb-6">Suscripciones</h2>
                
                <div className="space-y-4 max-w-3xl">
                    {user.subscriptions.map(sub => (
                        <div key={sub.id} className="bg-[#1E2126] hover:bg-card transition-colors rounded-3xl p-4 flex items-center gap-6 border border-white/5">
                            <img src={sub.logoUrl} alt={sub.name} className="w-16 h-16 rounded-full object-cover" />
                            
                            <div className="flex flex-col">
                                {/* Si el handle y el nombre son diferentes, mostramos ambos, si no, solo el nombre */}
                                {sub.handle !== sub.name ? (
                                    <>
                                         <span className="text-white text-xl font-bold">{sub.handle}</span>
                                         <span className="text-gray-400 text-lg">{sub.name}</span>
                                    </>
                                ) : (
                                     <span className="text-white text-xl font-bold">{sub.name}</span>
                                )}
                            </div>
                        </div>
                    ))}
                </div>
            </section>

            <div className="h-20"></div>
        </main>
    );
};

// Componente auxiliar para los inputs de solo lectura (Mail, Nombre, Teléfono)
const InfoField = ({ label, value }: { label: string, value: string }) => (
    <div className="flex items-center">
        <label className="w-32 text-xl text-gray-400 font-light">{label}</label>
        <input 
            type="text" 
            value={value} 
            readOnly 
            className="flex-1 bg-gray-300 text-gray-800 text-xl rounded-full px-6 py-3 outline-none cursor-default focus:ring-2 focus:ring-primary/50"
        />
    </div>
);