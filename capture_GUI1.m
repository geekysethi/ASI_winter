function varargout = capture_GUI1(varargin)
% CAPTURE_GUI1 MATLAB code for capture_GUI1.fig
%      CAPTURE_GUI1, by itself, creates a new CAPTURE_GUI1 or raises the existing
%      singleton*.
%
%      H = CAPTURE_GUI1 returns the handle to a new CAPTURE_GUI1 or the handle to
%      the existing singleton*.
%
%      CAPTURE_GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAPTURE_GUI1.M with the given input arguments.
%
%      CAPTURE_GUI1('Property','Value',...) creates a new CAPTURE_GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before capture_GUI1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to capture_GUI1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help capture_GUI1

% Last Modified by GUIDE v2.5 02-Jan-2017 13:24:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @capture_GUI1_OpeningFcn, ...
                   'gui_OutputFcn',  @capture_GUI1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before capture_GUI1 is made visible.
function capture_GUI1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to capture_GUI1 (see VARARGIN)

% Choose default command line output for capture_GUI1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%  opening function
imaqreset
path = 'C:\Users\ashishHP\Desktop\test';
set(handles.start,'string','START'); 
global  path_left path_right k format_a current_max1 current_max2
 k=0;
 [path_left,path_right] = date_folder(path); 
 format_a = 'F7_RGB_1288x964_Mode0';
 current_max1=0;
 current_max2=0;






% UIWAIT makes capture_GUI1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = capture_GUI1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in capture.
function capture_Callback(hObject, eventdata, handles)
% hObject    handle to capture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of capture

global im1 im2 flag1 

flag1 = 2;
axes(handles.axes1);% to show left camera image
imshow(im1);
axes(handles.axes2);% to show right camera image
imshow(im2);





% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im1 im2 path_left path_right k

k = k + 1;
a = k ;
fn1 = sprintf('cam--1-%d.tiff', a); % Left
fn2 = sprintf('cam--0-%d.tiff', a); % Right
file1 = fullfile(path_left,fn1);
file2 = fullfile(path_right,fn2);
imwrite(im1, file1); 
imwrite(im2, file2);




% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.start,'string','RESTART');

global vid1 vid2 flag1 im1 im2 format_a current_max1 current_max2

p_format_a='';
flag1=1;
while(flag1==1)
    num=get(handles.format,'value');
    format_a=myformat(num);
    if(strcmp(p_format_a,format_a)==0) 
    disp(format_a);
    imaqreset
    set(handles.format_text,'string','Wait..');
    vid1 = videoinput('pointgrey', 1, format_a); % Left
    set(vid1,'ReturnedColorSpace','rgb');
    set(vid1,'FramesPerTrigger',1);
    set(vid1,'TriggerRepeat',inf);
    triggerconfig(vid1,'manual'); 
    start(vid1);
    vid2 = videoinput('pointgrey', 2, format_a); % Right
    set(vid2,'ReturnedColorSpace','rgb');
    set(vid2,'FramesPerTrigger',1);
    set(vid2,'TriggerRepeat',inf);
    triggerconfig(vid2,'manual'); 
    start(vid2);

    pause(2);
    
    else 
    set(handles.format_text,'string','Done');
    trigger(vid1);%trigger for left camera
    im1=getdata(vid1);
    im1= fliplr(im1);
    [focus_left,max_left]= my_in_focus(im1,current_max1);
    set(handles.current_left,'string',num2str(focus_left));
    set(handles.high_left,'string',num2str(max_left));
    
    axes(handles.axes1);
    imshow(im1);
    %trigger for right camera
    trigger(vid2);
    im2=getdata(vid2);
    im2= fliplr(im2);
    [focus_right,max_right]= my_in_focus(im2,current_max2);
    set(handles.current_right,'string',num2str(focus_right));
    set(handles.high_right,'string',num2str(max_right));
    
    axes(handles.axes2);
    imshow(im2);
    
    
    
    end
    p_format_a=format_a;
    disp('yolo');
end
% --- Executes on selection change in format.
function format_Callback(hObject, eventdata, handles)
% hObject    handle to format (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns format contents as cell array
%        contents{get(hObject,'Value')} returns selected item from format


% --- Executes during object creation, after setting all properties.
function format_CreateFcn(hObject, eventdata, handles)
% hObject    handle to format (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
