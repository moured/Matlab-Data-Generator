% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

function varargout = File(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @File_OpeningFcn, ...
                   'gui_OutputFcn',  @File_OutputFcn, ...
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

function File_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
axis off


function varargout = File_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
     Home;
     close(File);

     
function pushbutton2_Callback(hObject, eventdata, handles)
global FileName
global FilePath
[FileName,FilePath]=uigetfile({'*.wav';'*.mp3'});
ExPath = [FilePath FileName];
set(handles.edit1,'String',ExPath);


function edit1_Callback(hObject, eventdata, handles)



function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton3_Callback(hObject, eventdata, handles)
global FileName
global FilePath
global y
global Fs

ExPath = [FilePath FileName];
[y,Fs] = audioread(ExPath);
assignin('base', 'AudioTimeSequence',y);
assignin('base', 'SamplingFrequency',Fs);
figure(1);
plot(y);
set(handles.text3, 'String', num2str(Fs));


function pushbutton4_Callback(hObject, eventdata, handles)
global y
global Fs
sound(y,Fs);

% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

