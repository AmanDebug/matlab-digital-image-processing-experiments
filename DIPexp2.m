% Read image and convert to grayscale if RGB
img = imread('peppers.png');
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Add Salt and Pepper noise to the image
noisy_img = imnoise(img, 'salt & pepper', 0.05);

% (i) Construct 5x5 Gaussian Filter
h_gauss = fspecial('gaussian', [5 5], 1.0);
gauss_filtered = imfilter(noisy_img, h_gauss);

% (ii) Construct 5x5 Average Filter
h_avg = fspecial('average', [5 5]);
avg_filtered = imfilter(noisy_img, h_avg);

% (iii) Apply 5x5 Median Filter
median_filtered = medfilt2(noisy_img, [5 5]);

% Display Results
figure;
subplot(2,2,1); imshow(noisy_img); title('Salt & Pepper Noise');
subplot(2,2,2); imshow(gauss_filtered); title('5x5 Gaussian Filter');
subplot(2,2,3); imshow(avg_filtered); title('5x5 Average Filter');
subplot(2,2,4); imshow(median_filtered); title('5x5 Median Filter');