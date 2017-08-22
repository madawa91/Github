function varargout = zzxx(varargin)
% ZZXX MATLAB code for zzxx.fig
%      ZZXX, by itself, creates a new ZZXX or raises the existing
%      singleton*.
%
%      H = ZZXX returns the handle to a new ZZXX or the handle to
%      the existing singleton*.
%
%      ZZXX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZZXX.M with the given input arguments.
%
%      ZZXX('Property','Value',...) creates a new ZZXX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zzxx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zzxx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zzxx

% Last Modified by GUIDE v2.5 22-Aug-2017 01:24:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zzxx_OpeningFcn, ...
                   'gui_OutputFcn',  @zzxx_OutputFcn, ...
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


% --- Executes just before zzxx is made visible.
function zzxx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zzxx (see VARARGIN)

% Choose default command line output for zzxx
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zzxx wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zzxx_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

try
datasource = 'testuser';
conn = database(datasource,'testuser','1234');
conn.Message;

q= get(handles.edit1, 'string');
z=get(handles.edit2,'string'); 

p=str2double(q);



insertdata ={p z};
colnames = {'age','name'};
data_table = cell2table(insertdata,'VariableNames',colnames);
tablename = 'tbl_users';
insert(conn,tablename,colnames,data_table);

    msgbox('Successfully Data is Saved');
    
% curs = exec(conn,'SELECT * FROM tbl_ss');
% curs = fetch(curs);
% curs.Data  
% close(curs)
close(conn)
 catch Me
    
      msgbox( strcat('Database Save Error !',Me));
      close(curs)
      close(conn)
end




















% datasource = 'testuser';
% conn = database(datasource,'testuser','1234');
% 
% if(isempty(conn.message))
% 
%      disp('database connected')
% 
%  else
%      disp('cannot connected')
% 
%      disp(conn.message);
% 
%      return
% end
% 
% setdbprefs('DataReturnFormat','numeric')
% 
% 
% 
% 
% test_name=get(handles.edit2, 'string'); 
% test_age= get(handles.edit1, 'string');
% 
% 
% % test_age=str2num(test_age);
% exdata2={test_name,test_age};
% 
% % exdata = {'2','Shalu','22','female'};
% 
% 
% fastinsert(conn, 'tbl_user', {'age','name' },exdata2)
% 
% commit(conn)
% 
% close(conn);
% name = get(handles.edit1, 'string'); % we dont want this, But just add to chek. we want   this name in database.
% 
% disp(name)
% 
% age = get(handles.edit2, 'string'); 
% 
% disp(age)




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

try
datasource = 'testuser';
conn = database(datasource,'testuser','1234');
conn.Message;
 
curs = exec(conn,'SELECT * FROM tbl_users');
 curs = fetch(curs);
  curs.Data
 data = curs.Data;
 
 age = {data(1)};
 name = {data(2)};

%  set(handles.edit3,'String',a);
%  set(handles.edit4,'String',b);

% %  raw=[age name];
% %  set(handles.uitable1,'Data',raw);
 
%   set(handles.uitable1,'Data',age);
%   set(handles.uitable2,'Data',name);
 
 close(curs)
 close(conn)
 catch Me
    
      msgbox( strcat('Database Save Error !',Me));
      close(curs)
      close(conn)
end










function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end