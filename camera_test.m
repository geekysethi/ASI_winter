clc
clear all
close all
imaqreset
format_a ='YUY2_640x480'
vid1 = videoinput('winvideo', 3, format_a); % Left
src1 = getselectedsource(vid1);