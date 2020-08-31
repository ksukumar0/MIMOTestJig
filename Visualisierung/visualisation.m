close all
inverse = load('inverse.mat');
output = load('output.mat');

x = inverse.training(:, 1, 1:2);
n = inverse.training(:, 2, 1:2);
y = inverse.training(:, 3, 1:2);
% linear = inverse.training(:, 4, 1:2);
xn = x + n;

output = output.output;
% maxv = max(max(abs(output(:, 1:2))));
% output = output/100;
    

%% subplot 1
figure
title('XY Plot of Real parts of the input signals $$x_1$$ and $$x_2$$','Interpreter','Latex')
xlabel('Real($$x_1$$)','Interpreter','Latex');
ylabel('Real($$x_2$$)','Interpreter','Latex');
h = zeros(2,1);

hold on

min = inf;
point = 1/sqrt(2);
ind = 0;
for i = 1 : size(x, 1)
    min = inf;
    if(sum(abs(x(i, :) - [point, point])) < min)
        ind = 0;
        min = sum(abs(x(i, :) - [point, point]));
    end
    if(sum(abs(x(i, :) - [point, -point])) < min)
        ind = 1;
        min = sum(abs(x(i, :) - [point, -point]));
    end
    if(sum(abs(x(i, :) - [-point, point])) < min)
        ind = 2;
        min = sum(abs(x(i, :) - [-point, point]));
    end
    if(sum(abs(x(i, :) - [-point, -point])) < min)
        ind = 3;  
        min = sum(abs(x(i, :) - [-point, -point]));
    end
    
    switch ind
        case 0
            h(1) = plot(xn(i, 1), xn(i, 2), 'Color','green','Marker','x','LineStyle','none' );
            hold on
        case 1
            plot(xn(i, 1), xn(i, 2), 'bx')
            hold on
        case 2
            plot(xn(i, 1), xn(i, 2), 'rx')
            hold on
        case 3
            h(2) = plot(xn(i, 1), xn(i, 2), 'Color',[0.8500 0.3250 0.0980],'Marker','^','LineStyle', 'none');
            hold on
    end

end
cases = [0 3];
% 
% gscatter(xn(cases(i),1),xn(cases(i),1),'gx','yo');
axis([-2, 2, -2, 2])
xL = xlim;
yL = ylim;
line([0 0], yL, 'Color', 'black');
line(xL, [0 0], 'Color', 'black');
grid on;

hold off;
legend(h,'$$x_1$$','$$x_2$$','Interpreter','latex');
saveas(gcf,'../Thesis_Report/images/INNxn','epsc');

%% subplot 2
fig2 = figure

min = inf;
point = 1/sqrt(2);
ind = 0;
for i = 1 : size(x, 1)
    min = inf;
    if(sum(abs(x(i, :) - [point, point])) < min)
        ind = 0;
        min = sum(abs(x(i, :) - [point, point]));
    end
    if(sum(abs(x(i, :) - [point, -point])) < min)
        ind = 1;
        min = sum(abs(x(i, :) - [point, -point]));
    end
    if(sum(abs(x(i, :) - [-point, point])) < min)
        ind = 2;
        min = sum(abs(x(i, :) - [-point, point]));
    end
    if(sum(abs(x(i, :) - [-point, -point])) < min)
        ind = 3;  
        min = sum(abs(x(i, :) - [-point, -point]));
    end
    
    switch ind
        case 0
            h(1) = plot(y(i, 1), y(i, 2), 'gx');
            hold on
        case 1
            plot(y(i, 1), y(i, 2), 'bx')
            hold on
        case 2
            plot(y(i, 1), y(i, 2), 'rx')
            hold on
        case 3
            h(2) = plot(y(i, 1), y(i, 2), 'Color',[0.8500 0.3250 0.0980],'Marker','^','LineStyle','none');
            hold on
    end
end
% axis([-2, 2, -2, 2])
xL = xlim;
yL = ylim;
line([0 0], yL, 'Color', 'black');
line(xL, [0 0], 'Color', 'black');
grid on

ax = fig2.CurrentAxes;
title('XY Plot of Real parts of the Received signals $$y_1$$ and $$y_2$$','Interpreter','Latex');
xlabel('Real($$y_1$$)','Interpreter','Latex');
ylabel('Real($$y_2$$)','Interpreter','Latex');
legend(h,'$$y_1$$','$$y_2$$','Interpreter','latex');

saveas(gcf,'../Thesis_Report/images/INNyn','epsc');
%% sublot 3
fig3 = figure;

min = inf;
point = 1/sqrt(2);
ind = 0;
for i = 1 : size(x, 1)
    min = inf;
    if(sum(abs(x(i, :) - [point, point])) < min)
        ind = 0;
        min = sum(abs(x(i, :) - [point, point]));
    end
    if(sum(abs(x(i, :) - [point, -point])) < min)
        ind = 1;
        min = sum(abs(x(i, :) - [point, -point]));
    end
    if(sum(abs(x(i, :) - [-point, point])) < min)
        ind = 2;
        min = sum(abs(x(i, :) - [-point, point]));
    end
    if(sum(abs(x(i, :) - [-point, -point])) < min)
        ind = 3;  
        min = sum(abs(x(i, :) - [-point, -point]));
    end
    
    switch ind
        case 0
            h(1) = plot(output(i, 1), output(i, 2), 'gx');
            hold on
        case 1
            plot(output(i, 1), output(i, 2), 'bx')
            hold on
        case 2
            plot(output(i, 1), output(i, 2), 'rx')
            hold on
        case 3
            h(2) = plot(output(i, 1), output(i, 2),  'Color',[0.8500 0.3250 0.0980],'Marker','^','LineStyle','none');
            hold on
    end
end
axis([-500, 500, -500, 500])
xL = xlim;
yL = ylim;
line([0 0], yL, 'Color', 'black');
line(xL, [0 0], 'Color', 'black');
grid on

ax = fig3.CurrentAxes;
title('XY Plot of Real parts of the Estimated signals $$\hat{y_1}$$ and $$\hat{y_2}$$','Interpreter','Latex')
xlabel('Real($$\hat{y_1}$$)','Interpreter','Latex');
ylabel('Real($$\hat{y_2}$$)','Interpreter','Latex');
legend(h,'$$\hat{y_1}$$','$$\hat{y_2}$$','Interpreter','latex');

saveas(gcf,'../Thesis_Report/images/INNResult','epsc');
%% sublot 4
% figure
% min = inf;
% point = 1/sqrt(2);
% ind = 0;
% for i = 1 : size(x, 1)
%     min = inf;
%     if(sum(abs(x(i, :) - [point, point])) < min)
%         ind = 0;
%         min = sum(abs(x(i, :) - [point, point]));
%     end
%     if(sum(abs(x(i, :) - [point, -point])) < min)
%         ind = 1;
%         min = sum(abs(x(i, :) - [point, -point]));
%     end
%     if(sum(abs(x(i, :) - [-point, point])) < min)
%         ind = 2;
%         min = sum(abs(x(i, :) - [-point, point]));
%     end
%     if(sum(abs(x(i, :) - [-point, -point])) < min)
%         ind = 3;  
%         min = sum(abs(x(i, :) - [-point, -point]));
%     end
%     
%     switch ind
%         case 0
%             plot(linear(i, 1), linear(i, 2), 'gx')
%             hold on
%         case 1
%             plot(linear(i, 1), linear(i, 2), 'bx')
%             hold on
%         case 2
%             plot(linear(i, 1), linear(i, 2), 'rx')
%             hold on
%         case 3
%             plot(linear(i, 1), linear(i, 2), 'yx')
%             hold on
%     end
% end
% % axis([-2, 2, -2, 2])
% xL = xlim;
% yL = ylim;
% line([0 0], yL, 'Color', 'black');
% line(xL, [0 0], 'Color', 'black');
% grid on