
%% LTDV_Scatter: 2D Scatter plot for matlab 
%% Input args
% y -- y data to plot, necessary!!!
% x -- x data
% lwidth -- linewidth
% lcolor -- line color, single color
% Gradientcolor -- Gradual color change, yes(1) or no(0)
% c -- Color change basis
% fz -- fontsize
% sfilled -- Shape of the scattered dots
% ssize -- size of dots
% hold_sign -- new plot(0) or hold on(1)
% x_name -- xlabel
% y_name -- ylabel
% boxoff -- box off(1) or on(0)
% gridon -- grid on(1) or off(0)
% legendon -- legend on(1) or off(0)
%% Call Demo.
% LTDV_Scatter(1:1:10, 'sfilled', 'pentagram','boxoff', 1, 'hold_sign', 0, 'Gradientcolor', 1);
%% Hist. info.
% Created by ChaoLuo @ 2023/6/12
function LTDV_Scatter(y, varargin)
    %% input Parser with default values
    p = inputParser;
    addParameter(p, 'x', 1:1:length(y));
    addParameter(p, 'lwidth', 1.5);
    addParameter(p, 'lcolor', [hex2dec('fb'), hex2dec('5b'), hex2dec('a3')]./255); %单一配色
    addParameter(p, 'Gradientcolor', 0);        %选择渐变色
    c = linspace(1,10,length(y));               %以y强度作为颜色轴
    addParameter(p, 'fz', 16);
    addParameter(p, 'sfilled', 'pentagram');    %散点形状可选
    addParameter(p, 'ssize', 40);
    addParameter(p, 'hold_sign', 0);
    addParameter(p, 'x_name', 'Time');
    addParameter(p, 'y_name', 'Intensity (a.u.)');
    addParameter(p, 'boxoff', 0);
    addParameter(p, 'gridon', 0);
    addParameter(p, 'legendon', 0);
    parse(p,varargin{:});       % 对输入变量进行解析，如果检测到前面的变量被赋值，则更新变量取值
    x = p.Results.x;
    if(p.Results.hold_sign)
        hold on;
    else
        figure;
    end
    
    if (p.Results.Gradientcolor)
        scatter(x, y, p.Results.ssize, c, p.Results.sfilled, 'linewidth', p.Results.lwidth);
    else
        scatter(x, y, p.Results.ssize, p.Results.sfilled, 'linewidth', p.Results.lwidth, 'MarkerEdgecolor', p.Results.lcolor);
    end
    
    xlabel(p.Results.x_name); ylabel(p.Results.y_name);
    xlim([x(1) x(end)]);
    set(gca, 'FontSize', p.Results.fz);
    
    if(p.Results.boxoff)
        box off;
    end
    if(p.Results.gridon)
        grid on;
    end
    if(p.Results.legendon)
        legend on;
    end
    end