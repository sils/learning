function [] = A4_10_plotSinusComparison(data,input, frequency)
% plotSinusComparison(data,input, frequency)
%
% This function visualizes the magnitude and phase change of a sinusoidal 
% signal in two figures: the first for the magnitude and the second for the
% phase. The green dotted lines in each plot help to read out the values of
% interest.
%
% INPUT
%  
%  data = output signal (as structure: data.signal.values = output vector,
%                                      data.time = time vector)
%  input = input signal (as structure: data.signal.values = output vector,
%                                      data.time = time vector)
%  frequency = frequency of the sinusoidal signal



close all

diff1 = diff(data.signals.values(:,1));
if any(abs(diff1(:))>10)
    in_delete = find(abs(diff1(:))>10);
    input.signals.values(in_delete,:)=[];
    data.signals.values(in_delete,:)=[];
    input.time(in_delete,:)=[];
    data.time(in_delete,:)=[];
end

start_val = find(input.time/(2*pi)>1,1,'first');
signIN= sign(diff(input.signals.values(:,1)));
if signIN(start_val)>0
    ind_max_first = find(diff(input.signals.values(start_val:end,1))<0,1, 'first')+start_val-1;
else
    ind_max_first = find(diff(signIN(start_val:end,1))==-2,1, 'first')+start_val-1;
end
max_in = max(input.signals.values(ind_max_first:end,1));
min_in = min(input.signals.values(ind_max_first:end,1));
mean_in = min_in/2+max_in/2;

max_data = max(data.signals.values(ind_max_first:end,1));
min_data = min(data.signals.values(ind_max_first:end,1));
mean_data = min_data/2+max_data/2;

if frequency>=1
    mean_data = mean(data.signals.values(ind_max_first:end,1));
    a=sign(diff(data.signals.values(ind_max_first:end,1)));
    cross_pos = find(diff(a)==-2)+ind_max_first-1;
    cross_neg = find(diff(a)==2)+ind_max_first-1;
    data_cross_pos = data.signals.values(cross_pos+1,1);
    data_cross_neg = data.signals.values(cross_neg+1,1);
    max_data = mean(data_cross_pos(data_cross_pos>mean_data));
    min_data = mean(data_cross_neg(data_cross_neg<mean_data));
end
ampl = (max_data/2-min_data/2)/(max_in-mean_in);
figure
set(gcf, 'Position', [200, 50 1000 600])
subplot(1,2,1)
hold on
box on
plot((data.time(ind_max_first:end)-data.time(ind_max_first))/(2*pi), data.signals.values(ind_max_first:end,1)-mean_data, 'b');
plot((input.time(ind_max_first:end)-input.time(ind_max_first))/(2*pi), (input.signals.values(ind_max_first:end,1)-mean_in), 'r');

plot([0 (input.time(end)-input.time(ind_max_first))/(2*pi)], (max_in-min_in)/2*[ampl ampl], 'g--', 'Linewidth', 2)
plot([0 (input.time(end)-input.time(ind_max_first))/(2*pi)], (max_in-min_in)/2*[1 1], 'g--', 'Linewidth', 2)
legend('output', 'input')
xlim([0 (input.time(end)-input.time(ind_max_first))/(2*pi)])
title('Magnitude detection')
xlabel('rad/s')

subplot(1,2,2)
hold on
box on
title('Phase detection')
if data.time(end)/(2*pi)>1.75/frequency
    x_data_t = (data.time(ind_max_first:end)-data.time(ind_max_first))/(2*pi);
    x_data = x_data_t(find(x_data_t>=0.75/frequency,1, 'first'):find(x_data_t>=1.75/frequency, 1, 'first'));
    x_data = (x_data-x_data(1))*frequency*360;
    y_data_in = ampl*(input.signals.values(ind_max_first:end,1)-mean_in);
    y_data_in = y_data_in(find(x_data_t>=0.75/frequency,1, 'first'):find(x_data_t>=1.75/frequency,1, 'first'));
    y_data_data = data.signals.values(ind_max_first:end,1)-mean_data;
    y_data_data = y_data_data(find(x_data_t>=0.75/frequency,1, 'first'):find(x_data_t>=1.75/frequency,1, 'first'));
    plot(x_data, y_data_data, 'b');
    plot(x_data, y_data_in, 'r');
    xlim([0 360])
    grid on
    legend('output', 'input')
    xlabel('degree')
    if y_data_data(1)<0
        phase_angle=-x_data(find(y_data_data>0,1,'first'));
    else
        phase_angle=-x_data(find(y_data_data<0,1,'last'));
    end

    plot([0, -phase_angle],[0,0],'g--', 'Linewidth', 2)
    
else
    if data.time(end)/(2*pi)>1.25/frequency
        x_data_t = (data.time(ind_max_first:end)-data.time(ind_max_first))/(2*pi);
        x_data = x_data_t(find(x_data_t>=0.25/frequency,1, 'first'):find(x_data_t>=1.25/frequency, 1, 'first'));
        x_data = (x_data-x_data(1))*frequency*360;
        y_data_in = ampl*(input.signals.values(ind_max_first:end,1)-mean_in);
        y_data_in = y_data_in(find(x_data_t>=0.25/frequency,1, 'first'):find(x_data_t>=1.25/frequency,1, 'first'));
        y_data_data = data.signals.values(ind_max_first:end,1)-mean_data;
        y_data_data = y_data_data(find(x_data_t>=0.25/frequency,1, 'first'):find(x_data_t>=1.25/frequency,1, 'first'));
        plot(x_data, y_data_data, 'b');
        plot(x_data, y_data_in, 'r');
        xlim([0 360])
        grid on
        legend('output', 'input')
        xlabel('degree')
        if y_data_data(1)>0
            phase_angle=-x_data(find(y_data_data<0,1,'first'));
        else
            phase_angle=-x_data(find(y_data_data>0,1,'last'));
        end
        plot([0, -phase_angle],[0,0],'g--', 'Linewidth', 2)
    else
        error('you have to measure longer')
    end
end

    
