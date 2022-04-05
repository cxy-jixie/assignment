# 7.4 轨迹
## 7.4.1 关节空间运动
1. 
~~~ matlab
>> T2=transl(0.4,-0.2,0)*trotx(pi/2)

T2 =

    1.0000         0         0    0.4000
         0    0.9996   -0.0274   -0.2000
         0    0.0274    0.9996         0
         0         0         0    1.0000

>> q1=p560.ikine6s(T1)
>> mdl_puma560
>> q1=p560.ikine6s(T1)

q1 =

    3.2631    2.0791    0.5992   -3.0187    2.6819   -0.0114
>> q2=p560.ikine6s(T2)

q2 =

    2.3358    2.0791    0.5992   -3.1007    2.6582    0.8422
    q=mtraj(@lspb,q1,q1,t)
%等价于一个更简单的函数“jtraj(q1,q2,t); ”
%该函数的优势在于可以对多轴进行优化，而且可以使用额外的参数来设置初始与最终的速度；
%可通过输出参数获得随时间变化的关节速度与加速度向量
%在Serialink中该方法更为简明可简化为q=p560.jtraj(t1,t2,t);
>> q=p560.jtraj(T1,T2,t);
>> p560.plot(q)
%将正运动学作用于关节坐标轨迹，可知其在笛卡尔坐标系下是如何移动的
~~~
## 7.4.2 笛卡尔运动
1. 用工具箱函数ctraj可以在笛卡尔空间的直线运动
2. 
~~~ matlab
Ts=ctraj(T1,T2,length(t));
plot(t,transl(Ts));
plot(t,tr2rpy(Ts));
~~~
## 7.4.3 通过奇异位形的运动
1. 在出现奇异形时使用广义逆运动学方法ikine可以较容易的处理
2. 可操作性与广义逆运动学函数都是基于机械臂的雅可比矩阵；
## 7.4.4 位形转换
1. 正常使用换左右手
# 7.5高级问题
## 7.5.1 关节角偏移
1. 机械很难或基本不会出现0关节角，故会将0关节角位姿设成一些更为明显的位形，可以通过设置关节角偏移量来实现。
2. 具体实现为
~~~ matlab
L=Link([0 0 1 0]);
L.offset=pi/4;
%或者
p560.links(2).offset=pi/2;
~~~
## 7.5.2 确定D-H参数
1. 在基座上随便定义一个坐标系然后将基座到顶端的平移与旋转写到一个字符串中
~~~ matlab
dh=DHFactor(s)
%返回一个DHFactor对象
~~~
2. 其可以用于创建一个名为‘puma'的机器人，会创建一个工作空间变量，该变量为Seriallink对象；
## 7.5.3 改进D-H参数
1. 改进原因：可使参数符号在某些方面显得更加清晰与简洁，旋转的顺序不可交换
2. 工具箱可以处理两者，对于改进D-H参数法处理如下
~~~ matlab
L1=link([0 1 0 0 0],'modified')
~~~
3. 其余做法与之前完全相同
### 7.6 应用绘图
1. 
~~~ matlab
>> patch=[1 0 1;1 0 0;0 0 0;0 2 0;1 2 0;1 2 1;0 1 1;0 1 0;1 1 0;1 1 1]

patch =

     1     0     1
     1     0     0
     0     0     0
     0     2     0
     1     2     0
     1     2     1
     0     1     1
     0     1     0
     1     1     0
     1     1     1

>>  plot3(patch(:,1),patch(:,2),patch(:,3),'color','k','Linewidth',2);
patch=[1 0 1;1 0 0;0 0 0;0 2 0;1 2 0;1 2 1;0 1 1;0 1 0;1 1 0;1 1 1]

patch =

     1     0     1
     1     0     0
     0     0     0
     0     2     0
     1     2     0
     1     2     1
     0     1     1
     0     1     0
     1     1     0
     1     1     1

>>  plot3(patch(:,1),patch(:,2),patch(:,3),'color','k','Linewidth',2);
>> plot3(patch(:,1),patch(:,2),patch(:,3),'color','k','Linewidth',2);
>> numrows(p)*0.02 
>> p=mstraj(patch,[0.5 0.5 0.3],[],[2 2 2],0.02,0.2);
>>  numrows(p)*0.02

ans =

   31.2600

>> Tp=transl(0.1*p);
>> Tp=homtrans(transl(0.4,0,0),Tp);
>> p560.tool=trotx(pi);
>> mdl_puma560
>>  q=p560.ikine6s(Tp);
>> p560.plot(q)
~~~
# 7.7 一个简单的步行机器人
## 7.7.1 运动学
1. 腿是一个机械臂，对于它们三关节串联机械臂已经足够用
2. 
~~~ matlab
 s='Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)';
>> dh=DHFactor(s)
INIT: Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)
PARSED: Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)
Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)
initial merge + swap
Rz(q1).Rx(q2).Ty(L1).Rx(q3).Tz(L2)
ReplaceToZ: Rx(q2) := Ry(+90)Rz(q2)Ry(-90)
ReplaceToZ: Rx(q3) := Ry(+90)Rz(q3)Ry(-90)
joint vars to Z
Rz(q1).Ry(+90).Rz(q2).Ry(-90).Ty(L1).Ry(+90).Rz(q3).Ry(-90).Tz(L2)
0---------------------------------------
Swap: Ry(-90) <-> Ty(L1)
Eliminate: Ry(-90) Ry(+90)
ReplaceY: Ry(-90)Tz(L2) := Tx(-L2)Ry(-90)
Rz(q1).Ry(+90).Rz(q2).Ty(L1).Rz(q3).Tx(-L2).Ry(-90)
1---------------------------------------
Rz(q1).Ry(+90).Rz(q2).Ty(L1).Rz(q3).Tx(-L2).Ry(-90)
1---------------------------------------
** deal with Ry/Ty
ReplaceToZ2: Ry(+90) := Rz(+90)Rx(+90)Rz(-90)
ReplaceToZ2: Ty(L1) := Rz(+90)Tx(L1)Rz(-90)
ReplaceToZ2: Ry(-90) := Rz(+90)Rx(-90)Rz(-90)
Merge: Rz(q1) Rz(+90) := Rz(q1+90)
Merge: Rz(-90) Rz(q2) := Rz(q2-90)
Merge: Rz(-90) Rz(q3) := Rz(q3-90)
Merge: Rz(q2-90) Rz(+90) := Rz(q2)
ReplaceY: Tx(-L2)Rz(+90) := Rz(+90)Ty(-L2)
Merge: Rz(q3-90) Rz(+90) := Rz(q3)
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(-L2).Rx(-90).Rz(-90)
1---------------------------------------
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(-L2).Rx(-90).Rz(-90)
1---------------------------------------
** deal with Ry/Ty
ReplaceToZ2: Ty(-L2) := Rz(+90)Tx(-L2)Rz(-90)
Merge: Rz(q3) Rz(+90) := Rz(q3+90)
ReplaceY: Tx(-L2)Rz(-90) := Rz(-90)Ty(L2)
Merge: Rz(q3+90) Rz(-90) := Rz(q3)
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(L2).Rx(-90).Rz(-90)
1---------------------------------------
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(L2).Rx(-90).Rz(-90)
1---------------------------------------
** deal with Ry/Ty
ReplaceToZ2: Ty(L2) := Rz(+90)Tx(L2)Rz(-90)
Merge: Rz(q3) Rz(+90) := Rz(q3+90)
ReplaceY: Tx(L2)Rz(-90) := Rz(-90)Ty(-L2)
Merge: Rz(q3+90) Rz(-90) := Rz(q3)
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(-L2).Rx(-90).Rz(-90)
1---------------------------------------
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(-L2).Rx(-90).Rz(-90)
1---------------------------------------
** deal with Ry/Ty
ReplaceToZ2: Ty(-L2) := Rz(+90)Tx(-L2)Rz(-90)
Merge: Rz(q3) Rz(+90) := Rz(q3+90)
ReplaceY: Tx(-L2)Rz(-90) := Rz(-90)Ty(L2)
Merge: Rz(q3+90) Rz(-90) := Rz(q3)
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(L2).Rx(-90).Rz(-90)
1---------------------------------------
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(L2).Rx(-90).Rz(-90)
1---------------------------------------
** deal with Ry/Ty
ReplaceToZ2: Ty(L2) := Rz(+90)Tx(L2)Rz(-90)
Merge: Rz(q3) Rz(+90) := Rz(q3+90)
ReplaceY: Tx(L2)Rz(-90) := Rz(-90)Ty(-L2)
Merge: Rz(q3+90) Rz(-90) := Rz(q3)
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(-L2).Rx(-90).Rz(-90)
1---------------------------------------
Rz(q1+90).Rx(+90).Rz(q2).Tx(L1).Rz(q3).Ty(-L2).Rx(-90).Rz(-90)
  adding: DH(null, 0, 0, 0) += Rz(q1+90)
  adding: DH(q1+90, 0, 0, 0) += Rx(+90)
  adding: DH(null, 0, 0, 0) += Rz(q2)
  adding: DH(q2, 0, 0, 0) += Tx(L1)
  adding: DH(null, 0, 0, 0) += Rz(q3)
DH(q1+90, 0, 0, 90).DH(q2, 0, L1, 0).DH(q3, 0, 0, 0).Ty(-L2).Rx(-90).Rz(-90)
In DHFactor, parseString is done

dh =

DH(q1+90, 0, 0, 90).DH(q2, 0, L1, 0).DH(q3, 0, 0, 0).Ty(-L2).Rx(-90).Rz(-90)

>> dh.tool

ans =

transl(0, -L2,0)*trotx(-pi/2)*trotz(-pi/2)

>> dh.command('leg')

ans =

SerialLink([0, 0, 0, pi/2, 0; 0, 0, L1, 0, 0; 0, 0, 0, 0, 0; ], 'name', 'leg', 'base', eye(4,4), 'tool', transl(0, -L2,0)*trotx(-pi/2)*trotz(-pi/2), 'offset', [pi/2 0 0 ])

>> L1=0.1;L2=0.1;
>> leg=eval(dh.command('leg'))
 
leg = 
 
leg:: 3 axis, RRR, stdDH, slowRNE                                
+---+-----------+-----------+-----------+-----------+-----------+
| j |     theta |         d |         a |     alpha |    offset |
+---+-----------+-----------+-----------+-----------+-----------+
|  1|         q1|          0|          0|     1.5708|     1.5708|
|  2|         q2|          0|        0.1|          0|          0|
|  3|         q3|          0|          0|          0|          0|
+---+-----------+-----------+-----------+-----------+-----------+
tool:    t = (0, -0.1, 0), RPY/xyz = (-1.57, 0, -1.57) deg       
 
>> transl(leg.fkine([0,0,0]))'

ans =

    0.0000
    0.1000
   -0.1000

>> leg.plot([0,0,0],'nobase','noshadow')
>> set(gca,'zdir','reverse');view(137,48);
>> transl(leg.fkine([0.2,0,0]))'

ans =

   -0.0199
    0.0980
   -0.1000

>> transl(leg.fkine([0,0,0.2]))'

ans =

    0.0000
    0.1199
   -0.0980
~~~
## 7.7.2单腿运动
1. 
~~~ matlab
>> xf=50;xb=-xf;y=50;zu=20;zd=50;
>> path=[xf y zd;xb y zd;xb y zu;xf y zu;xf y zd]*le-3 ；
>> p=mstraj(path,[],[0,3,0.25,0.5,0.25]',path(1,:),0.01,0);
~~~
## 7.7.3 四腿运动
1. 
~~~ matlab
w=0.1;L=0.2;
legs(1)=SerialLink(leg,'name','leg1');
legs(2)=SerialLink(leg,'name','leg2','base',transl(-L,0,0));
legs(3)=SerialLink(leg,'name','leg3','base',transl(-L,-w,0)*trotz(pi));
legs(4)=SerialLink(leg,'name','leg4','base',transl(0,-w,0)*trotz(pi));
k=1;
while 1
    q=qleg(p,:);
    legs(1).plot(gait(qcycle,k,0,0));
    legs(2).plot(gait(qcycle,k,100,0));
    legs(3).plot(gait(qcycle,k,200,1));
    legs(4).plot(gait(qcycle,k,300,1));
    drawnow
    k=k+1;
end
~~~
2. gait通过模运算；
