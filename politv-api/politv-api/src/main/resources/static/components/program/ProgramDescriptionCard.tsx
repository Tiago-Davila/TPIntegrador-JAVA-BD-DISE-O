import React from 'react';
import { Clock } from 'lucide-react';

interface Props {
    handle: string;
    schedule: string;
    description: string;
}

export const ProgramDescriptionCard: React.FC<Props> = ({ handle, schedule, description }) => {
  return (
    <div className="bg-card rounded-xl border border-gray-800 p-5 text-sm">
        <div className="font-bold text-primary mb-2 flex items-center gap-2">
             @{handle.replace(/\s+/g, '').toLowerCase()}
        </div>
        <div className="flex items-center gap-2 text-gray-400 mb-3 text-xs">
            <Clock size={14} />
            <span>{schedule}</span>
        </div>
        <p className="text-gray-300 leading-relaxed">
            {description}
        </p>
    </div>
  );
};