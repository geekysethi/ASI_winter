
clc
clear all
close all
%% Load the Parameters of the Stereo Camera
% Load the |stereoParameters| object, which is the result of calibrating

% Load the stereoParameters object.
load('handshakeStereoParams.mat');

% Visualize camera extrinsics.
% showExtrinsics(stereoParams);

% Create Video File Readers and the Video Player
% Create System Objects for reading and displaying the video
videoFileLeft = 'handshake_left.avi';
videoFileRight = 'handshake_right.avi';

readerLeft = vision.VideoFileReader(videoFileLeft, 'VideoOutputDataType', 'uint8');
readerRight = vision.VideoFileReader(videoFileRight, 'VideoOutputDataType', 'uint8');
%%
% Read and Rectify Video Frames
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1st pointCloud
frameLeft = readerLeft.step();
frameRight = readerRight.step();
[ptCloudRef,disparityMap]=stereo_to_ply(frameLeft,frameRight,stereoParams);
figure;
imshow(disparityMap, [0, 64]);
title('Disparity Map');
colormap jet
colorbar


% Create a streaming point cloud viewer
player3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
    'VerticalAxisDir', 'down');

% Visualize the point cloud
view(player3D, ptCloudRef);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2nd PointCloud

frameLeft = readerLeft.step();
frameRight = readerRight.step();

[ptCloudCurrent,disparityMap]=stereo_to_ply(frameLeft,frameRight,stereoParams);
figure;
imshow(disparityMap, [0, 64]);
title('Disparity Map');
colormap jet
colorbar


% Create a streaming point cloud viewer
player1_3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
    'VerticalAxisDir', 'down');

% Visualize the point cloud
view(player1_3D, ptCloudCurrent);

%%
 gridSize = 0.1;
 fixed = pcdownsample(ptCloudRef, 'gridAverage', gridSize);
 moving = pcdownsample(ptCloudCurrent, 'gridAverage', gridSize);

% Note that the downsampling step does not only speed up the registration,
% but can also improve the accuracy.
tform = pcregrigid(moving, fixed, 'Metric','pointToPlane','Extrapolate', true);
ptCloudAligned = pctransform(ptCloudCurrent,tform);

mergeSize = 0.015;
ptCloudScene = pcmerge(ptCloudRef, ptCloudAligned, mergeSize);

% Visualize the input images.
figure
subplot(1,2,1)
imshow(ptCloudRef.Color)
title('First input image')
drawnow

subplot(1,2,2)
imshow(ptCloudCurrent.Color)
title('Second input image')
drawnow


%% Stitch a Sequence of Point Clouds
% To compose a larger 3-D scene, repeat the same procedure as above to
% process a sequence of point clouds. Use the first point cloud to
% establish the reference coordinate system. Transform each point cloud to
% the reference coordinate system. This transformation is a multiplication
% of pairwise transformations.

% Store the transformation object that accumulates the transformation.
accumTform = tform; 


player3_3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
    'VerticalAxisDir', 'down');

% Visualize the point cloud
view(player3_3D, ptCloudScene);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Process the Rest of the Video
% Apply the steps described above to detect people and measure their
% distances to the camera in every frame of the video.
k=2;
figure;
    player4_3D = pcplayer([-3, 3], [-3, 3], [0, 8], 'VerticalAxis', 'y', ...
    'VerticalAxisDir', 'down');

for i=1:10
    k=k+1;
    disp(k);
    % Read the frames.
    frameLeft = readerLeft.step();
    frameRight = readerRight.step();
    
    [ptCloudCurrent,disparityMap]=stereo_to_ply(frameLeft,frameRight,stereoParams); 
    subplot(121)
    imshow(ptCloudCurrent.Color)
    title('YOLO')
    drawnow;
    subplot(122);
    imshow(disparityMap, [0, 64]);
    title('Disparity Map');
    colormap jet
    colorbar

    fixed = moving;
    moving = pcdownsample(ptCloudCurrent, 'gridAverage', gridSize);
    
    % Apply ICP registration.
    tform = pcregrigid(moving, fixed, 'Metric','pointToPlane','Extrapolate', true);

    % Transform the current point cloud to the reference coordinate system
    % defined by the first point cloud.
    accumTform = affine3d(tform.T * accumTform.T);
    ptCloudAligned = pctransform(ptCloudCurrent, accumTform);
    
    % Update the world scene.
    ptCloudScene = pcmerge(ptCloudScene, ptCloudAligned, mergeSize);

    
% Visualize the point cloud
view(player4_3D, ptCloudScene);    
 
end


% Clean up.
reset(readerLeft);
reset(readerRight);
