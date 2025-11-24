export interface Community {
    id: number;
    name: string;
    logoUrl: string;
    isLive?: boolean;
}

export interface User {
    id: number;
    username: string;
    handle: string; // e.g. @pollo_bendita
    avatarUrl?: string;
    isVerified?: boolean;
}

export interface Post {
    id: number;
    user: User;
    community: Community;
    content: string;
    imageUrl?: string; // Optional, some posts have images, some don't
    likes: number;
    createdAt: string; // ISO date or string description like "hace 10 dias"
}

// Props for components
export interface SidebarProps {
    className?: string;
}
export interface Subscription {
    id: number;
    name: string;
    handle: string; // Ej: "Tyc_Sports"
    logoUrl: string;
}

export interface UserProfileFull {
    id: number;
    username: string; // Ej: Splinter
    handle: string;   // Ej: @maestroSplinter
    avatarUrl: string;
    email: string;
    fullName: string; // El campo "Nombre" del diseño
    phone: string;
    subscriptions: Subscription[];
    // NOTA: La contraseña NO debe venir del backend por seguridad.
    // En el front solo mostraremos puntitos "......" visualmente.
}