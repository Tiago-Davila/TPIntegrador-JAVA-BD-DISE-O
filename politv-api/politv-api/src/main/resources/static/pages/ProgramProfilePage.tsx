import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import { Wifi, Clock, PlusCircle } from 'lucide-react';
import { fetchProgramDetails, fetchProgramPosts } from '../services/api';
import { PostCard } from '../components/PostCard';
import { ProgramFullDetails, Post } from '../types';

export const ProgramProfilePage: React.FC = () => {
    const { id } = useParams(); 
    const programId = Number(id);

    const [program, setProgram] = useState<ProgramFullDetails | null>(null);
    const [posts, setPosts] = useState<Post[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const loadAll = async () => {
            setLoading(true);
            try {
                const [detalles, publicaciones] = await Promise.all([
                    fetchProgramDetails(programId),
                    fetchProgramPosts(programId)
                ]);
                
                setProgram(detalles);
                setPosts(publicaciones);
            } catch (e) {
                console.error(e);
            } finally {
                setLoading(false);
            }
        };
        loadAll();
    }, [programId]);

    if (loading) return <div className="p-10 text-white">Cargando programa...</div>;
    if (!program) return <div className="p-10 text-white">Programa no encontrado</div>;

    return (
        <div className="flex flex-1 h-full overflow-hidden">
            {/* === COLUMNA CENTRAL: Banner y Feed === */}
            <main className="flex-1 overflow-y-auto p-6 scrollbar-hide">
                
                {/* Banner */}
                <div className="relative w-full h-56 rounded-2xl overflow-hidden mb-6 border border-gray-800">
                    <img src={program.bannerUrl} className="w-full h-full object-cover opacity-60" alt="Banner" />
                    <div className="absolute bottom-0 left-0 p-6 bg-gradient-to-t from-background to-transparent w-full">
                        <h1 className="text-4xl font-bold text-white">{program.name}</h1>
                        {program.isLive && (
                            <span className="flex items-center gap-2 text-green-400 font-bold mt-1 animate-pulse">
                                <Wifi size={18} /> EN VIVO
                            </span>
                        )}
                    </div>
                </div>

                {/* Feed de Publicaciones */}
                <div className="mb-4 flex justify-between items-center">
                    <h2 className="text-2xl text-white font-semibold">Destacados</h2>
                    <button className="text-primary cursor-pointer hover:scale-110 transition">
                        <PlusCircle size={32} />
                    </button>
                </div>

                {/* AQUÍ ESTABA EL ERROR ANTES: Asegúrate de que esta línea esté completa */}
                <div className="flex flex-col gap-4">
                    {posts.length > 0 ? (
                        posts.map((post) => <PostCard key={post.id} post={post} />)
                    ) : (
                        <div className="text-gray-500 text-center py-10 border border-dashed border-gray-700 rounded-xl">
                            No hay publicaciones aún en este programa.
                        </div>
                    )}
                </div>
                <div className="h-20"></div>
            </main>

            {/* === COLUMNA DERECHA: Sidebar del Programa === */}
            <aside className="w-80 bg-background border-l border-gray-800 flex flex-col gap-6 p-4 overflow-y-auto hidden lg:flex">
                
                {/* Tarjeta de Descripción */}
                <div className="bg-card p-4 rounded-xl border border-gray-700">
                    <h3 className="text-primary font-bold mb-2">@{program.name.replace(/\s/g,'').toLowerCase()}</h3>
                    <div className="flex items-center gap-2 text-xs text-gray-400 mb-3">
                        <Clock size={14}/> {program.schedule}
                    </div>
                    <p className="text-sm text-gray-300 leading-relaxed">
                        {program.description}
                    </p>
                </div>

                {/* Staff */}
                <div className="bg-card p-4 rounded-xl border border-gray-700">
                    <h3 className="text-white font-bold mb-3 text-sm uppercase tracking-wider">Staff</h3>
                    <div className="flex flex-wrap gap-2">
                        {program.staff && program.staff.length > 0 ? (
                            program.staff.map((s) => (
                                <span key={s.id} className="px-3 py-1 bg-[#1a1d21] border border-gray-600 rounded-full text-xs text-gray-300">
                                    {s.nombre} {s.apellido}
                                </span>
                            ))
                        ) : (
                            <span className="text-gray-500 text-xs">Sin información de staff.</span>
                        )}
                    </div>
                </div>

                {/* Botón VIP */}
                <div className="bg-card rounded-xl border border-red-900/30 p-5 relative overflow-hidden shrink-0 mt-auto">
                    <div className="absolute top-0 left-0 w-1 h-full bg-primary"></div>
                    <h3 className="text-lg font-bold text-primary mb-2">Suscribite Vip</h3>
                    <p className="text-xs text-gray-400 mb-4 leading-relaxed">
                        Accede a contenido exclusivo y sin publicidad.
                    </p>
                    <button className="w-full bg-primary hover:bg-red-700 text-white font-bold py-2 rounded-xl shadow-lg transition-all text-sm">
                        Suscribirse VIP
                    </button>
                </div>

            </aside>
        </div>
    );
};