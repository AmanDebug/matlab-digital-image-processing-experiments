clc; clear; close all;

I_rgb = imread('cameraman.tif'); 
[rows, cols, channels] = size(I_rgb);
Recovered_img = zeros(rows, cols, channels, 'uint8');

figure('Name', 'DCT and IDCT');
subplot(1,2,1), imshow(I_rgb), title('Original RGB Image');

% Process each channel independently
for c = 1:channels
    % Calculate DCT coefficients
    dct_coeff = dct2(double(I_rgb(:, :, c)));
    
    % Recover original image after applying inverse DCT
    Recovered_img(:, :, c) = uint8(idct2(dct_coeff));
end

subplot(1,2,2), imshow(Recovered_img), title('Recovered Image via IDCT');