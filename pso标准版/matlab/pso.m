clear all;close all;clc;
[x, y]=meshgrid(-100:100,-100:100);
sigma=50;
z = (1/(2*pi*sigma^2))*exp(-(x.^2+y.^2)/(2*sigma^2)); %Ŀ�꺯��
mesh(z);
hold on;

k=10;%k�����������
n=10;%n��������Ⱥ���Ӹ���
q=2;%q�������ӵ�ά��
%wMax;%Ȩ�����ֵ
%wMin;%Ȩ����Сֵ
w=1;%w�������Ȩֵ

x=zeros(n,2*q);%x�������ӵ�λ��(������ǰλ�������λ��)
v=zeros(n,q);%v�������ӵ��ٶ�
fit=zeros(1,n);%fit����ÿ�����ӵ������Ӧ��

%��ʼ�����ӵ�λ���Լ��ٶ�
for i=1:n
    for j=1:q
       x(i,j)=-100+200*rand();%λ��
       v(i,j)=-1+2*rand();%�ٶ�
    end
end

%��ʼ�������Լ������λ��
for i=1:n
    x(i,q+1:2*q)=x(i,1:q);    
end

%�������
for i=1:k
    [bestfit, s]=max(fit);%�������Ӧ��bestfit�Լ���Ӧ���������
    plot3(x(s,3)+100,x(s,4)+100,bestfit,'g*');%�����õ��λ��
    %w=wMax-(wMax-wMin)*i/t;%Ϊ�����Ч����������ͬʱ����Ȩ��w
    
    %�����ӵ�λ���Լ��ٶȽ��и���
    for t=1:n
    [x, v, fit] = Update_VX(x,v,fit,t,w);
    end
end
bestfit



