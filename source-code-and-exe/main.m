% blurry_moon
[im,map] = imread("HW2_test_image\blurry_moon.tif","tif");
imgray = im;
imgrayuint = uint8(imgray);

lapSpa = laplacianSpatial(imgrayuint);
unsSpa = unsharpSpatial(imgrayuint);
hbSpa = hbSpatial(imgrayuint);
lapFreq = laplacianFreq(imgrayuint);
hbFreqV = hbFreq(imgrayuint);

figure(Name='blurry_moon');
subplot(3,3,2), imshow(imgrayuint), title('original');
subplot(3,3,4), imshow(lapSpa), title('Laplacian (spatial)');
subplot(3,3,5), imshow(unsSpa), title('unsharp masking (spatial)');
subplot(3,3,6), imshow(hbSpa), title('high-boost filtering (spatial)');
subplot(3,3,7), imshow(lapFreq), title('Laplacian (frequency)');
subplot(3,3,8), imshow([0]), title('unsharp masking only apply in spatial domain');
subplot(3,3,9), imshow(hbFreqV), title('high-boost filtering (frequency)');

clear;

% skeleton_orig
[im,map] = imread("HW2_test_image\skeleton_orig.bmp","bmp");
imgray = rgb2gray(im);
imgrayuint = uint8(imgray);

lapSpa = laplacianSpatial(imgrayuint);
unsSpa = unsharpSpatial(imgrayuint);
hbSpa = hbSpatial(imgrayuint);
lapFreq = laplacianFreq(imgrayuint);
hbFreqV = hbFreq(imgrayuint);

figure(Name='skeleton_orig');
subplot(3,3,2), imshow(imgrayuint), title('original');
subplot(3,3,4), imshow(lapSpa), title('Laplacian (spatial)');
subplot(3,3,5), imshow(unsSpa), title('unsharp masking (spatial)');
subplot(3,3,6), imshow(hbSpa), title('high-boost filtering (spatial)');
subplot(3,3,7), imshow(lapFreq), title('Laplacian (frequency)');
subplot(3,3,8), imshow([0]), title('unsharp masking only apply in spatial domain');
subplot(3,3,9), imshow(hbFreqV), title('high-boost filtering (frequency)');
