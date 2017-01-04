function [ format_b ] = myformat( a)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
switch a
    case 1
    format_b='F7_BayerBG12_1288x964_Mode0';
    case 2
    format_b= 'F7_BayerBG12_644x482_Mode1';
   case 3
    format_b= 'F7_BayerBG16_1288x964_Mode0';
    case 4
    format_b='F7_BayerBG16_644x482_Mode1';
    case 5
    format_b='F7_BayerBG8_1288x964_Mode0';
    case 6
    format_b='F7_BayerBG8_644x482_Mode1';
    case 7
    format_b='F7_Mono12_1288x964_Mode0';
    case 8
    format_b='F7_Mono12_320x240_Mode5';
    case 9
    format_b='F7_Mono12_644x482_Mode1';
    case 0
    format_b='F7_Mono12_644x482_Mode4';
    case 11
    format_b='F7_Mono16_1288x964_Mode0';
    case 12
    format_b='F7_Mono16_320x240_Mode5';
    case 13
    format_b='F7_Mono16_644x482_Mode1';
    case 14
    format_b='F7_Mono16_644x482_Mode4';
    case 15
    format_b='F7_Mono8_1288x964_Mode0';
    case 16
    format_b='F7_Mono8_320x240_Mode5';
    case 17
    format_b='F7_Mono8_644x482_Mode1';
    case 18
    format_b='F7_Mono8_644x482_Mode4';
    case 19
    format_b='F7_RGB_1288x964_Mode0';
    case 20
    format_b='F7_RGB_320x240_Mode5';
    case 21
    format_b='F7_RGB_644x482_Mode1';
    case 22
    format_b='F7_YUV411_1288x964_Mode0';
    case 23
    format_b='F7_YUV411_320x240_Mode5';
    case 24
    format_b='F7_YUV411_644x482_Mode1';
    case 25
    format_b='F7_YUV422_1288x964_Mode0';
    case 26
    format_b='F7_YUV422_320x240_Mode5';
    case 27
    format_b='F7_YUV422_644x482_Mode1';
    case 28
    format_b='F7_YUV444_1288x964_Mode0';
    case 29
    format_b='F7_YUV444_320x240_Mode5';
    case 30
    format_b='F7_YUV444_644x482_Mode1';
end
end

