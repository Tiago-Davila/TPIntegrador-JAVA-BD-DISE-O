import React, { useEffect, useState } from 'react';
import { PostCard } from './PostCard';
import { Post } from '../types';
import { fetchPosts } from '../services/api';
import { AlertCircle, Terminal } from 'lucide-react';

export const Feed: React.FC = () => {
    const [posts, setPosts] = useState<Post[]>([]);
    const [loading, setLoading] = useState(true);
    const [showDebug, setShowDebug] = useState(false);

    useEffect(() => {
        loadData();
    }, []);

    const loadData = async () => {
        setLoading(true);
        const data = await fetchPosts();
        setPosts(data);
        setLoading(false);
    };

    return (
        <main className="flex-1 min-h-screen px-4 md:px-8 lg:px-12 py-8 max-w-4xl mx-auto w-full">
            {/* Feed Header */}
            <div className="mb-8 border-b-2 border-primary/50 pb-4">
                <h1 className="text-3xl font-light text-gray-200">
                    Hola, <span className="text-white font-bold">Bienvenido</span>
                </h1>
                <p className="text-gray-500 text-sm mt-1">Estas son las novedades de hoy</p>
            </div>

            {/* Loading State */}
            {loading && (
                <div className="flex flex-col justify-center items-center py-20 gap-4">
                    <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-primary"></div>
                    <p className="text-gray-500 text-sm animate-pulse">Cargando publicaciones...</p>
                </div>
            )}

            {/* Empty State */}
            {!loading && posts.length === 0 && (
                <div className="bg-card border border-gray-800 rounded-xl p-8 text-center">
                    <AlertCircle className="mx-auto text-gray-500 mb-4" size={48} />
                    <h3 className="text-xl font-bold text-white mb-2">No hay publicaciones</h3>
                    <p className="text-gray-400 mb-6">Tu base de datos parece estar vacía o no pudimos conectar.</p>
                    <button 
                        onClick={loadData}
                        className="bg-white/10 hover:bg-white/20 text-white px-4 py-2 rounded-lg transition-colors"
                    >
                        Reintentar Conexión
                    </button>
                </div>
            )}
            
            {/* Posts List */}
            <div className="flex flex-col gap-2">
                {posts.map((post) => (
                    <PostCard key={post.id} post={post} />
                ))}
            </div>

            {/* Debug Footer */}
            <div className="mt-12 border-t border-gray-800 pt-6 text-center">
                <button 
                    onClick={() => setShowDebug(!showDebug)}
                    className="text-xs text-gray-600 hover:text-primary flex items-center justify-center gap-2 mx-auto"
                >
                    <Terminal size={14} />
                    {showDebug ? 'Ocultar Debug Info' : 'Mostrar Debug Info (Para Desarrollador)'}
                </button>
                
                {showDebug && (
                    <div className="mt-4 text-left bg-black/50 p-4 rounded-lg border border-gray-800 overflow-x-auto">
                        <p className="text-green-400 text-xs font-mono mb-2">// Datos recibidos en el Frontend (Primeros 3 posts):</p>
                        <pre className="text-[10px] text-gray-300 font-mono">
                            {JSON.stringify(posts.slice(0, 3), null, 2)}
                        </pre>
                    </div>
                )}
            </div>

            <div className="h-20"></div>
        </main>
    );
};