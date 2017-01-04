function varargout = capture_GUI(varargin)
% CAPTURE_GUI MATLAB code for capture_GUI.fig
%      CAPTURE_GUI, by itself, creates a new CAPTURE_GUI or raises the existing
%      singleton*.
%
%      H = CAPTURE_GUI returns the handle to a new CAPTURE_GUI or the handle to
%      the existing singleton*.
%
%      CAPTURE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAPTURE_GUI.M with the given input arguments.
%
%      CAPTURE_GUI('Property','Value',...) creates a new CAPTURE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before capture_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to capture_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help capture_GUI

% Last Modified by GUIDE v2.5 02-Jan-2017 12:33:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @capture_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @capture_GUI_OutputFcn, ...
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


% --- Executes just before capture_GUI is made visible.
function capture_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to capture_GUI (see VARARGIN)

% Choose default command line output for capture_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imaqreset
global format
set(handles.start,'string','START');
format = 'F7_YUV411_320x240_Mode5';
% vid1 = videoinput('pointgrey', 1, format); % Left
% vid2 = videoinput('pointgrey', 2, format); % Right


% UIWAIT makes capture_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = capture_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in capture_left.
function capture_left_Callback(hObject, eventdata, handles)
% hObject    handle to capture_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of capture_left


% --- Executes on button press in capture_right.
function capture_right_Callback(hObject, eventdata, handles)
% hObject    handle to capture_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of capture_right


% --- Executes on button press in save_left.
function save_left_Callback(hObject, eventdata, handles)
% hObject    handle to save_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in save_right.
function save_right_Callback(hObject, eventdata, handles)
% hObject    handle to save_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function current_focus_left_Callback(hObject, eventdata, handles)
% hObject    handle to current_focus_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of current_focus_left as text
%        str2double(get(hObject,'String')) returns contents of current_focus_left as a double


% --- Executes during object creation, after setting all properties.
function current_focus_left_CreateFcn(hObject, eventdata, handles)
% hObject    handle to current_focus_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function high_focus_left_Callback(hObject, eventdata, handles)
% hObject    handle to high_focus_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of high_focus_left as text
%        str2double(get(hObject,'String')) returns contents of high_focus_left as a double


% --- Executes during object creation, after setting all properties.
function high_focus_left_CreateFcn(hObject, eventdata, handles)
% hObject    handle to high_focus_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function current_focus_right_Callback(hObject, eventdata, handles)
% hObject    handle to current_focus_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of current_focus_right as text
%        str2double(get(hObject,'String')) returns contents of current_focus_right as a double


% --- Executes during object creation, after setting all properties.
function current_focus_right_CreateFcn(hObject, eventdata, handles)
% hObject    handle to current_focus_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function high_focus_right_Callback(hObject, eventdata, handles)
% hObject    handle to high_focus_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of high_focus_right as text
%        str2double(get(hObject,'String')) returns contents of high_focus_right as a double


% --- Executes during object creation, after setting all properties.
function high_focus_right_CreateFcn(hObject, eventdata, handles)
% hObject    handle to high_focus_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
