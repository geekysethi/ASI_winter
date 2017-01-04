function [ ptCloud,disparityMap] = stereo_to_ply(frameLeft, frameRight,stereoParams)

% Read and Rectify Video Frames
%1st pointCloud
[frameLeftRect, frameRightRect] = rectifyStereoImages(frameLeft, frameRight, stereoParams);

% Compute Disparity
% In rectified stereo images any pair of corresponding points are located 

frameLeftGray  = rgb2gray(frameLeftRect);
frameRightGray = rgb2gray(frameRightRect);
    
disparityMap = disparity(frameLeftGray, frameRightGray);

points3D = reconstructScene(disparityMap, stereoParams);

% Convert to meters and create a pointCloud object

 points3D = points3D ./ 1000;
ptCloud = pointCloud(points3D, 'Color', frameLeftRect);

end

