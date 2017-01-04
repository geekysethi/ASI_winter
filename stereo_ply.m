
path_left ='C:\Users\ashishHP\Desktop\test1\04-Jan-2017\7\Left\*.tiff';
path_right = 'C:\Users\ashishHP\Desktop\test1\04-Jan-2017\7\Right\*tiff';
srcFiles_left= dir(path_left);
srcFiles_right= dir(path_right);
frameLeft = strcat('C:\Users\ashishHP\Desktop\test1\04-Jan-2017\7\Left\',srcFiles_left(2).name);
frameRight = strcat('C:\Users\ashishHP\Desktop\test1\04-Jan-2017\7\Right\',srcFiles_right(2).name);
frameLeft=imread(frameLeft);
frameRight=imread(frameRight);

figure;
subplot(121);
imshow(frameLeft);
title('Left View');
subplot(122);
imshow(frameRight);
title('Right View')


[frameLeftRect, frameRightRect] = rectifyStereoImages(frameLeft, frameRight, stereoParams);
figure;
subplot(121);
imshow(frameLeftRect);
title('Left View');
subplot(122);
imshow(frameRightRect);
title('Right View')

frameLeftGray  = rgb2gray(frameLeftRect);
frameRightGray = rgb2gray(frameRightRect);
    
disparityMap = disparity(frameLeftGray, frameRightGray);

points3D = reconstructScene(disparityMap, stereoParams);

% Convert to meters and create a pointCloud object

 points3D = points3D ./ 1000;
ptCloud = pointCloud(points3D, 'Color', frameLeftRect);

