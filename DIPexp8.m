clc; clear; close all;

I_rgb = imread('cameraman.tif'); 
[rows, cols, channels] = size(I_rgb);
Recovered_img = zeros(rows, cols, channels);

wavelet_name = 'haar';

for c = 1:channels
    % Decompose using DWT
    [cA, cH, cV, cD] = dwt2(double(I_rgb(:, :, c)), wavelet_name);
    
    % Recover using Inverse DWT
    Recovered_img(:, :, c) = idwt2(cA, cH, cV, cD, wavelet_name);
end

figure('Name', 'DWT and IDWT');
subplot(1,2,1), imshow(I_rgb), title('Original RGB');
subplot(1,2,2), imshow(uint8(Recovered_img)), title('Recovered RGB via IDWT');