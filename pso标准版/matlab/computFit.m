%º∆À„  ”¶∂»
function result = computFit(x)
[row col]=size(x);
sigma=50;
if min(x)<-100 || max(x)>100
    result=0;
else
    result = (1/(2*pi*sigma^2))*exp(-(x(1,1).^2+x(1,2).^2)/(2*sigma^2)); 
end
end

