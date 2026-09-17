% Read the RGB image
img = imread('peppers.png');

% (a) Extract red, green, and blue components
R = img(:, :, 1); % Red component
G = img(:, :, 2); % Green component
B = img(:, :, 3); % Blue component

% Combine the components to get the original image
recombined_img = cat(3, R, G, B);

% (b) Convert RGB to grayscale using the standard weighted equation
gray_eq = 0.2989 * R + 0.5870 * G + 0.1140 * B;

% Display Results
figure;
subplot(2,3,1); imshow(img); title('Original RGB Image');
subplot(2,3,2); imshow(R); title('Red Component');
subplot(2,3,3); imshow(G); title('Green Component');
subplot(2,3,4); imshow(B); title('Blue Component');
subplot(2,3,5); imshow(recombined_img); title('Recombined Image');
subplot(2,3,6); imshow(gray_eq); title('Grayscale (Equation)');