% Read image and convert to grayscale
img = imread('peppers.png');
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

% Positive Laplacian Mask
Laplacian_Mask = [0 1 0; 1 -4 1; 0 1 0]; 

% Apply Laplacian operator for edge detection
Laplacian_Edges = imfilter(double(img_gray), Laplacian_Mask);

% Display Results
figure;
subplot(1,2,1); imshow(img_gray); title('Original Grayscale Image');
subplot(1,2,2); imshow(uint8(Laplacian_Edges)); title('Laplacian Edges');