% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

function varargout = DataGenerator(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataGenerator_OpeningFcn, ...
                   'gui_OutputFcn',  @DataGenerator_OutputFcn, ...
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


function DataGenerator_OpeningFcn(hObject, eventdata, handles, varargin)
global Choice
handles.output = hObject;
guidata(hObject, handles);
axis off

function varargout = DataGenerator_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
Home;
close(DataGenerator);

%------------------------------ Pop-Menu -------------------------------------
%-----------------------------------------------------------------------------
function popupmenu1_Callback(hObject, eventdata, handles)
global Choice
Choice = get(hObject,'Value')-1;
if Choice     == 1
set(handles.edit3,'string','[Amplitude, Frequency, Phase]');
elseif ismember(Choice,[2 3 4 5 6 7 8 9]) == 1
set(handles.edit3,'string','[Amp Freq Phas ST WD]');
elseif Choice == 10
set(handles.edit3,'string','[Amp Init-Freq Bandwith Phas ST WD]');
elseif Choice == 11
set(handles.edit3,'string','[Amp Freq Phas DC]');
elseif Choice == 12
set(handles.edit3,'string','[Amp Freq Phas Width]');
elseif Choice == 13
set(handles.edit3,'string','[M Amp1 Freq1 Ph1 etc..]');
end   

function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
Menu = {'Choose Type','Sinusoidal signal','Windowed Sinusoidal - Rectangular' ...
        ,'Windowed Sinusoidal - Gaussian','Windowed Sinusoidal - Hamming'     ...
        ,'Windowed Sinusoidal - Tukey'                                        ...
        ,'Windowed Sinusoidal - Kaiser','Windowed Sinusoidal - Chebyshev'     ...
        ,'Windowed Sinusoidal - Triangular','Windowed Sinusoidal - Taylor'    ...
        ,'Rectangle Windowed Linear Chirp'                                    ...
        ,'Square wave','Sawtooth wave','Multiple Components'};
set(hObject,'String',Menu);
%------------------------------------------------------------------------
%------------------------------------------------------------------------


function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
global Choice
[TimeDomain FrequencyDomain Time] = DataGeneratorFunction(Choice,str2num(get(handles.edit1,'String')),str2num(get(handles.edit2,'String')),str2num(get(handles.edit3,'String')));
assignin('base', 'TimeDomainSignal',TimeDomain);
assignin('base', 'FrequecnyMagnitudeSignal',FrequencyDomain);
if get(handles.radiobutton1,'Value')==1
    figure(1);
    plot(Time,TimeDomain);
elseif get(handles.radiobutton2,'Value')==1
    figure(1);
    plot(Time,FrequencyDomain);
end

% This code was written by : OMAR MOURED as part of his DSP project,
% and is shared in Github with MIT license https://github.com/moured

