
path_left ='C:\Users\ashishHP\Desktop\test1\16-Jan-2017\3\Left\*.tiff';
path_right = 'C:\Users\ashishHP\Desktop\test1\16-Jan-2017\3\Right\*tiff';
srcFiles_left= dir(path_left);
srcFiles_right= dir(path_right);
frameLeft = strcat('C:\Users\ashishHP\Desktop\test1\16-Jan-2017\3\Left\',srcFiles_left(2).name);
frameRight = strcat('C:\Users\ashishHP\Desktop\test1\16-Jan-2017\3\Right\',srcFiles_right(2).name);
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
figure;
imshow(disparityMap, [0, 64]);
title('Disparity Map');
colormap jet
colorbar

points3D = reconstructScene(disparityMap, stereoParams);

% Convert to meters and create a pointCloud object

 points3D = points3D ./ 1000;
ptCloud = pointCloud(points3D, 'Color', frameLeftRect);

player3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
    'VerticalAxisDir', 'down');

% Visualize the point cloud
view(player3D, ptCloud);

