% Read coloured image and convert to grayscale for 2D edge detection
img = imread('peppers.png');
img_gray = double(rgb2gray(img)); % Convert to double for calculations

% (a) Sobel Operator Masks
Sobel_X = [-1 -2 -1; 0 0 0; 1 2 1];
Sobel_Y = [-1 0 1; -2 0 2; -1 0 1];

% (b) Prewitt Operator Masks
Prewitt_X = [-1 -1 -1; 0 0 0; 1 1 1];
Prewitt_Y = [-1 0 1; -1 0 1; -1 0 1];

% Apply Spatial Gradients
Gx_sobel = imfilter(img_gray, Sobel_X);
Gy_sobel = imfilter(img_gray, Sobel_Y);
Sobel_Custom = sqrt(Gx_sobel.^2 + Gy_sobel.^2);

Gx_prewitt = imfilter(img_gray, Prewitt_X);
Gy_prewitt = imfilter(img_gray, Prewitt_Y);
Prewitt_Custom = sqrt(Gx_prewitt.^2 + Gy_prewitt.^2);

% Inbuilt Commands Verification
img_uint8 = uint8(img_gray);
Sobel_Inbuilt = edge(img_uint8, 'sobel');
Prewitt_Inbuilt = edge(img_uint8, 'prewitt');

% Display Results
figure;
subplot(2,2,1); imshow(uint8(Sobel_Custom)); title('Sobel (Custom Mask)');
subplot(2,2,2); imshow(Sobel_Inbuilt); title('Sobel (Inbuilt)');
subplot(2,2,3); imshow(uint8(Prewitt_Custom)); title('Prewitt (Custom Mask)');
subplot(2,2,4); imshow(Prewitt_Inbuilt); title('Prewitt (Inbuilt)');