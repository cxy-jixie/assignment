# assignment

# mark down 学习 3.15笔记

## 一，基本语法

### 1.多级标题

> 方法

>

> 1. “Set-ext”形式 即底线的使用：（=）表示最高阶标题，（-）表示第二阶标题，任意数量都可

> 2. “Atx"形式的使用，即添加”#“通过数量的不同确定标题的等级，可实现1-6.

### 2.区块引用

>1. 在第一行或每一行加上”>"。

>2. 当然也可以嵌套使用。

>3. 区块里可以使用其他的markdown语法。

### 3.列表

>1. 无序列表：“*  +  -” 三者等价

>2. 有序列表：数字加上一个英文句点

>3. 为了公整，可以用固定的缩进整理好

>4. 列表项目可以包含多个段落，每个项目下的段落都必须缩进 4 个空格或是 1 个制表符

>5. 如果要在列表项目内放进引用，那 > 就需要缩进

>6. 如果要放代码区块的话，该区块就需要缩进两次，也就是 8 个空格或是 2 个制表符

### 4.代码区块

>1. 代码块：缩进 4 个空格或是 1 个制表符

>

>        ~~~c++

>        如此

>        ~~~

>

>2. 行内式：如果在一个行内需要引用代码，只要用反引号`引起来`

>3. 多行代码块与语法高亮：在需要高亮的代码块的前一行及后一行使用三个单反引号“`”包裹

### 5.链接

>1. 插入本地图片

>

>      （1） ！[图片描述]（图片路径”title“）

>

>      （2） ！[图片描述]（图片路径）

>

>2. 插入网上图片： ！[图片描述]（图片网络路径）

>

>3. 图片描述非必须

>

>4. 自动连接

>     Markdown 支持以比较简短的自动链接形式来处理网址和电子邮件信箱，只要是用<>包起来， Markdown 就会自动把它转成链接。也可以直接写，也是可以显示成链接形式的

>

>   ![img](https://img-blog.csdn.net/20180802155459346?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTQwNjE2MzA=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

### 6.分割线

>1.可以在一行中用三个以上的星号(*)、减号(-)、底线(_)来建立一个分隔线，行内不能有其他东西。也可以在星号或是减号中间插入空格.

### 7.快捷键

| 功能     | 快捷键   |
| -------- | -------- |
| 加粗     | Ctrl + B |
| 斜体     | Ctrl + I |
| 引用     | Ctrl + Q |
| 插入链接 | Ctrl + L |
| 插入代码 | Ctrl + K |
| 插入图片 | Ctrl + G |
| 提升标题 | Ctrl + H |
| 有序列表 | Ctrl + O |
| 无序列表 | Ctrl + U |
| 横线     | Ctrl + R |
| 撤销     | Ctrl + Z |
| 重做     | Ctrl + Y |

### 8.字体设置

>1. ~~~c

>     *这里是文字*

>     _这里是文字_

>     **这里是文字**

>     ***这里是文字***

>     ~~这里是文字~~

>

>效果如下：

>

>*这里是文字*

>_这里是文字_

>**这里是文字**

>***这里是文字***

>~~这里是文字~~
# 机器人学学习笔记
# 第一章

##  1.机器人的定义

>**机器人是一种以目标导向的具有感知，规划，运动能力的机器**
>
>机器人感知环境，利用信息，结合工作目标，规划运动——感知能力对机器人是至关重要的。

## 2.机器人的分类

>1. 工业机器人
>2. 服务机器人
>3. 野外机器人
>4. 人形机器人

## 3.将会使用到的知识点

>1. 线性代数（已学）
>2. 基础集合论
>3. 基础图论
>4. 概率论
>5. 动力学
>6. 拉普拉斯变换
>7. 传递函数
>8. 线性控制
>

# 第二章

## 1.坐标系与变换

>1. 笛卡尔坐标系：有一组正交轴构成，相交与原点
>
>2. 在考虑一组点时，往往动系不动点，通过描述坐标系的位姿来描述点
>
>3. 坐标系位姿的表示：
>
>  ![](https://github.com/cxy-jixie/assignment/blob/3.20/mmexport1647477074201.jpg)
>
>  ![](https://github.com/cxy-jixie/assignment/blob/3.20/mmexport1647477078914.jpg)
>
>   4. 一些运算规则![](https://github.com/cxy-jixie/assignment/blob/3.20/mmexport1647477085104.jpg)
>
>      可以看到左上与右下可以相消，消掉后左上保持一致则变换正确

## 2.二维空间位姿描述

>1. 用简单的向量复合起来不方便，将问题分为两部分：旋转与平移；
>
>2. 旋转矩阵：![img](https://images2017.cnblogs.com/blog/71080/201711/71080-20171116101019015-876159441.png)
>
>   是标准正交矩阵，行列式值为1，R逆=RT
>
>   恒有R(-a)=R(a)T
>
>3. 由此加上平移变换，可得到坐标系的齐次变换矩阵![](https://github.com/cxy-jixie/assignment/blob/3.20/mmexport1647477090356.jpg)
>
>   ![微信图片_20220316194903](https://github.com/cxy-jixie/assignment/blob/3.20/mmexport1647477093857.jpg)
>
>   4.使用matlab时使用“se2"建立齐次变换。
# matlab学习笔记
## 1.基本语法

>1. operators:基本与常识相一致（“^"为次方）
>
>2. ”ans"结果输出
>
>3. 优先级正常，如变更加（）
>
>4. "help"+指令=怎么用
>
>$$
>  abs :绝对值
>
>  　　acos :反余弦
>
>  　　acosh :反双曲余弦函数
>
>  　　acot :反余切
>
>  　　acoth :反双曲线余切
>
>  　　acsc :反余割
>
>  　　acsch :反双曲线余割
>
>  　　angle :相位角
>
>  　　asec :反正割
>
>  　　asech :反双曲线正割
>
>  　　asin :反正弦
>
>  　　asinh :反双曲线正弦
>
>  　　atan :反正切
>
>  　　atanh :反双曲线正切
>
>  　　atan2 :四象限反正切
>
>  　　ceil :向正无穷方向舍入:ceil(4.3)=5
>
>  　　complex : 复数
>
>  　　conj :求共扼
>
>  　　cos :余弦
>
>  　　cosh :双曲余弦
>
>  　　cot :余切
>
>  　　coth :双曲线余切
>
>  　　csc :余割
>
>  　　csch :双曲线余割
>
>  　　exp :指数
>
>  　　fix :向零舍入
>
>  　　floor :向负无穷大舍入
>
>  　　gcd :最大条约数
>
>  　　imag :复数的虚部
>
>  　　lcm :最小公倍数
>
>  　　log :自然对数
>
>  　　log2 :以2为底的对数
>
>  　　log10 :以10为底的对数
>
>  　　mod :模除
>
>  　　nchoosek :二项式系数 nchoosek(n,k)=n!/{k!(n-k)!}
>
>  　　real :复数实部
>
>  　　rem :余数
>
>  　　round :四舍五入
>
>  　　sec :正割
>
>  　　sech :双曲线正割
>
>  　　sign :符号函数
>
>  　　sin :正弦
>
>  　　sinh :双曲线正弦
>
>  　　sqrt :平方根
>
>  　　tan :正切
>
>  　　tanh :双曲线正切
>
>  　　matlab 特殊函数\特殊变量以及恒量
>
>  　　特殊函数
>
>  　　airy :airy函数
>
>  　　besselh:第三类贝塞尔函数；）
>
>  　　besseli
>
>  　　besselk:改良型besselh函数
>
>  　　besselj
>
>  　　bessely:贝塞尔函数
>
>  　　beta
>
>  　　betainc
>
>  　　betaln :贝塔函数
>
>  　　ellipj :雅克比椭圆函数
>
>  　　ellipke:完全椭圆积分
>
>  　　erf
>
>  　　erfc
>
>  　　erfcx
>
>  　　erfinv :误差函数
>
>  　　expint :指数积分
>
>  　　factorial:阶乘函数
>
>  　　gamma
>
>  　　gammaln
>
>  　　gammainc:伽马函数
>
>  　　legendre:勒让德函数
>
>  　　pow2 :2的幂次
>
>  　　rat
>
>  　　rats :有理迫近
>
>  　　特殊变量以及恒量
>
>  　　ans :对最近输入的反应
>
>  　　computer :当前计较机类型
>
>  　　eps :浮点精度
>
>  　　flops :计较浮点操作次数，现已再也不常用
>
>  　　i :虚部单位
>
>  　　inf :无穷大
>
>  　　inputname :输入参数名
>
>  　　j :虚部单位
>
>  　　nan :非数据
>
>  　　nargin :输入参数的数量
>
>  　　nargout :输出参数的数量(用户界说函数)
>
>  　　pi :圆周率
>
>  　　realmax :最大正浮点数
>
>  　　realmin :最小正浮点数
>
>  　　varargin,varargout:返回参数数量(matlab函数)
>$$
>
>5. embedding functions:可理解为复合函数(防止优先级出问题）
>
>  ~~~ matlab
>sin(cos(pi))
>等价于
>cos(pi)
>sin(ans)
>  ~~~

>6. variables(变量)：不需要特意声明变量类型（默认double），变量在左同cpp，大小写要区分，变量开头不能·有数字
>
>7. special variables:不要使用"ans,i,j,Inf,eps,NaN,pi" 作为变量   iskeywords可查询
>
>8. matlab calling priority： variable>bulid-in function>subfunction>private function:(MEX-file>p-file>m-file)
>
>9. clear +变量名清变量 clear请全部
>
>10. format: 可控制输出数字的类型
>
>| format    默认格式<br/>format short   5字长定点数，显示5位(scaled fixed point format with 5 digits)<br/>format long   15字长定点数，显示15位双精度，7位单精度（scaled fixed point）<br/>format short e   5字长浮点数<br/>format long e    15字长浮点数<br/>format hex      16进制<br/>format bank      定点货币形式<br/>format rat    小数分数表示<br/>format +       ＋，－，空格<br/>format compact    压缩空格<br/>format loose       包括空格和空行<br/>format long   15字长定点数<br/>format short e   5字长浮点数<br/>format long e    15字长浮点数<br/>format short g   5位定点或浮点格式。<br/>format long g    对双精度，显示15位定点或浮点格式，对单精度，显示7位定点或浮点格式。<br/> |
>| ------------------------------------------------------------ |
>
>11. ”；“：不显示运算结果，使画面干净；
>
>12. 方向键：调出command history;

## 2.运算

>1. Array:用中括号框起来，”；“为换行指令。
>
>2. indexing：方法一：f（a,b）;方法二：f(a)第a个；”：“全部
>
>  ```matlab
>  >> a=[1 21 6;5 17 9;31 2 7]
>
>  a =
>
>       1    21     6
>       5    17     9
>      31     2     7
>
>  >> a([1 3 5])
>
>  ans =
>
>       1    31    17
>
>  >> a([1 3;1 3])
>
>  ans =
>
>       1    31
>       1    31
>
>  >> a([1 3],[1 3])
>
>  ans =
>
>       1     6
>      31     7
>
>  >> a([1 2],[1 3])
>
>  ans =
>
>       1     6
>       5     9
>
>  >> a([2 3;2 3])
>
>  ans =
>
>       5    31
>       5    31
>
>  >> a([2 3;1 2])
>
>  ans =
>
>       5    31
>       1     5
>
>  ```
>
>  3. replacing entries:   expression:a()=[];
>
>  4. colon oprator:等差级数的创立 例：a=[1:100]
>
>     j:i:k=起点：公差：重点;每行都可以单独使用；

>5. delet rows or columns:将其替换成空；
>
>6. concatenation：a=[] b=[] f=[a,b] c=[a;b];
>
>7. Manipulation(运算)：
>
>$$
>  表达式(Matlab程序)
>
>                                           函数功能
>
>  1
>
>  A(1)
>
>  将二维矩阵A重组为一维数组，返回数组中第一个元素
>
>  2
>
>  A(: , j)
>
>  返回二维矩阵A中第 j 列 列向量
>
>  3
>
>  A( i , :)
>
>  返回二维矩阵A中第 i 行 行向量
>
>  4
>
>  A(: , j : k)
>
>  返回二维矩阵A中第 j 列到第 k列 列向量组成的子矩阵
>
>  5
>
>  A( i : k , :)
>
>  返回二维矩阵A中第 i 行到第 k行 行向量组成的子矩阵
>
>  6
>
>  A( i : k , j : m)
>
>  返回二维矩阵A中第 i 行到第 k 行 行向量
>
>  和第 j 列到第 m 列 列向量的交集组成的子矩阵
>
>  7
>
>  A(:)
>
>  将二维矩阵A中得每列合并成一个列向量
>
>  8
>
>  A( j : k)
>
>  返回一个行向量，其元素为A(:)中的第 j 个元素到第 k 个元素
>
>  9
>
>  A([ j1 j2…])
>
>  返回一个行向量，其元素为A(:)中的第 j1，j2…个元素
>
>  10
>
>  A(: , [ j1 j2 …])
>
>  返回矩阵A的第 j1 列、第 j2 列等的列向量
>
>  11
>
>  A([ i1 i2 …] : ,)
>
>  返回矩阵A的第 i1 行、第 i2 行等的行向量
>
>  12
>
>  A([ i1 i2 …] , [ j1 j2 …])
>
>  返回矩阵A的第 j1列、第 j2 列等和矩阵A的第 i1 行、第 i2 行等的元素
>$$
>
>$$
>  （1）A+B; 表示矩阵A和矩阵B相加（各个元素对应相加）；
>
>  （2）A-B; 表示矩阵A和矩阵B相减（各个元素对应相减）；
>
>  （3）A
>$$
>
>$$
>  *B; 表示矩阵A和矩阵B相乘；
>
>  （4）A.*B; 表示矩阵A和矩阵B对应元素相乘（点乘）；
>
>  （5）A/B; 表示矩阵A与矩阵B相除法；
>
>  （6）A./B; 表示矩阵A和矩阵B对应元素相除（点除）；
>
>  （7）A^B; 表示矩阵A的B次幂；
>
>  （8）A.^B; 表示矩阵A的每个元素的B次幂
>$$

>矩阵与数相乘相加是每一个元素都要乘，但（a^2=a*a,但a.^2则作用于每一个元素）a'为转置
>
>8. 特殊矩阵
>
>  ```
>diga()---对角线矩阵；
>ones（m,n）——创建m*n全1矩阵；ones（m）——创建m*m全1矩阵；ones(size(A))——创建和矩阵A相同维度的全1矩阵；
>zeros(m,n)——创建m*n全0矩阵；zeros（m）——创建m*m全0矩阵；zeros(size(A))——创建和矩阵A相同维度的全0矩阵；
>eye(m,n)——创建m*n单位矩阵；eye(m)——创建n*n单位矩阵；eye(eye(A))——创建和矩阵A相同维度的单位矩阵；
>magic(m)——创建m*m魔术矩阵；
>rand(m,n)——创建m*n的矩阵，矩阵中的元素为0~1之间均匀分布的随机数；rand(n)——与zeros，ones相同；
>randn命令创建的矩阵，其中的元素为零均值，单位方差的正态分布函数，randn(m,n),rand(m),同上；
>triu(A)——用于创建和A大小相同的上三角矩阵，新矩阵中的元素为A中对角线及其上方的元素；triu(A,q)——创建一个由矩阵A第q条对角线的元素组成及其上方元素，其余元素都为0 的矩阵。（q=0表示主对角线，q<0表示主对角线下的第q条对角线，q>0表示主对角线上的第q条对角线）；
>tril命令用于创建下三角矩阵，参数意义同上。
>  ```
>
>  9. 矩阵比较：
>
>     ```
>     1．求向量的最大值和最小值
>     求一个向量X的最大值的函数有两种调用格式，分别是：
>     (1) y=max(X)：返回向量X的最大值存入y，如果X中包含复数元素，则按模取最大值。
>     
>     (2) [y,I]=max(X)：返回向量X的最大值存入y，最大值的序号存入I，如果X中包含复数元素，则按模取最大值。
>     求向量X的最小值的函数是min(X)，用法和max(X)完全相同。
>     例3-1 求向量x的最大值。
>     命令如下：
>     x=[-43,72,9,16,23,47];
>     y=max(x) %求向量x中的最大值
>     [y,l]=max(x) %求向量x中的最大值及其该元素的位置
>     2．求矩阵的最大值和最小值
>     求矩阵A的最大值的函数有3种调用格式，分别是：
>     (1) max(A)：返回一个行向量，向量的第i个元素是矩阵A的第i列上的最大值。
>     (2) [Y,U]=max(A)：返回行向量Y和U，Y向量记录A的每列的最大值，U向量记录每列最大值的行号。
>     (3) max(A,[],dim)：dim取1或2。dim取1时，该函数和max(A)完全相同；dim取2时，该函数返回一个列向量，其第i个元素是A矩阵的第i行上的最大值。
>     求最小值的函数是min，其用法和max完全相同。
>     例3-2 分别求3×4矩阵x中各列和各行元素中的最大值，并求整个矩阵的最大值和最小值。
>     3．两个向量或矩阵对应元素的比较
>     函数max和min还能对两个同型的向量或矩阵进行比较，调用格式为：
>     (1) U=max(A,B)：A,B是两个同型的向量或矩阵，结果U是与A,B同型的向量或矩阵，U的每个元素等于A,B对应元素的较大者。
>     (2) U=max(A,n)：n是一个标量，结果U是与A同型的向量或矩阵，U的每个元素等于A对应元素和n中的较大者。
>     min函数的用法和max完全相同。
>     ```

## 3. 程序

>1. structure program:
>
>  (1) logical operator：不同（不等于~=)
>
>  (2) "if elseif else":condition 不加（）,后加”end“
>
>  (3)switch:后加”end"
>
>  (4)while: while expression
>
>  ​                            statment
>
>  ​                 end
>
>  (5)for :    for v=start:incremrnt:end
>
>  ​                      commands
>
>  ​                 end
>
>  ​             预先分配大小会快一点
>
>  （6） break:跳出循环
>
>2. tips ：clear ，“clear all”，“ctrl+c"停止；
>
>3. functions:函数的编写与调用
>
>  （1）定义：keyword+output+functionname+v
>
>    (2)   调用：name(a,b,c)
>    
>    (3)  注意程序主体的编写
>
>
