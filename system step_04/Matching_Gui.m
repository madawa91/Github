function varargout = Matching_Gui(varargin)
% MATCHING_GUI MATLAB code for Matching_Gui.fig
%      MATCHING_GUI, by itself, creates a new MATCHING_GUI or raises the existing
%      singleton*.
%
%      H = MATCHING_GUI returns the handle to a new MATCHING_GUI or the handle to
%      the existing singleton*.
%
%      MATCHING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATCHING_GUI.M with the given input arguments.
%
%      MATCHING_GUI('Property','Value',...) creates a new MATCHING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Matching_Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Matching_Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Matching_Gui

% Last Modified by GUIDE v2.5 12-Aug-2017 07:14:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Matching_Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Matching_Gui_OutputFcn, ...
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


% --- Executes just before Matching_Gui is made visible.
function Matching_Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Matching_Gui (see VARARGIN)

% Choose default command line output for Matching_Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Matching_Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Matching_Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)


[fname, path]=uigetfile('.jpg''Provide a image for testing');
fname=strcat(path,fname); 
im=imread(fname);
im = rgb2gray(im);
imshow(im);
title('Test Image');

Ftest=FeatureStatistical(im);

load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(dist);
if(Min<3)
m=find(dist==Min,1);
det_class= Ctrain(m); 
msgbox(strcat( 'Image is Matched // Detect Class is=',num2str(det_class)));
else
    msgbox('This Person is not registered in database');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)



% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
