
clear

clc

Fs = 10000;
N = 4096;
N1 = 0 :1/Fs:(N-1)/Fs;

yn = sin(1000*2*pi*N1)+sin(3000*2*pi*N1)+sin(4000*2*pi*N1);

yn = round((yn+2.4)*53); 

 
plot(N1,yn);

fid = fopen('./Sin_Wave_Rom.txt','wt');
 

for i = 1 : N


    fprintf(fid,'%x\n',yn(i));

end
fclose(fid);

Fs = 10000; %采样频率决定了两个正弦波点之间的间隔
N = 4096; %采样点数 
N1 = 0 : 1/Fs :(N-1)/Fs;
in =sin(1000*2*pi*N1) + sin(3000*2*pi*N1) + sin(4000*2*pi*N1); 
coeff =[7,5,51,135,179,135,51,5,7]; %滤波器系数
out =conv(in,coeff);%卷积滤波
subplot(2,1,1);
plot(in);
xlabel('滤波前');
axis([0  200 -3 3]);
subplot(2,1,2);
plot(out);
xlabel('滤波后');
% axis([100 200 -2 2]);