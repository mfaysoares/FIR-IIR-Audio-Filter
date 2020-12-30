function varargout = T1_DSP(varargin)
% T1_DSP MATLAB code for T1_DSP.fig
%      T1_DSP, by itself, creates a new T1_DSP or raises the existing
%      singleton*.
%
%      H = T1_DSP returns the handle to a new T1_DSP or the handle to
%      the existing singleton*.
%
%      T1_DSP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in T1_DSP.M with the given input arguments.
%
%      T1_DSP('Property','Value',...) creates a new T1_DSP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before T1_DSP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to T1_DSP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help T1_DSP

% Last Modified by GUIDE v2.5 11-Jul-2019 09:25:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @T1_DSP_OpeningFcn, ...
                   'gui_OutputFcn',  @T1_DSP_OutputFcn, ...
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


% --- Executes just before T1_DSP is made visible.
function T1_DSP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to T1_DSP (see VARARGIN)

% Choose default command line output for T1_DSP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes T1_DSP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = T1_DSP_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
axes(handles.axes9)
[YourImage, ~, ImageAlpha] = imread('pucrs2.png');
image(YourImage, 'AlphaData', ImageAlpha)
axis off
axis image
axes(handles.axes11)
[YourImage, ~, ImageAlpha] = imread('MyImageFile.png');
image(YourImage, 'AlphaData', ImageAlpha)
axis off
axis image
axes(handles.axes7)
axis off
axes(handles.axes8)
axis off
axes(handles.axes12);
axis off




% % --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
[y1,Fs1] = audioread('noised_audio.wav');
axes(handles.axes7);
ts1 = 1/Fs1;
n1 = length(y1);
t1 = (0:((n1)-1))*ts1;
plot(t1,y1);
axis([0 12 -2 2])
xlabel('Time Domain (s)');
grid on;

nfft_ = length(y1);
nfft2_=2.^nextpow2(nfft_);
fy_ = fft(y1,nfft2_);
fy_ = fy_(1:nfft2_/2);
xfft_ = Fs1.*(0:nfft2_/2-1)/nfft2_;
axes(handles.axes8);
plot(xfft_,abs(fy_/max(fy_)));
xlabel('Frequency Domain (Hz)');
grid on;
axes(handles.axes12);
spectrogram(y1,256,[],[],Fs1,'yaxis')


sound(y1,Fs1);
set(handles.radiobutton2, 'Enable', 'off');
set(handles.radiobutton4, 'Enable', 'off');
pause(length(y1)./Fs1);
set(handles.radiobutton2, 'Enable', 'on');
set(handles.radiobutton4, 'Enable', 'on');
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);




% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
[y2,Fs2] = audioread('audio_filtrado_FIR_20.wav');
axes(handles.axes7);
ts2 = 1/Fs2;
n2 = length(y2);
t2 = (0:((n2)-1))*ts2;
plot(t2,y2);
xlabel('Time Domain (s)');
grid on;

nfft_ = length(y2);
nfft2_=2.^nextpow2(nfft_);
fy_ = fft(y2,nfft2_);
fy_ = fy_(1:nfft2_/2);
xfft_ = Fs2.*(0:nfft2_/2-1)/nfft2_;
axes(handles.axes8);
plot(xfft_,abs(fy_/max(fy_)));
xlabel('Frequency Domain (Hz)');
grid on;

axes(handles.axes12);
spectrogram(y2,256,[],[],Fs2,'yaxis')

set(handles.radiobutton1, 'Enable', 'off');
set(handles.radiobutton4, 'Enable', 'off');
sound(y2,Fs2);
pause(length(y2)./Fs2);
set(handles.radiobutton1, 'Enable', 'on');
set(handles.radiobutton4, 'Enable', 'on');
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
[y3,Fs3] = audioread('audio_filtrado_IIR_3_0.wav');
axes(handles.axes7);
ts3 = 1/Fs3;
n3 = length(y3);
t3 = (0:((n3)-1))*ts3;
plot(t3,y3);
xlabel('Time Domain (s)');
grid on;

nfft_ = length(y3);
nfft2_=2.^nextpow2(nfft_);
fy_ = fft(y3,nfft2_);
fy_ = fy_(1:nfft2_/2);
xfft_ = Fs3.*(0:nfft2_/2-1)/nfft2_;
axes(handles.axes8);
plot(xfft_,abs(fy_/max(fy_)));
xlabel('Frequency Domain (Hz)');
grid on;
axes(handles.axes12);
spectrogram(y3,256,[],[],Fs3,'yaxis')


sound(y3,Fs3);
set(handles.radiobutton1, 'Enable', 'off');
set(handles.radiobutton2, 'Enable', 'off');
pause(length(y3)./Fs3);
set(handles.radiobutton1, 'Enable', 'on');
set(handles.radiobutton2, 'Enable', 'on');
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);
