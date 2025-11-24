import React from 'react';
import { Post } from '../types';
import { Heart, BadgeCheck, MessageCircle, Share2, MoreHorizontal } from 'lucide-react';

interface PostCardProps {
    post: Post;
}

const formatLikes = (likes: number) => {
    if (!likes) return '0';
    if (likes >= 1000000) return `${(likes / 1000000).toFixed(1)}M`;
    if (likes >= 1000) return `${(likes / 1000).toFixed(1)}K`;
    return likes.toString();
};

const timeAgo = (dateString: string) => {
    const date = new Date(dateString);
    if (isNaN(date.getTime())) return "Reciente"; // Fallback si la fecha es inválida
    
    const now = new Date();
    const seconds = Math.floor((now.getTime() - date.getTime()) / 1000);

    let interval = seconds / 31536000;
    if (interval > 1) return `hace ${Math.floor(interval)} años`;
    interval = seconds / 2592000;
    if (interval > 1) return `hace ${Math.floor(interval)} meses`;
    interval = seconds / 86400;
    if (interval > 1) return `hace ${Math.floor(interval)} d`;
    interval = seconds / 3600;
    if (interval > 1) return `hace ${Math.floor(interval)} h`;
    interval = seconds / 60;
    if (interval > 1) return `hace ${Math.floor(interval)} min`;
    return "hace un momento";
};

const getImageUrl = (urlOrData: string | undefined) => {
    if (!urlOrData) return null;
    if (urlOrData.startsWith('http')) return urlOrData;
    return `data:image/jpeg;base64,${urlOrData}`;
};

export const PostCard: React.FC<PostCardProps> = ({ post }) => {
    const displayTime = timeAgo(post.createdAt);
    const displayImage = getImageUrl(post.imageUrl);

    // Si no hay contenido ni imagen, mostrar un placeholder para depuración
    const isEmpty = !post.content && !displayImage;

    return (
        <article className="mb-6 bg-[#222529] rounded-xl p-0 overflow-hidden border border-gray-800/60 shadow-md hover:border-gray-700 transition-all">
            
            {/* Header */}
            <div className="p-4 pb-2 flex justify-between items-start">
                <div className="flex gap-3">
                    {/* Logo Comunidad */}
                    <div className="relative">
                        <img 
                            src={post.community.logoUrl} 
                            alt={post.community.name} 
                            className="w-11 h-11 rounded-full object-cover border-2 border-[#1a1d21]"
                        />
                        {/* Avatar Usuario Miniatura */}
                        <img 
                            src={post.user.avatarUrl}
                            alt={post.user.username}
                            className="w-5 h-5 rounded-full absolute -bottom-1 -right-1 border border-[#222529]"
                        />
                    </div>
                    
                    <div className="flex flex-col justify-center">
                        <div className="flex items-center gap-2 group cursor-pointer">
                            <h3 className="text-[15px] font-bold text-gray-100 group-hover:underline leading-none">
                                {post.community.name}
                            </h3>
                            <span className="text-xs text-gray-500">• {displayTime}</span>
                        </div>
                        
                        <div className="flex items-center gap-1 mt-1">
                            <span className="text-gray-400 text-sm hover:text-gray-300 cursor-pointer transition-colors">
                                @{post.user.username}
                            </span>
                            {post.user.isVerified && (
                                <BadgeCheck size={14} className="text-primary fill-current" />
                            )}
                        </div>
                    </div>
                </div>

                <button className="text-gray-500 hover:text-white p-1 rounded-full hover:bg-white/10 transition">
                    <MoreHorizontal size={20} />
                </button>
            </div>

            {/* Contenido Texto */}
            <div className="px-4 pb-3">
                {post.content ? (
                    <p className="text-gray-200 text-[15px] leading-relaxed whitespace-pre-line">
                        {post.content}
                    </p>
                ) : isEmpty && (
                    <p className="text-gray-600 italic text-xs">
                        (Sin contenido de texto)
                    </p>
                )}
            </div>

            {/* Imagen */}
            {displayImage && (
                <div className="w-full bg-black/40">
                    <img 
                        src={displayImage} 
                        alt="Post media" 
                        className="w-full h-auto object-contain max-h-[500px]"
                        loading="lazy"
                    />
                </div>
            )}

            {/* Footer Acciones */}
            <div className="px-4 py-3 flex items-center justify-between border-t border-white/5 mt-1">
                <div className="flex items-center gap-6">
                    <button className="flex items-center gap-2 group text-gray-400 hover:text-primary transition-colors">
                        <div className="p-2 rounded-full group-hover:bg-primary/10 transition-colors">
                            <Heart size={20} className="group-hover:scale-110 transition-transform" />
                        </div>
                        <span className="font-medium text-sm">{formatLikes(post.likes)}</span>
                    </button>
                    
                    <button className="flex items-center gap-2 group text-gray-400 hover:text-blue-400 transition-colors">
                        <div className="p-2 rounded-full group-hover:bg-blue-500/10 transition-colors">
                            <MessageCircle size={20} className="group-hover:scale-110 transition-transform" />
                        </div>
                        <span className="font-medium text-sm">Comentar</span>
                    </button>

                    <button className="flex items-center gap-2 group text-gray-400 hover:text-green-400 transition-colors">
                         <div className="p-2 rounded-full group-hover:bg-green-500/10 transition-colors">
                            <Share2 size={20} className="group-hover:scale-110 transition-transform" />
                        </div>
                    </button>
                </div>

                <button className="bg-white/5 hover:bg-white/10 text-primary border border-primary/30 text-xs font-bold py-1.5 px-3 rounded-full transition-all">
                    Suscribirse VIP
                </button>
            </div>
        </article>
    );
};