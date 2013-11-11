
classdef myfig 
% A class that define nice colors for graphs
% usage clr."color name", e.g.
% clr.gum_pink
   properties(Constant)
   end
   
   methods(Static)
       function text_size(fontsize, fhnd)
           if (nargin < 2)
               fhnd = gcf;
           end
           
           axAllH = findobj(fhnd, 'type', 'axes').'; 
           
           
           for h = axAllH
               set(h, 'FontSize', fontsize);
               set(get(h, 'Title'), 'FontSize', fontsize);
               set(get(h, 'Xlabel'), 'FontSize', fontsize);
               set(get(h, 'Ylabel'), 'FontSize', fontsize);
               set(get(h, 'Zlabel'), 'FontSize', fontsize);               
           end     
       end

       function mul_axis_tick_by_factor(factor, XYZind, ahnd)
           if (nargin < 3)
               ahnd = gca;
           end
           axticks = get(ahnd, [XYZind 'Tick']);           
           set(ahnd, [XYZind 'TickLabel'], factor*axticks);         
       end
       
       function make_ax_exp(XYZind,  ahnd, basis)
           if (nargin < 2)
               ahnd = gca;
           end           
           if (nargin < 3)
               basis = 10;
           end           
           
           switch basis
               case 10
                   strbasis = '10';
               case 2
                   strbasis = '2';
               case 'exp'
                   strbasis = 'e';
           end
                   
          
           
           myfig.set_axishnd_tick_spacing(5, ahnd, XYZind, true);
           axticks = get(ahnd, [XYZind 'TickLabel']);
           newticks = [];
           for cnt = 1:size(axticks,1)
               newticks{cnt} = [strbasis '^' axticks(cnt,:)];
           end
           set(ahnd, [XYZind 'TickLabel'], newticks);
           
       end
       
       
       function mirror_axis( XYZind, ahnd)
           if (nargin < 2)
               ahnd = gca;
           end
           axticks = get(ahnd, [XYZind 'TickLabel']);           
           set(ahnd, [XYZind 'TickLabel'], flipud(axticks));
       end
       
       function set_axishnd_tick_spacing(nintervals, ahnd, XYZind, toround)
           if (nargin < 4)
               toround  = false;
           end
           inlims  = get(ahnd, [XYZind 'Lim']);
           
           interval = (diff(inlims)/nintervals);
           if(toround == true)
               interval = round(interval);
           end
           
           set(ahnd, [XYZind 'Tick'], inlims(1):interval:inlims(2));
       end

       function set_axis_tick_spacing(nintervals, fhnd, toround)
           if (nargin < 2)
               fhnd = gcf;
           end
           
           if (nargin < 3)
               toround  = false;
           end
           
           axAllH = findobj(fhnd, 'type', 'axes').'; 
           axLegH = findobj(fhnd, 'tag', 'legend').'; 
           axAllH = setdiff(axAllH, axLegH); % remove the legends axes
           
           
           for h = axAllH
               
               cnt = 1;
               for ax = {'X', 'Y', 'Z'}
                   
                   inlims  = get(h, [ax{1} 'Lim']);
                   
                   interval = (diff(inlims)/nintervals);
                   if(toround == true)
                       interval = round(interval);
                   end
                   
                   set(h, [ax{1} 'Tick'], inlims(1):interval:inlims(2));
%                    set(h, [ax{1} 'TickLabel'], xyzFactors(cnt)*(inlims(1):interval:inlims(2)));
                   
                   cnt = cnt+1;
               end
           end    
           
       end

       
       function setbox(onoff, fhnd)
           if (nargin < 2)
               fhnd = gcf;
           end
           
           axAllH = findobj(fhnd, 'type', 'axes').';
           axLegH = findobj(fhnd, 'tag', 'legend').'; 
           axAllH = setdiff(axAllH, axLegH); % remove the legends axes
           
           
           for h = axAllH               
               set(h, 'Box', onoff)
           end
           
       end
       
       function print_eps(filename,  fhnd, other_format)
           if nargin<2
               fhnd = gcf;
           end
           if nargin < 3
               other_format = [];
           end
           A3sizecm = [ 14.85, 21];
           pos = get(fhnd, 'Position');
           pos = pos(3:4);
           [mxpos, xy] = max(pos);
           paperpos = [A3sizecm(xy) A3sizecm(xy)*pos(3-xy)/mxpos];
           if (xy == 2)
               paperpos = fliplr(paperpos);
           end
           
           set(fhnd, 'PaperUnits', 'centimeters');
           set(fhnd, 'PaperPosition', [0 0 paperpos]);
           
           print(fhnd, '-depsc2', '-r300', [filename '.eps']);
           if ~isempty(other_format)
               eps2xxx([filename '.eps'], other_format);
           end
       end
       
       function print_fig(filename,  ftype, fhnd)
           if nargin<3
               fhnd = gcf;
           end
           
           if nargin<2
               ftype = 'tiff';
           end    
           
           switch ftype
               case 'tiff'
                   ext = '.tif';
               case 'jpeg'
                   ext = '.jpg';
               otherwise
                   ext = ['.' ftype];
           end
           
           if nargin < 1
               
               filename = ['figure' num2str(fhnd)];
           end
           
           
           if ~ispc
               myfig.print_eps(filename,  fhnd, {ftype})
           else
               
               A3sizecm = [ 14.85, 21];
               pos = get(fhnd, 'Position');
               pos = pos(3:4);
               [mxpos, xy] = max(pos);
               paperpos = [A3sizecm(xy) A3sizecm(xy)*pos(3-xy)/mxpos];
               if (xy == 2)
                   paperpos = fliplr(paperpos);
               end
               
               set(fhnd, 'PaperUnits', 'centimeters');
               set(fhnd, 'PaperPosition', [0 0 paperpos]);
               
               print(fhnd, ['-d' ftype], '-r300', [filename ext]);
           end
           
       end
       
       function template1(fhnd)
           if (nargin < 1)
               fhnd = gcf;
           end
           
           myfig.text_size(20, fhnd);
           myfig.set_axis_tick_spacing(5, fhnd);
           myfig.setbox('off', fhnd)
       end
       
       function char = newline()
           % function char = newline()
           % return a newline char
           char = sprintf('\n');
       end
       
       
           
       
       
       
   end
end