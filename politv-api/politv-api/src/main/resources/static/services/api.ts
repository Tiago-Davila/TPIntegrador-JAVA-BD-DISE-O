import { Post, Community, PostDTO, UserProfileFull, ProgramFullDetails } from '../types';

const BASE_URL = '/api';

const getAvatar = (name: string, background: string = 'random') => 
    `https://ui-avatars.com/api/?name=${encodeURIComponent(name)}&background=${background}&color=fff&size=128&bold=true`;

const mapBackendToFrontend = (data: PostDTO[]): Post[] => {
    if (!Array.isArray(data)) return [];
    
    return data.map((dto, index) => {
        const contentText = dto.texto || dto.contenido || dto.mensaje || dto.descripcion || '';
        let finalDate = new Date().toISOString();
        const rawDate = dto.fechaCreacion || dto.fecha || dto.createdAt;
        
        if (Array.isArray(rawDate) && rawDate.length >= 3) {
             const dateObj = new Date(rawDate[0], rawDate[1] - 1, rawDate[2], rawDate[3] || 0, rawDate[4] || 0, rawDate[5] || 0);
             finalDate = dateObj.toISOString();
        } else if (typeof rawDate === 'string') {
            finalDate = rawDate;
        }

        const userObj = dto.usuario || dto.user || dto.autor;
        const userId = dto.usuarioId || userObj?.id || 0;
        const userName = userObj?.nombreUsuario || userObj?.username || `User ${userId}`;
        const userHandle = userObj?.handle || `@${userName.replace(/\s/g,'')}`;

        const progObj = dto.programa || dto.comunidad;
        const progName = progObj?.nombre || progObj?.titulo || 'Comunidad';
        const progId = progObj?.id || 0;

        return {
            id: dto.id || index, 
            content: contentText,
            likes: dto.likes || dto.cantLikes || 0,
            createdAt: finalDate,
            imageUrl: dto.urlImagen || dto.imagen,
            user: {
                id: userId,
                username: userName,
                handle: userHandle,
                isVerified: false,
                avatarUrl: getAvatar(userName, '1e293b')
            },
            community: {
                id: progId,
                name: progName,
                logoUrl: getAvatar(progName, 'DC2626')
            }
        };
    });
}

// --- API CALLS ---

export const fetchPosts = async (): Promise<Post[]> => {
    try {
        const response = await fetch(`${BASE_URL}/publicaciones`); 
        if (!response.ok) return [];
        const data = await response.json();
        const listData = (data.content && Array.isArray(data.content)) ? data.content : data;
        return mapBackendToFrontend(listData);
    } catch (error) {
        console.warn("Error fetching general posts", error);
        return [];
    }
};

export const fetchLiveCommunities = async (): Promise<Community[]> => {
    try {
        const response = await fetch(`${BASE_URL}/programas`); 
        if (!response.ok) return [];
        const data = await response.json();
        return Array.isArray(data) ? data.map((prog: any) => ({
            id: prog.id,
            name: prog.nombre,
            logoUrl: getAvatar(prog.nombre, 'DC2626'),
            isLive: prog.en_vivo || Math.random() > 0.7 
        })) : [];
    } catch (error) {
        return [];
    }
};

export const fetchUserProfile = async (userId: number): Promise<UserProfileFull> => {
    
    // Validamos que venga un ID, si no, usamos el 1 por defecto (o lanzamos error)
    const targetId = userId || 1; 

    console.log(`📡 Buscando perfil del usuario ID: ${targetId}`);
    const response = await fetch(`${BASE_URL}/usuarios/${targetId}`);
    
    if (!response.ok) {
        throw new Error("Error loading profile");
    }
    
    const data = await response.json();
    
    // Mapeo de datos (igual que antes)
    return {
        id: data.id,
        username: data.username || data.nombreUsuario, 
        handle: `@${data.username || data.nombreUsuario}`,
        avatarUrl: `https://ui-avatars.com/api/?name=${encodeURIComponent(data.username || data.nombreUsuario)}&background=random&color=fff&size=128&bold=true`,
        email: data.email || data.mail,
        fullName: data.fullName || data.nombreUsuario, 
        phone: data.phone || data.telefono,
        subscriptions: data.suscripciones ? data.suscripciones.map((sub: any) => ({
            id: sub.id,
            name: sub.name,
            handle: sub.handle,
            logoUrl: `https://ui-avatars.com/api/?name=${encodeURIComponent(sub.name)}&background=DC2626&color=fff`
        })) : []
    };
};

export const fetchProgramDetails = async (programId: number): Promise<ProgramFullDetails> => {
    const resDetalle = await fetch(`${BASE_URL}/programas/${programId}/detalle`);
    if (!resDetalle.ok) throw new Error("Error loading program details");
    const data = await resDetalle.json();

    const resStaff = await fetch(`${BASE_URL}/programas/${programId}/staff`);
    const staffData = resStaff.ok ? await resStaff.json() : [];

    return {
        id: data.id,
        name: data.nombre,
        description: data.descripcion || "Sin descripción disponible.",
        schedule: data.horario || data.horarioString || "Horario a confirmar",
        isLive: data.enVivo,
        logoUrl: getAvatar(data.nombre, '0044aa'),
        bannerUrl: programId === 2 
            ? "https://images.unsplash.com/photo-1695669975398-863156d378e9?q=80&w=1600&auto=format&fit=crop" 
            : `https://placehold.co/1200x300/1a1d21/FFF?text=${encodeURIComponent(data.nombre)}`,
        staff: staffData.map((s: any) => ({
            id: s.id,
            nombre: s.nombre,
            apellido: s.apellido,
            rol: s.rol
        }))
    };
};

export const fetchProgramPosts = async (programId: number): Promise<Post[]> => {
    try {
        const response = await fetch(`${BASE_URL}/programas/${programId}/blog/comentarios`);
        if (!response.ok) return [];
        const data = await response.json();
        return mapBackendToFrontend(data);
    } catch (error) {
        console.error("Error fetching program posts", error);
        return [];
    }
};