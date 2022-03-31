%(a)
mian=[1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
ding=[-2 -2 -1;-2 2 -1;2 2 -1;2 -2 -1;-2 -2 1;-2 2 1;2 2 1;2 -2 1];
patch('Faces',mian,'Vertices',ding,'FaceColor','y');
view(30,15) 
%(b)
clear 
clc
ding=[-2 -2 -1;-2 2 -1;2 2 -1;2 -2 -1;-2 -2 1;-2 2 1;2 2 1;2 -2 1];
mian=[1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
patch('Faces',mian,'Vertices',ding,'FaceColor','y');
view(30,15);
%设旋转为 (10,3,3)
T=r2t(rpy2r(10,3,10));
a=ding';
b=zeros(4,8);
c=zeros(8,3);
d=zeros(3,8);
dinga=zeros(8,3);
n=1;
while n<=8
    b(:,n)=T*[a(:,n);1];
    d(:,n)=h2e((b(:,n)));
    c(n,:)=d(:,n)';
    dinga(n,:)=c(n,:);
    n=n+1;
end
patch('Faces',mian,'Vertices',dinga,'Facecolor','r');
view(30,15);
%若是平移则将T改为transl(a1,a2,a3);
