%绕x轴,绕y轴,绕z轴；
dingx=zeros(8,3);
mian=[1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
ding=[-2 -2 -1;-2 2 -1;2 2 -1;2 -2 -1;-2 -2 1;-2 2 1;2 2 1;2 -2 1];
for zhuan=pi/100:100*pi
   for n=1:8
        dingx(n,:)=ding(n,:)*rotx(zhuan);
        hold on
    end
    patch('Faces',mian,'Vertices',dingx,'FaceColor','y');
    view(10,10);
    getframe;
    cla;
end
dingy=zeros(8,3);
n=1;
for zhuan=pi/100:100*pi
     for n=1:8
        dingy(n,:)=ding(n,:)*roty(zhuan);
        hold on
    end
    patch('Faces',mian,'Vertices',dingy,'FaceColor','r');
    view(10,10);
    getframe;
    cla;
end
dingz=zeros(8,3);
for zhuan=pi/100:100*pi
    for n=1:8
        dingz(n,:)=ding(n,:)*rotz(zhuan);
        hold on
    end
    patch('Faces',mian,'Vertices',dingz,'FaceColor','b');
    view(10,10);
    getframe;
    cla;
end
clc;
clear;
