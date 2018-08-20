function output = contained_in(blist,target)
    new_list = [];
    edge = length(num2str(length(blist)));
    for i=1:length(blist)
       if not(strcmp(blist(i,1),'-')) 
           new_list = [new_list;str2double(blist(i,1:edge))];
       end
    end
    output = max(ismember(new_list,str2double(target)));
%       output = new_list;
end