

close all
x = 0:0.1:5;
y = exp(-x);

figure(10);
plot(x,y, 'Color', clr.gum_pink);
title(['title line1' pubfig.newline 'line2'])
xlabel('x label');
ylabel('y label');

figure(11);
plot(x,y, 'Color', clr.gum_pink);
title(['title line1' pubfig.newline 'line2'])
xlabel('x label');
ylabel('y label');

pubfig.mul_axis_tick_by_factor(3, 'X');
pubfig.mirror_axis('X');
pubfig.text_size(20);

%%
figure(20);
plot(x,log10(y), 'Color', clr.brown_orange);
title(['title line1' pubfig.newline 'line2'])
xlabel('x label');
ylabel('y label');

figure(21);
plot(x,log10(y), 'Color', clr.brown_orange);
title(['title line1' pubfig.newline 'line2'])
xlabel('x label');
ylabel('y label');
pubfig.set_axishnd_tick_spacing(5, gca, 'Y', true);
pubfig.make_ax_exp('Y');
pubfig.template1

%%
figure(30);
img = (1:30).'*(1:30);
imagesc(log(a));
hcbr = colorbar;
title(['title line1' pubfig.newline 'line2'])
xlabel('x label');
ylabel('y label');

figure(31);
pubfig.text_size(20, 30); % setting the fontsize of figure 30, though gca is 31

imagesc(log(a));
colormap(clr.map_darkpink)
hcbr = colorbar;
title(['title line1' pubfig.newline 'line2'])
xlabel('x label');
ylabel('y label');

pubfig.make_ax_exp('Y', hcbr, 'exp');
pubfig.text_size(20);





