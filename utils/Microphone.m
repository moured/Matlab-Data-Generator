% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

function varargout = Microphone(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Microphone_OpeningFcn, ...
                   'gui_OutputFcn',  @Microphone_OutputFcn, ...
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


function Microphone_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);
info = audiodevinfo;
Devices.Names = char(info.input.Name);
set(handles.popupmenu1, 'String',Devices.Names);

function varargout = Microphone_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function popupmenu1_Callback(hObject, eventdata, handles)
 

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles) %% HZ
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles) %% BITS PER SECOND
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton3_Callback(hObject, eventdata, handles)  %% RECORD 
global recObj
recObj = audiorecorder(str2num(get(handles.edit3,'String')),str2num(get(handles.edit4,'String')),1,get(handles.popupmenu1,'Value'));
record(recObj);


function pushbutton5_Callback(hObject, eventdata, handles) %%STOP 
global recObj
stop(recObj);
myRecording = getaudiodata(recObj);
figure(1);
plot(myRecording);

function pushbutton6_Callback(hObject, eventdata, handles) %% PLAY
global recObj
myRecording = getaudiodata(recObj);
sound(myRecording,str2num(get(handles.edit3,'String')),str2num(get(handles.edit4,'String')));


function pushbutton1_Callback(hObject, eventdata, handles) %% BACK 
     Home;
     close(Microphone);

function pushbutton7_Callback(hObject, eventdata, handles)
global recObj
Location=dir('Recordings\');
myRecording = getaudiodata(recObj);
assignin('base', 'RecordedData',myRecording);
FileName = strcat('Recordings\','Recorded_Sound','.wav');
audiowrite(FileName, myRecording,str2num(get(handles.edit3,'String')),'BitsPerSample',str2num(get(handles.edit4,'String')));

% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

