clc;

% ===============================
% CHECK IF AIRFOIL DATA EXISTS
% ===============================
if evalin('base','exist(''airfoil_coords'',''var'')') == 0
    error('Run Airfoil_Generator.m first.');
end

% Get latest coordinates (meters)
coords = evalin('base','airfoil_coords');

% ===============================
% CONVERT TO mm AND ADD Z COLUMN
% ===============================
coords_xyz = [coords*1000, zeros(size(coords,1),1)];

% ===============================
% CREATE EXPORT FOLDER
% ===============================
exportFolder = fullfile(pwd, 'TXT_Export');

if ~exist(exportFolder,'dir')
    mkdir(exportFolder);
end

% ===============================
% ASK USER FOR FILE NAME
% (OPEN INSIDE TXT_Export FOLDER)
% ===============================
[filename, pathname] = uiputfile( ...
    fullfile(exportFolder, '*.txt'), ...
    'Save Airfoil TXT File As');

if isequal(filename,0)
    disp('Export cancelled.');
    return;
end

fullpath = fullfile(pathname, filename);

% ===============================
% WRITE TXT FILE (SPACE SEPARATED, NO HEADER)
% ===============================
fid = fopen(fullpath,'w');

for i = 1:size(coords_xyz,1)
    fprintf(fid,'%.6f %.6f %.6f\n', ...
        coords_xyz(i,1), ...
        coords_xyz(i,2), ...
        coords_xyz(i,3));
end

fclose(fid);

disp(['TXT file created successfully: ', fullpath]);