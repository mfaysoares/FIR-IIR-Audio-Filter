clear all
close all
clc

%Sinal Original com Ruido
filename = 'noised_audio.wav';
[y,fs] = audioread(filename);
ts = 1/fs;
n = length(y);
t = (0:(n-1))*ts;
figure(1);
subplot(2,2,[1 2]);
plot(t,y);
title('Sinal de Áudio');
xlabel('Tempo (s)');
grid on;
axis([0 inf -1.5 1.5])

%Resposta em Frequência do Sinal
nfft = length(y);
nfft2=2.^nextpow2(nfft);
fy = fft(y,nfft2);
fy = fy(1:nfft2/2);

xfft = fs.*(0:nfft2/2-1)/nfft2;
figure(1);
subplot(2,2,[3 4]);
plot(xfft,abs(fy/max(fy)));
title('Resposta em Frequência do Sinal de Áudio');
xlabel('Frequência (Hz)');
grid on;

%Filtro Digital IIR Passa Baixa
cut_off=1500/fs; %Frequencia de Corte


wnb=[1900 2100]/(fs);

[b,a] = butter(6,cut_off);
fvtool(b,a);
f=filter(b,a,y);
f = 4*f;
figure()
plot(f)

filefiltered = 'audio_filtrado_IIR.wav';
audiowrite(filefiltered,f,fs);
