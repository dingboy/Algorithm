function [x, v, fit] = Update_VX(x,v,fit,t,w)

%x代表粒子的位置(包括当前位置与最佳位置)
%v代表粒子的速度
%fit代表每个粒子的最佳适应度
%t代表进行更新的粒子的序号
%w代表惯性权值

c1=1;%c1代表自我认知
c2=1;%c2代表社会认知
r=1;%r代表约束因子
localbest=fit(1,t);%求当前粒子(序号为t)的最佳适应度localbest
[globalbest,s]=max(fit);%求所有粒子的最佳适应度的值globalbest以及序号s

[row, col]=size(x);%求位置矩阵的行和列

currfit=computFit(x(t,1:col/2));%计算新的适应度

%更新速度
for i=1:col/2
     v(t,i)=w*v(t,i)+c1*rand()*(x(t,i+col/2)-x(t,i))+c2*rand()*(x(s,i+col/2)-x(t,i));
end

%更新位置
for i=1:col/2
   x(t,i)=x(t,i)+r*v(t,i); 
end

%若粒子现在的适应度大于历史最好的适应度，则将历史最好适应度改为现在的适应度
%同时更新该粒子的最佳位置
if currfit>localbest
    fit(1,t)=currfit;
    x(t,col/2+1:col)=x(t,1:col/2);
end
end

