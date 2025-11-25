import React from 'react';
import { StaffMember } from '../../types';

interface Props {
    staff: StaffMember[];
}

export const ProgramStaffCard: React.FC<Props> = ({ staff }) => {
  return (
    <div className="bg-card rounded-xl border border-gray-800 p-5">
      <h3 className="text-primary font-bold mb-4">Staff</h3>
      <div className="flex flex-wrap gap-2">
        {staff.map(member => (
            <div key={member.id} className="bg-[#1E2126] border border-gray-700/50 rounded-full px-4 py-2 text-xs text-gray-300 text-center">
                {member.nombre} {member.apellido}
            </div>
        ))}
        {staff.length === 0 && <p className="text-gray-500 text-xs">Sin información de staff.</p>}
      </div>
    </div>
  );
};