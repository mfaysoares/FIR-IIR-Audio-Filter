clear all
close all
clc

[x,fs] = audioread('audio_filtrado_FIR_2.wav');
ts = 1/fs;
%Filtro Digital FIR Passa Baixa
cut_off=2000/fs; %Frequencia de Corte
order=96; %Ordem do Filtro
h = fir1(order,cut_off,'low'); %Janela da Hamming
con = conv(x,h); %Convolução do Sinal com a Janela
con = 1.5*con; %Ganho (1° teste sinal ficou muito baixo)

figure(3);
plot(h);
title('Janela de Hamming');
grid on;


filefiltered = 'audio_filtrado_FIR_2_0.wav';
audiowrite(filefiltered,con,fs);
n2 = length(con);
t2 = (0:(n2-1))*ts;
figure(4);
plot(t2,con);
title('Sinal de Áudio Filtrado');
xlabel('Tempo (s)');
grid on;

figure();
spectrogram(con,'yaxis')
