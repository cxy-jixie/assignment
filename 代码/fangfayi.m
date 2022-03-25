clear;
format
A=[ 0.3*10^-15 59.14 3 1;
    5.291 -6.130 -1 2;
    11.2 9 5 2;
    1 2 1 1];
b=[59.17;46.78;1;2];
L=eye(4,4);
U=zeros(4,4);
n=4;
%求LU分解
for j=1:4
    U(1,j)=A(1,j);
end
for i=2:4
    L(i,1)=A(i,1)/U(1,1);
end
for i=2:4
    U(2,i)=A(2,i)-(L(2,1)*U(1,i));
end
for i=3:4
    L(i,2)=(A(i,2)-(L(i,1)*U(1,2)))/U(2,2);
end
for i=3:4
    U(3,i)=A(3,i)-(L(3,1)*U(1,i)+L(3,2)*U(2,i));
end
L(4,3)=(A(4,3)-(L(4,1)*U(1,3)+L(4,2)*U(2,3)))/U(3,3);
U(4,4)=A(4,4)-(L(4,1)*U(1,4)+L(4,2)*U(2,4)+L(4,3)*U(3,4));
[p1,q1]=size(A);
max=size(A);
B=[A,b];
[p,q]=size(B);
x=zeros(q1,1);
%进行线性方程求解；
for i=1:q1-1
    for t=i+1:max
         xi=B(t,i)/B(i,i);
        for j=i:q
            B(t,j)=B(t,j)-xi*B(i,j);
        end
     end
end
A(1:p1,1:q1)=B(1:p,1:q-1);
b(1:p1,1)=B(1:p,q);
for i=q1-1:-1:1
       sum=0;
   for j=q1:-1:i+1
        sum=sum+x(j)*A(i,j);
   end
  x(i)=(b(i)-sum)/A(i,i);
end
disp(x);
disp(L);
disp(U);
