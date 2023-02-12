function [y]=fft8(x)
% initialization
x1 = zeros(8,1);
x2 = zeros(8,1);
x3 = zeros(8,1);
y  = zeros(8,1);
%stage1
for mm = 0:1:3
    twiddle=exp(-2*pi*1i*mm*1/8);
    x1(mm+1) = x(mm+1)  + x(mm+5);
    x1(mm+5) = (x(mm+1) - x(mm+5))*twiddle;
end
%stage2
for mm = 0:1
   	twiddle=exp(-2*pi*1i*mm*1/4);
   	x2(mm+1)  = x1(mm+1)  + x1(mm+3);
   	x2(mm+3)  = (x1(mm+1) - x1(mm+3))*twiddle;
   	x2(mm+5)  = (x1(mm+5) + x1(mm+7));
   	x2(mm+7)  = (x1(mm+5) - x1(mm+7))*twiddle;
end
%stage3
    twiddle=exp(-2*pi*1i*0*1/2);
    x3(1)=x2(1)+x2(2);
    x3(2)=x2(1)-x2(2)*twiddle;
     x3(3)=x2(3)+x2(4);
      x3(4)=x2(3)-x2(4)*twiddle;
       x3(5)=x2(5)+x2(6);
        x3(6)=x2(5)-x2(6)*twiddle;
         x3(7)=x2(7)+x2(8);
          x3(8)=x2(7)-x2(8)*twiddle;
           %x3()=x2()+x2();

 y(1)=x3(1); 
  y(2)=x3(5);    
   y(3)=x3(3);    
    y(4)=x3(7);    
     y(5)=x3(2);    
      y(6)=x3(6);    
       y(7)=x3(4);    
        y(8)=x3(8); 
end
