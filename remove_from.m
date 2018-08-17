function output = remove_from(input_array,target)

    len = length(input_array);
    edge = length(num2str(len));
    target_num = str2double(target);
    input_array(target_num,1:edge) = NaN;
    output = input_array;

    
end