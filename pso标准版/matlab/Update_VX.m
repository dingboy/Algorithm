function [x, v, fit] = Update_VX(x,v,fit,t,w)

%x�������ӵ�λ��(������ǰλ�������λ��)
%v�������ӵ��ٶ�
%fit����ÿ�����ӵ������Ӧ��
%t������и��µ����ӵ����
%w�������Ȩֵ

c1=1;%c1����������֪
c2=1;%c2���������֪
r=1;%r����Լ������
localbest=fit(1,t);%��ǰ����(���Ϊt)�������Ӧ��localbest
[globalbest,s]=max(fit);%���������ӵ������Ӧ�ȵ�ֵglobalbest�Լ����s

[row, col]=size(x);%��λ�þ�����к���

currfit=computFit(x(t,1:col/2));%�����µ���Ӧ��

%�����ٶ�
for i=1:col/2
     v(t,i)=w*v(t,i)+c1*rand()*(x(t,i+col/2)-x(t,i))+c2*rand()*(x(s,i+col/2)-x(t,i));
end

%����λ��
for i=1:col/2
   x(t,i)=x(t,i)+r*v(t,i); 
end

%���������ڵ���Ӧ�ȴ�����ʷ��õ���Ӧ�ȣ�����ʷ�����Ӧ�ȸ�Ϊ���ڵ���Ӧ��
%ͬʱ���¸����ӵ����λ��
if currfit>localbest
    fit(1,t)=currfit;
    x(t,col/2+1:col)=x(t,1:col/2);
end
end

