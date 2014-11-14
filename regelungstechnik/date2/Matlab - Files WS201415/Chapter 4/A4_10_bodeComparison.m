function [] = A4_10_bodeComparison(frequency, mag_dB, phase, delay)
% bodeComparison(frequency, mag_dB, phase)
%
% This function compares the Bode plot of the Motor model with experimental
% results.
%
% INPUT
%  frequency = vector of frequency, the experiment has been run for
%  mag_dB    = experimantally determined vector of magnitudes (in dB)
%              (cooresponding to the frequencies)
%  phase     = experimantally determined vector of phases (cooresponding to
%              the frequencies)
%  delay     = time delay of the motor model

%% 
if nargin < 4
    delay = 0;
end

%%
close all
%% get the motor model
% motor model
fc = 0.7;        % ADJUST THE CORNER FREQUENCY HERE
GM = tf(21.25, [1/fc 1]);  
% delayed motor model
GM_delay = GM*tf(1, 1, 'IOdelay', delay);
% values for bode plot
freq_mot = logspace(-1.5, 1.5);
[mag_mot, phase_mot] = bode(GM, freq_mot);
[~, phase_mot_delay] = bode(GM_delay, freq_mot);
mag_dB_mot = 20*log10(squeeze(mag_mot));

%% Magnitude plot
figure
subplot(2,1,1)
title('Bode plot comparison')
semilogx(freq_mot, mag_dB_mot, 'b')
hold on
semilogx(frequency, mag_dB, 'r')
legend('simulation', 'experimental')
xlim([freq_mot(1) freq_mot(end)])
grid on
xlabel('rad/s')
ylabel('amplitude [dB]')

%% Phase plot
subplot(2,1,2)
semilogx(freq_mot, squeeze(phase_mot), 'b')
hold on
semilogx(freq_mot, squeeze(phase_mot_delay), 'b--')
semilogx(frequency, phase, 'r')

xlim([freq_mot(1) freq_mot(end)])
grid on 
xlabel('rad/s')
ylabel('phase [°]')
legend('simulation',  ['simulation with ', num2str(delay),'s delay'], 'experimental')
set(gcf, 'Position', [200, 50 1000 600])