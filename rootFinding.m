digitsOld = digits(10);
syms x;
f(x)= x^3+2*x^2+10*x-20;
F(x)= diff(f(x),x);
%f(x)= x^2-2;
x0=1;
x1=2;
c0=0;

for i=1:20
    c= vpa(((x0*f(x1)- x1*f(x0))/(f(x1)-f(x0))),9);
    if f(c)*f(x0) > 0 
        x0=c;
    elseif f(c)*f(x1) > 0 
        x1=c;
    end
    fprintf('The %dth root using the Secant Method is %.8f\n',i,c);
    if(abs(c0-c)<0.000000001)
        is=i;
        fprintf('\n\n');
        break
    end
    c0=c;
end
in=0;
x0=1; 
e=1;
while e >0.000000001
    
    x1= vpa(x0-(f(x0)/F(x0)),9);
    e= abs(x0-x1);
    x0=x1;
    in=in+1;
    fprintf('The %dth root using the Newton''s Method is %.8f\n',in,x1);
end

 fprintf('\n\nFor the Secant Method, we needed %d iterations to get to 8 consecutive decimal places.\nHowever, for Newton''s Method, we only needed %d iterations\n',is,in);
%checkc
%ff = @(x)(x.^3)+(2*x.^2)+(10*x)-(20);
%x = vpa(fzero(ff,1),9)
