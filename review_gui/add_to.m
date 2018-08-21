function output = add_to(input_array,target)
    
    len = length(input_array);
    edge = length(target);
    target_num = str2double(target);
    input_array(target_num,1:edge) = target;%Used to be NaN
    output = input_array;
    

end