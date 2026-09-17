clc; clear; close all;

% Read image and convert to grayscale
I = imread('cameraman.tif'); 
if size(I, 3) == 3
    I = rgb2gray(I);
end
I = im2double(I);

% Simulate blur
PSF = fspecial('motion', 21, 11);
blurred = imfilter(I, PSF, 'conv', 'circular');

% Add noises using inbuilt functions recommended in the manual
noisy_sp = imnoise(blurred, 'salt & pepper', 0.05);
noisy_gaussian = imnoise(blurred, 'gaussian', 0, 0.01);
noisy_speckle = imnoise(blurred, 'speckle', 0.05);

% Apply Wiener filter (deconvwnr)
estimated_nsr = 0.01 / var(I(:));
recovered_sp = deconvwnr(noisy_sp, PSF, estimated_nsr);
recovered_gaussian = deconvwnr(noisy_gaussian, PSF, estimated_nsr);
recovered_speckle = deconvwnr(noisy_speckle, PSF, estimated_nsr);

% Display
figure('Name', 'Wiener Filter Results');
subplot(2,3,1), imshow(noisy_sp), title('Salt & Pepper Noise');
subplot(2,3,4), imshow(recovered_sp), title('Recovered S&P');
subplot(2,3,2), imshow(noisy_gaussian), title('Gaussian Noise');
subplot(2,3,5), imshow(recovered_gaussian), title('Recovered Gaussian');
subplot(2,3,3), imshow(noisy_speckle), title('Speckle Noise');
subplot(2,3,6), imshow(recovered_speckle), title('Recovered Speckle');