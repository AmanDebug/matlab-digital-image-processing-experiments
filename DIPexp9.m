clc; clear; close all;

I = imread('cameraman.tif'); 
if size(I, 3) == 3
    I = rgb2gray(I);
end

% Add Gaussian noise
noisy_img = imnoise(I, 'gaussian', 0, 0.01);

% Recover original image by appropriate filter (wiener2)
recovered_img = wiener2(noisy_img, [5 5]);

% Calculate MSE and PSNR
mse_val = immse(recovered_img, I);
psnr_val = psnr(recovered_img, I);

fprintf('Recovered Image Metrics:\n');
fprintf('MSE: %.2f\n', mse_val);
fprintf('PSNR: %.2f dB\n', psnr_val);

figure('Name', 'Gaussian Noise and Filtering');
subplot(1,3,1), imshow(I), title('Original Grayscale');
subplot(1,3,2), imshow(noisy_img), title('Gaussian Noise Added');
subplot(1,3,3), imshow(recovered_img), title('Filtered Image');