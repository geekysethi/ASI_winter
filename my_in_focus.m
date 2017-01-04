function [ focus,current_max ] = my_in_focus( im,current_max )
%my_in_focus Summary of this function goes here
%   Detailed explanation goes here
     focus = fmeasure(im, 'BREN');
      if (focus > current_max) 
        % We have a new winner
        current_max = focus;
     end

end

