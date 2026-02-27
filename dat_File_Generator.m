clc;

% ===============================
% CHECK IF DATA EXISTS
% ===============================
if evalin('base','exist(''airfoil_coords'',''var'')') == 0
    error('Run the generator script first.');
end

% Get correct coordinates from generator
coords = evalin('base','airfoil_coords');

% ===============================
% CREATE EXPORT FOLDER
% ===============================
exportFolder = 'Exported_Airfoils';

if ~exist(exportFolder, 'dir')
    mkdir(exportFolder);
end

% ===============================
% SAVE FILE DIALOG
% ===============================
[filename, pathname] = uiputfile(fullfile(exportFolder,'*.dat'), ...
    'Save Airfoil DAT File');

if isequal(filename,0)
    disp('Export cancelled.');
    return;
end

fullpath = fullfile(pathname, filename);

% ===============================
% WRITE DAT FILE (CORRECT FORMAT)
% ===============================
fid = fopen(fullpath,'w');

% IMPORTANT HEADER LINE
fprintf(fid,'Morphing_Airfoil\n');

% Write coordinates
for i = 1:size(coords,1)
    fprintf(fid,'%f %f\n', coords(i,1), coords(i,2));
end

fclose(fid);

disp(['DAT file created successfully: ', fullpath]);