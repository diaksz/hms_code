function output = remove_item(blist,target)
    new_list = [];
    target_num = str2double(target);
    
    
    
    edge = length(num2str(length(blist)));
    for i=1:length(blist)
       if not(strcmp(blist(i,1),'-')) 
           new_list = [new_list;str2double(blist(i,1:edge))];
       end
    end
    [x y] = max(ismember(new_list,target_num));
    y = num2str(y);
    output = remove_from(blist,y);    
end