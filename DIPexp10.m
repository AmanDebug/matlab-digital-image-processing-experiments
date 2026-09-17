clc; clear; close all;

I = imread('cameraman.tif'); 
if size(I, 3) == 3
    I_gray = rgb2gray(I);
else
    I_gray = I;
end

% (a) Canny edge detection
canny_edges = edge(I_gray, 'canny');

% (b) SIFT Feature Extraction (Requires Computer Vision Toolbox)
sift_points = detectSIFTFeatures(I_gray);
strongest_points = sift_points.selectStrongest(100);

figure('Name', 'Canny and SIFT');
subplot(1,3,1), imshow(I_gray), title('Original Image');
subplot(1,3,2), imshow(canny_edges), title('Canny Edge Detection');
subplot(1,3,3), imshow(I_gray); hold on;
plot(strongest_points, 'showOrientation', true);
title('SIFT Features'); hold off;