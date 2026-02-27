clc; 
clear; 
close all;

% ===============================
% USER INPUTS
% ===============================
m = 0.08;        % morph amount (0–0.1 realistic)
pivot = 0.45;    % pivot location (0–1 chord)
t = 0.12;        % thickness ratio
chord = 0.20;      % chord length in cm

n = 75;          % number of points per surface

% ===============================
% COSINE SPACING (IMPORTANT)
% ===============================
beta = linspace(0, pi, n);
x = (1 - cos(beta)) / 2;

% ===============================
% THICKNESS DISTRIBUTION (NACA)
% ===============================
yt = 5*t*(0.2969*sqrt(x) - 0.1260*x ...
    - 0.3516*x.^2 + 0.2843*x.^3 - 0.1015*x.^4);

% ===============================
% CAMBER LINE — TRAILING EDGE FLEX
% ===============================
yc = zeros(size(x));
dyc = zeros(size(x));

for i = 1:length(x)
    if x(i) < pivot
        yc(i) = 0;
        dyc(i) = 0;
    else
        xi = (x(i)-pivot)/(1-pivot);
        
        % Smooth monotonic bending
        yc(i) = -m*(xi^2);
        dyc(i) = -2*m*xi/(1-pivot);
    end
end

theta = atan(dyc);

% ===============================
% SURFACE COORDINATES
% ===============================
xu = (x - yt.*sin(theta)) * chord;
yu = (yc + yt.*cos(theta)) * chord;

xl = (x + yt.*sin(theta)) * chord;
yl = (yc - yt.*cos(theta)) * chord;

% ===============================
% PLOT AIRFOIL
% ===============================
figure;
plot([xu fliplr(xl)], [yu fliplr(yl)], 'b', 'LineWidth', 2); hold on;
plot(pivot*chord, 0, 'ro', 'MarkerFaceColor','r');

axis equal;
grid on;
title('Trailing Edge Morphing Airfoil');
xlabel('x (cm)');
ylabel('y (cm)');

% ===============================
% BUILD TRUE XFOIL FORMAT ORDER
% ===============================
% REQUIRED: Start at TE → go to LE → back to TE

upper_x = fliplr(xu);   % TE → LE
upper_y = fliplr(yu);

lower_x = xl(2:end);    % LE → TE (skip duplicate LE)
lower_y = yl(2:end);

coords = [
    upper_x' upper_y';
    lower_x' lower_y'
];

% ===============================
% STORE FOR EXPORT SCRIPT
% ===============================
assignin('base','airfoil_coords',coords);

disp(' ');
disp('Coordinates ready for XFLR export.');
disp('Run dat_File_Generator.m now.');

% ===============================
% PRINT COORDINATES FOR SOLIDWORKS (XYZ FORMAT)
% ===============================

disp(' ');
disp('===== SOLIDWORKS COPY-PASTE COORDINATES (X Y Z) =====');

% Add Z = 0 column for 3D import
coords_xyz = [coords, zeros(size(coords,1),1)];

for i = 1:size(coords_xyz,1)
    fprintf('%.6f %.6f %.6f\n', ...
        coords_xyz(i,1), ...
        coords_xyz(i,2), ...
        coords_xyz(i,3));
end

disp('===== END OF COORDINATES =====');