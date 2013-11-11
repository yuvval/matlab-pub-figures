
classdef clr 
% A class that define nice colors for graphs
% usage clr."color name", e.g.
% clr.gum_pink
   properties(Constant)
       carribean_blue = [ 0.4000    0.6500    0.9000];
       pastel_blue = [0.4000    0.6500    0.9000].^2;
       navy_blue = [0 0 128 ]/255;
       gray_sky_blue = [96 123 139 ]/255;
       gum_pink = [1.0000    0.4000    0.9000];
       gray_pink = [139 95 101 ]/255;
       brown_orange = [0.9000    0.6500    0.4000];
       pastel_red = [0.9000    0.4000    0.4000];
       indian_red = [ 176 23 31 ]/255;
       purple_wine = [0.6500    0.4000    0.6500];
       forest_green = [34 139 34  ]/255;
       dark_olive_green = [85 107 47 ]/255;
       
       num = [[ 0.4000    0.6500    0.9000] ;
           [0.4000    0.6500    0.9000].^2;
           [0 0 128 ]/255;
           [96 123 139 ]/255;
           [1.0000    0.4000    0.9000];
           [139 95 101 ]/255;
           [0.9000    0.6500    0.4000];
           [0.9000    0.4000    0.4000];
           [ 176 23 31 ]/255;
           [0.6500    0.4000    0.6500];
           [34 139 34  ]/255;
           [85 107 47 ]/255;];
   end
   methods(Static)
       function cmap = map_darkpink()
           tmp = pink;  
           cmap = tmp(1:32,:);
       end
       function cmap = map_brown_yellow()
           tmp = pink;  
           cmap = tmp(1:48,:).^2;
       end
       function cmap = map_brown_yellow2()
           tmp = pink;  
           cmap = tmp(32:60,:).^4;
       end
   end
end