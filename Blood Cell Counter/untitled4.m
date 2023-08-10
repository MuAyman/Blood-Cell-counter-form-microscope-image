%% IF YOU WANNA PLAY
%% WE CAN PLAY ALL DAY
%% BUT WE PLAY DIRTY, PLAY DIRTY


function varargout = untitled4(varargin)
% UNTITLED4 MATLAB code for untitled4.fig
%      UNTITLED4, by itself, creates a new UNTITLED4 or raises the existing
%      singleton*.
%
%      H = UNTITLED4 returns the handle to a new UNTITLED4 or the handle to
%      the existing singleton*.
%
%      UNTITLED4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED4.M with the given input arguments.
%
%      UNTITLED4('Property','Value',...) creates a new UNTITLED4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled4

% Last Modified by GUIDE v2.5 16-Dec-2019 11:48:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled4_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled4_OutputFcn, ...
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


% --- Executes just before untitled4 is made visible.
function untitled4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled4 (see VARARGIN)

% Choose default command line output for untitled4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Save is pressed');
File=fopen('Count.txt','w');
I = imread(get(handles.url, 'String'));
I2 = Imageprocessf(I);
[C0,C1,X] = Countf(I2);
C1 = Overlapf(X,C1);
density = Densityf(I,C1);
    fprintf(File,'Count of cells After overlapping detection=%d \n',C1);
    fprintf(File,'density=%0.d cells/pixel \n',density);

% --- Executes on button press in again.
function again_Callback(hObject, eventdata, handles)
% hObject    handle to again (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Again is pressed');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cla (handles.url, 'reset');            %%Removes the image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% --- Executes on button press in count.
function count_Callback(hObject, eventdata, handles)
% hObject    handle to count (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Count is pressed');
I = imread(get(handles.url, 'String'));
I2 = Imageprocessf(I);
[C0,C1,X] = Countf(I2);
C1 = Overlapf(X,C1);
density = Densityf(I,C1);
set(handles.cellsCount, 'String',C1);
set(handles.cellsDensity, 'String',density);





%%%%% My Image Processing Function %%%%%
function [I2]=Imageprocessf(I)
imshow(I)
I2=im2bw(I,graythresh(I));
I2=~I2;
I2= imfill(I2,'holes');



%%%%% My Count Function %%%%%
function [C0,C1,X]=Countf(I2)
B = bwboundaries(I2);

C0=length(B);
C1=C0;
for i=1:C0
X(i)=size(B{i},1);
end


%%%%% My Overlap Function %%%%%
function[C1]=Overlapf(X,C1)
M=median(X);
for i=1:length(X)
n=(X(i)/M);
end


%%%%% My Density Function %%%%%
function density=Densityf(I,C1)
totalPixels= size(I,1)*size(I,2);
density=C1/totalPixels;



function url_Callback(hObject, eventdata, handles)
% hObject    handle to url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of url as text
%        str2double(get(hObject,'String')) returns contents of url as a double


% --- Executes during object creation, after setting all properties.
function url_CreateFcn(hObject, eventdata, handles)
% hObject    handle to url (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cellsCount_Callback(hObject, eventdata, handles)
% hObject    handle to cellsCount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cellsCount as text
%        str2double(get(hObject,'String')) returns contents of cellsCount as a double


% --- Executes during object creation, after setting all properties.
function cellsCount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cellsCount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cellsDensity_Callback(hObject, eventdata, handles)
% hObject    handle to cellsDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cellsDensity as text
%        str2double(get(hObject,'String')) returns contents of cellsDensity as a double


% --- Executes during object creation, after setting all properties.
function cellsDensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cellsDensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% IF YOU WANNA PLAY
%% WE CAN PLAY ALL DAY
%% BUT WE PLAY DIRTY, PLAY DIRTY
