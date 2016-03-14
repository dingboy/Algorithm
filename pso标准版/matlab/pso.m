clear all;close all;clc;
[x, y]=meshgrid(-100:100,-100:100);
sigma=50;
z = (1/(2*pi*sigma^2))*exp(-(x.^2+y.^2)/(2*sigma^2)); %目标函数
mesh(z);
hold on;

k=10;%k代表迭代次数
n=10;%n代表粒子群粒子个数
q=2;%q代表粒子的维度
%wMax;%权重最大值
%wMin;%权重最小值
w=1;%w代表惯性权值

x=zeros(n,2*q);%x代表粒子的位置(包括当前位置与最佳位置)
v=zeros(n,q);%v代表粒子的速度
fit=zeros(1,n);%fit代表每个粒子的最佳适应度

%初始化粒子的位置以及速度
for i=1:n
    for j=1:q
       x(i,j)=-100+200*rand();%位置
       v(i,j)=-1+2*rand();%速度
    end
end

%初始化粒子自己的最佳位置
for i=1:n
    x(i,q+1:2*q)=x(i,1:q);    
end

%迭代求解
for i=1:k
    [bestfit, s]=max(fit);%求最佳适应度bestfit以及对应的粒子序号
    plot3(x(s,3)+100,x(s,4)+100,bestfit,'g*');%画出该点的位置
    %w=wMax-(wMax-wMin)*i/t;%为了提高效果，迭代的同时更新权重w
    
    %对粒子的位置以及速度进行更新
    for t=1:n
    [x, v, fit] = Update_VX(x,v,fit,t,w);
    end
end
bestfit



