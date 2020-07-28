% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

function varargout = Home(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_OutputFcn, ...
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

function Home_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

matlabImage = imread('imgs/logo.png');
image(matlabImage);
axis off
axis image

function varargout = Home_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function Choose_Callback(hObject, eventdata, handles)

if get(handles.radiobutton1,'Value')    == 1
     Microphone;
     close(Home);
elseif get(handles.radiobutton2,'Value') == 1
     File;
     close(Home);
elseif get(handles.radiobutton3,'Value') == 1
     DataGenerator;
     close(Home);
 end

function Close_Callback(hObject, eventdata, handles)
     close(Home);

function axes1_CreateFcn(hObject, eventdata, handles)


function radiobutton1_Callback(hObject, eventdata, handles)
function radiobutton2_Callback(hObject, eventdata, handles)
function radiobutton3_Callback(hObject, eventdata, handles)

% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured
