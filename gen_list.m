function output = gen_list(num)

    for i=1:num
       x = num2str(i);
       if length(x) ==2
           y(i,1) = x(1);
           y(i,2) = x(2);
       elseif length(x) ==3
           y(i,1) = x(1);
           y(i,2) = x(2);
           y(i,3) = x(3);
       else
           y(i,1) = x(1);
       end
    end
    output = y;
end