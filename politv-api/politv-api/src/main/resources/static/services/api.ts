import { Post, Community, PostDTO } from '../types';

// IMPORTANT: This relative path requires the vite.config.ts proxy setup to work
// It will forward requests from /api/... to http://localhost:8080/api/...
const BASE_URL = '/api';

/**
 * Avatar Generator Helper
 */
const getAvatar = (name: string, background: string = 'random') => 
    `https://ui-avatars.com/api/?name=${encodeURIComponent(name)}&background=${background}&color=fff&size=128&bold=true`;

/**
 * SIMULATED USER DATABASE
 * Como el backend actualmente solo envía 'usuarioId' (int) y no el objeto Usuario completo,
 * usamos este mapa para buscar los nombres reales basados en el ID.
 */
const KNOWN_USERS: Record<number, { name: string, handle: string }> = {
    1: { name: "Martín Pérez", handle: "tincho_p" },
    2: { name: "Ana Gomez", handle: "anitalok" },
    3: { name: "Lucas Rodríguez", handle: "lukitas_rod" },
    4: { name: "Sofía Martinez", handle: "sofisports" },
    5: { name: "Carlos Maslatón", handle: "maslaton" },
    10: { name: "Yanina Latorre", handle: "yanilatorre" },
    100: { name: "Admin PoliTV", handle: "admin" }
};

/**
 * Mock Data for Fallback
 */
const MOCK_POSTS: Post[] = [
    {
        id: 999,
        community: { id: 1, name: 'Sistema', logoUrl: getAvatar('Sys', '333') },
        user: { id: 101, username: 'Admin', handle: '@admin', isVerified: true, avatarUrl: getAvatar('Admin') },
        content: 'Si ves esto, no pudimos cargar los datos de tu Spring Boot. \nRevisa la consola (F12) para ver el error exacto y asegúrate de que el backend esté corriendo en el puerto 8080.',
        likes: 0,
        createdAt: new Date().toISOString() 
    }
];

const MOCK_LIVE_COMMUNITIES: Community[] = [
    { id: 1, name: 'Bendita', logoUrl: getAvatar('Bendita', 'DC2626'), isLive: true },
    { id: 2, name: 'TyC Sports', logoUrl: getAvatar('TyC', '0044aa'), isLive: true },
    { id: 3, name: 'Luzu TV', logoUrl: getAvatar('Luzu', '111'), isLive: true },
];

/**
 * MAPPER: Backend DTO -> Frontend Model
 */
const mapBackendToFrontend = (data: PostDTO[]): Post[] => {
    if (!Array.isArray(data)) {
        console.warn("❗ Backend returned non-array:", data);
        return [];
    }
    
    return data.map((dto, index) => {
        // 1. Content Mapping
        const contentText = dto.texto || dto.contenido || dto.mensaje || dto.descripcion || '';

        // 2. Date Mapping
        let finalDate = new Date().toISOString();
        const rawDate = dto.fechaCreacion || dto.fecha || dto.createdAt;

        if (Array.isArray(rawDate)) {
            // Handle Java LocalDateTime array serialization [yyyy, mm, dd, hh, mm, ss]
            if (rawDate.length >= 3) {
                 const dateObj = new Date(
                    rawDate[0], 
                    rawDate[1] - 1, 
                    rawDate[2], 
                    rawDate[3] || 0, 
                    rawDate[4] || 0, 
                    rawDate[5] || 0
                );
                finalDate = dateObj.toISOString();
            }
        } else if (typeof rawDate === 'string') {
            finalDate = rawDate;
        }

        // 3. Program/Community Mapping
        const progObj = dto.programa || dto.comunidad || dto.community;
        const progName = progObj?.nombre || progObj?.titulo || progObj?.name || 'Comunidad General';
        const progId = progObj?.id || 0;

        // 4. User Mapping
        // Look for the ID first
        const userObj = dto.usuario || dto.user || dto.autor || dto.creador;
        const userId = dto.usuarioId || userObj?.id || 0;
        
        let userName = userObj?.nombreUsuario || userObj?.username || userObj?.nombre || userObj?.alias || userObj?.name;
        let userHandle = userObj?.handle;

        // FIX: Si el backend no envía el nombre (porque solo envía usuarioId),
        // buscamos en nuestra base de datos simulada del frontend (KNOWN_USERS).
        if (!userName && userId > 0) {
            const knownUser = KNOWN_USERS[userId];
            if (knownUser) {
                userName = knownUser.name;
                userHandle = knownUser.handle;
            } else {
                // Fallback más amigable si el ID no está en la lista conocida
                userName = `Usuario #${userId}`; 
                userHandle = `user${userId}`;
            }
        } else if (!userName) {
            userName = 'Usuario Anónimo';
            userHandle = 'anon';
        }

        // Ensure handle has @
        if (!userHandle) userHandle = userName.replace(/\s+/g, '').toLowerCase();
        const finalHandle = userHandle.startsWith('@') ? userHandle : `@${userHandle}`;

        return {
            id: dto.id || index, 
            content: contentText,
            likes: dto.likes || dto.cantLikes || dto.meGustas || 0,
            createdAt: finalDate,
            // Handle image logic
            imageUrl: typeof dto.urlImagen === 'string' ? dto.urlImagen : (dto.imagen || dto.img || undefined),
            user: {
                id: userId,
                username: userName,
                handle: finalHandle,
                isVerified: false,
                avatarUrl: getAvatar(userName, '1e293b') // Dark background for user
            },
            community: {
                id: progId,
                name: progName,
                logoUrl: getAvatar(progName, 'DC2626') // Red background for community
            }
        };
    });
}

/**
 * Fetch Posts
 */
export const fetchPosts = async (): Promise<Post[]> => {
    try {
        console.log("📡 Fetching posts from:", `${BASE_URL}/publicaciones`);
        const response = await fetch(`${BASE_URL}/publicaciones`); 
        
        if (!response.ok) {
            const text = await response.text();
            console.error(`❌ Error Backend (${response.status}):`, text);
            throw new Error(`Error ${response.status}: ${text}`);
        }
        
        const data = await response.json();
        console.log("📦 Received Data:", data);

        const listData = (data.content && Array.isArray(data.content)) ? data.content : data;

        return mapBackendToFrontend(listData);

    } catch (error) {
        console.warn("⚠️ Connection failed, using Mock Data.", error);
        return MOCK_POSTS; 
    }
};

/**
 * Fetch Communities
 */
export const fetchLiveCommunities = async (): Promise<Community[]> => {
    try {
        const response = await fetch(`${BASE_URL}/programas`); 
        if (!response.ok) throw new Error("Error fetching programs");
        const data = await response.json();
        const list = Array.isArray(data) ? data : [];
        
        return list.map((prog: any) => ({
            id: prog.id,
            name: prog.nombre || prog.titulo || 'Programa',
            logoUrl: getAvatar(prog.nombre || 'P', 'DC2626'),
            isLive: Math.random() > 0.5 
        }));
    } catch (error) {
        return MOCK_LIVE_COMMUNITIES;
    }
};

// src/services/api.ts (Agregar al final)
import { UserProfileFull } from '../types';

// --- MOCK DATA PARA PERFIL ---
const MOCK_USER_PROFILE: UserProfileFull = {
    id: 99,
    username: "Splinter",
    handle: "@maestroSplinter",
    // Usamos una imagen de ejemplo similar a la del diseño
    avatarUrl: "https://i.pravatar.cc/150?img=68", 
    email: "example@lpm.edu.ar",
    fullName: "example",
    phone: "3123123",
    subscriptions: [
        { 
            id: 1, 
            name: "Bendita", 
            handle: "Bendita", 
            logoUrl: "https://ui-avatars.com/api/?name=Bendita&background=DC2626&color=fff" 
        },
        { 
            id: 2, 
            name: "TyC Sports", 
            handle: "Tyc_Sports", 
            logoUrl: "https://ui-avatars.com/api/?name=TyC&background=0044aa&color=fff"
        },
        { 
            id: 3, 
            name: "Telefe", 
            handle: "Telefe", 
            logoUrl: "https://ui-avatars.com/api/?name=Telefe&background=0055bb&color=fff"
        }
    ]
};

/**
 * Fetch User Profile (Simulado)
 */
export const fetchUserProfile = async (): Promise<UserProfileFull> => {
    // ID HARCODED PARA PRUEBAS: Usamos el usuario 1 (Martín Pérez según tu SQL)
    // En el futuro, este ID vendría del login.
    const userId = 1; 

    try {
        console.log(`📡 Fetching profile for user ${userId}...`);
        const response = await fetch(`/api/usuarios/${userId}`);

        if (!response.ok) {
            throw new Error(`Error HTTP: ${response.status}`);
        }

        const data = await response.json();
        console.log("📦 Perfil recibido:", data);

        // Mapeamos los datos de Java (DTO) a la interfaz de React
        return {
            id: data.id,
            username: data.username, // Viene del DTO
            handle: `@${data.username}`, // Generamos handle visual
            // Como la DB no tiene avatares, usamos uno generado con la inicial
            avatarUrl: `https://ui-avatars.com/api/?name=${data.username}&background=random&size=128`, 
            email: data.email,
            fullName: data.fullName, // Viene del DTO
            phone: data.telefono,    // Viene del DTO
            subscriptions: data.suscripciones.map((sub: any) => ({
                id: sub.id,
                name: sub.name,
                handle: sub.handle || sub.name,
                logoUrl: `https://ui-avatars.com/api/?name=${sub.name}&background=DC2626&color=fff`
            }))
        };

    } catch (error) {
        console.error("❌ Error conectando con API Usuarios:", error);
        // Si falla, podrías devolver null o lanzar error para que la UI lo maneje
        throw error;
    }
};