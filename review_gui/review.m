function varargout = review(varargin)
% REVIEW MATLAB code for review.fig
%      REVIEW, by itself, creates a new REVIEW or raises the existing
%      singleton*.
%
%      H = REVIEW returns the handle to a new REVIEW or the handle to
%      the existing singleton*.
%
%      REVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REVIEW.M with the given input arguments.
%
%      REVIEW('Property','Value',...) creates a new REVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before review_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to review_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help review

% Last Modified by GUIDE v2.5 20-Aug-2018 13:44:56
%--------------------------------------------------------------------------
% To Do

%   - Try plotting skeleton 
%   - Think of most logical way to save variables to workspace
%       - Include option to reload previous lists 
%           - Might be able to do this by using the initialize button vs.
%           initial rendering of the list boxes
%--------------------------------------------------------------------------

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @review_OpeningFcn, ...
                   'gui_OutputFcn',  @review_OutputFcn, ...
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


% --- Executes just before review is made visible.
function review_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to review (see VARARGIN)

% Choose default command line output for review
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes review wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = review_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function bnum_Callback(hObject, eventdata, handles)
% hObject    handle to bnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bnum as text
%        str2double(get(hObject,'String')) returns contents of bnum as a double


% --- Executes during object creation, after setting all properties.
function bnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in increment.
function increment_Callback(hObject, eventdata, handles)
% hObject    handle to increment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    comp = str2double(get(handles.n_complete,'String')) + 1
    rem = str2double(get(handles.n_rem,'String')) - 1
    set(handles.n_complete,'String',comp)
    set(handles.n_rem,'String',rem)

% --- Executes on selection change in comp_list.
function comp_list_Callback(hObject, eventdata, handles)
% hObject    handle to comp_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns comp_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from comp_list


% --- Executes during object creation, after setting all properties.
function comp_list_CreateFcn(hObject, eventdata, handles)

% hObject    handle to comp_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in rem_list.
function rem_list_Callback(hObject, eventdata, handles)
% hObject    handle to comp_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns comp_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from comp_list


% --- Executes during object creation, after setting all properties.
function rem_list_CreateFcn(hObject, eventdata, handles)

% hObject    handle to comp_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in add_to_list.
function add_to_list_Callback(hObject, eventdata, handles)
% hObject    handle to add_to_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %     i = 1
    %     len = length(cellstr(get(hObject,'String')))
    branch = get(handles.bnum,'String')
    num = str2double(branch)
%     n_complete = str2double(get(handles.n_complete,'String'))
    y = get(handles.comp_list,'String')
    z = get(handles.rem_list,'String')
    i = 1;
    while i<length(y)
        if strcmp(y(i),'-')
            target = i;
            break
        else 
            i = i+1;
        end
    end
    if length(branch) == 2
        y(i,1) = branch(1)
        y(i,2) = branch(2)
    elseif length(branch) == 3
        y(i,1) = branch(1)
        y(i,2) = branch(2)
        y(i,3) = branch(3)
    else
        y(i) = branch
    end
    z = remove_from(z,branch);
%     varargout = z;
    set(handles.comp_list,'String',y)
    set(handles.rem_list,'String',z)
    assignin('base','comp_list',y)
    assignin('base','rem_list',z)
    
    
function initial_Callback(hObject, eventdata, handles)
% hObject    handle to initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial as text
%        str2double(get(hObject,'String')) returns contents of initial as a double


% --- Executes during object creation, after setting all properties.
function initial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in init.
function init_Callback(hObject, eventdata, handles)
% hObject    handle to init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    total = str2double(get(handles.initial,'String'))
    set(handles.n_rem,'String',get(handles.initial,'String'))
    set(handles.n_complete,'String',0)
    z = gen_list(total);
    y = make_array(total)
    y
    set(handles.comp_list,'String',y)
    set(handles.rem_list,'String',z)
    set(handles.link_list,'String',y)
    WinOnTop();
    
    


% --- Executes on button press in check_button.
function check_button_Callback(hObject, eventdata, handles)
% hObject    handle to check_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    branch_check = get(handles.check,'String')
    comp_list = get(handles.comp_list,'String')
    if contained_in(comp_list,branch_check)
        set(handles.check_ans,'String','Yes')
    else
        set(handles.check_ans,'String','Nice try nerd')
    end


function check_Callback(hObject, eventdata, handles)
% hObject    handle to check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of check as text
%        str2double(get(hObject,'String')) returns contents of check as a double


% --- Executes during object creation, after setting all properties.
function check_CreateFcn(hObject, eventdata, handles)
% hObject    handle to check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in link_list.
function link_list_Callback(hObject, eventdata, handles)
% hObject    handle to link_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns link_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from link_list
    

% --- Executes during object creation, after setting all properties.
function link_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to link_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in link.
function link_Callback(hObject, eventdata, handles)
% hObject    handle to link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    x = get(handles.link_list,'String')
    branch = get(handles.branch_link,'String')
    branch_num = str2double(branch);
    len = length(x);
    edge = length(branch);
    for i=1:len 
        if strcmp('-',x(i))
            x(i,1:edge) = branch;
            break
        end
    end
    set(handles.link_list,'String',x)
    assignin('base','link_list',x)
    
    
    


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    len = length(get(handles.link_list,'String'));
    x = make_array(len);
    set(handles.link_list,'String',x)
    
    
    
    

function branch_link_Callback(hObject, eventdata, handles)
% hObject    handle to branch_link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of branch_link as text
%        str2double(get(hObject,'String')) returns contents of branch_link as a double


% --- Executes during object creation, after setting all properties.
function branch_link_CreateFcn(hObject, eventdata, handles)
% hObject    handle to branch_link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function remove_branch_Callback(hObject, eventdata, handles)
% hObject    handle to remove_branch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of remove_branch as text
%        str2double(get(hObject,'String')) returns contents of remove_branch as a double


% --- Executes during object creation, after setting all properties.
function remove_branch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to remove_branch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in remove.
function remove_Callback(hObject, eventdata, handles)
% hObject    handle to remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    comp_list = get(handles.comp_list,'String');
    rem_list = get(handles.rem_list,'String');
    target = get(handles.remove_branch,'String');
    new_comp_list = remove_item(comp_list,target);
    new_rem_list = add_to(rem_list, target);
    set(handles.rem_list,'String',new_rem_list);
    set(handles.comp_list,'String',new_comp_list);
    assignin('base','comp_list',new_comp_list)
    assignin('base','rem_list',new_rem_list)


