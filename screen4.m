function varargout = screen4(varargin)
% SCREEN4 M-file for screen4.fig
%      SCREEN4, by itself, creates a new SCREEN4 or raises the existing
%      singleton*.
%
%      H = SCREEN4 returns the handle to a new SCREEN4 or the handle to
%      the existing singleton*.
%
%      SCREEN4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCREEN4.M with the given input arguments.
%
%      SCREEN4('Property','Value',...) creates a new SCREEN4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before screen4_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to screen4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help screen4

% Last Modified by GUIDE v2.5 28-May-2015 13:23:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @screen4_OpeningFcn, ...
                   'gui_OutputFcn',  @screen4_OutputFcn, ...
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


% --- Executes just before screen4 is made visible.
function screen4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to screen4 (see VARARGIN)

% Choose default command line output for screen4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes screen4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = screen4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load output_ga;
load output;
load data;

mse_error1=calc_mse(output,data(1:50,13));
mse_error2=calc_mse(output_ga,data(1:50,13));

h=findobj('Type','axes','Tag','axes1');
handles.axes1=h;
axes(h)

plot(mse_error1,'-k.');
hold on
plot(mse_error2,'-r*');
legend('mse befor ga','mse after ga')

h=findobj('Type','axes','Tag','axes2');
handles.axes2=h;
axes(h)

 plot(data(1:50,13),'-k.');
 hold on
% plot(output,'-r*');
% hold on;
plot(output_ga,'-g*');
legend('Actual output','Neuro fuzzy  output','Genetic output')



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% close all;

screen2