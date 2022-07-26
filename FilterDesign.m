clc;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%  BLACKMAN ALTO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
datos = fir1(88, 0.4375, 'high', blackman(88 + 1));

figure(1);
freqz(datos, 1, 512);

[Hertz, Fase] = freqz(datos, 1, 512);
conversion = 180*unwrap( angle(Hertz) )/pi;

figure(2);
subplot(2,1,1);
plot( (Fase*8000/2)/(pi) , 20*log10( abs(Hertz) ) );
grid;
xlabel("Frequency");
ylabel("Magnitude Response (dB)")

subplot(2,1,2);
plot( (Fase*8000/2)/(pi), conversion);
grid;
xlabel("Frequency");
ylabel("Phase (degrees)");

for i = 1:89
    n = i - ( ( 89 + 1)/2 );
    
    B(i, 1) = datos(i);
    if(n == 0)
        coeficiente(i, 1) = (pi - 0.4375*pi)/(pi);
    else
        coeficiente(i, 1) = - ( ( sin( 0.4375*pi*n ) )/( n*pi ) );
    end
end

tf(datos, 1, 8000,'Variable' ,'z^-1')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%  HAMMING RECHAZO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% datos = fir1(66, [0.35 0.55], 'stop', hamming(66 + 1));

% figure(1);
% freqz(datos, 1, 512);
% 
% [Hertz, Fase] = freqz(datos, 1, 512);
% conversion = 180*unwrap( angle(Hertz) )/pi;
% 
% figure(2);
% subplot(2,1,1);
% plot( (Fase*8000/2)/(pi) , 20*log10( abs(Hertz) ) );
% grid;
% xlabel("Frequency");
% ylabel("Magnitude Response (dB)")
% 
% subplot(2,1,2);
% plot( (Fase*8000/2)/(pi), conversion);
% grid;
% xlabel("Frequency");
% ylabel("Phase (degrees)");

% H = tf(datos, 1, 8000, 'Variable', 'z^-1')
% for i = 1:67
%     n = i - ( ( 67 + 1)/2 );
%     
%     B(i, 1) = datos(i);
%     if(n == 0)
%         coeficiente(i, 1) = (pi - (0.55*pi) + (0.35*pi) )/(pi);
%     else
%         coeficiente(i, 1) = ( ( sin(0.35*pi*n) )/(n*pi) ) - ( ( sin(0.55*pi*n) )/(n*pi) );
%     end
%     
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%