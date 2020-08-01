
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

Fs = 10000; %����Ƶ�ʾ������������Ҳ���֮��ļ��
N = 4096; %�������� 
N1 = 0 : 1/Fs :(N-1)/Fs;
in =sin(1000*2*pi*N1) + sin(3000*2*pi*N1) + sin(4000*2*pi*N1); 
coeff =[7,5,51,135,179,135,51,5,7]; %�˲���ϵ��
out =conv(in,coeff);%����˲�
subplot(2,1,1);
plot(in);
xlabel('�˲�ǰ');
axis([0  200 -3 3]);
subplot(2,1,2);
plot(out);
xlabel('�˲���');
% axis([100 200 -2 2]);