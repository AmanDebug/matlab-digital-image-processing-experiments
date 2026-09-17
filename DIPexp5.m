% Convert RGB to grayscale
img = imread('peppers.png');
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% (a) Global Histogram Equalization
global_he = histeq(gray_img);

% (b) CLAHE (Contrast Limited Adaptive Histogram Equalization) method
clahe_img = adapthisteq(gray_img);

% Display Results
figure;
subplot(3,2,1); imshow(gray_img); title('Original Grayscale Image');
subplot(3,2,2); imhist(gray_img); title('Original Histogram');

subplot(3,2,3); imshow(global_he); title('Global Histogram Equalization');
subplot(3,2,4); imhist(global_he); title('Global HE Histogram');

subplot(3,2,5); imshow(clahe_img); title('CLAHE Image');
subplot(3,2,6); imhist(clahe_img); title('CLAHE Histogram');