# 录制与回放数据
## 1. 通过创建一个（bag)文件来进行录制
### 1.1 录制所有发布的话题
1. 首先检查看当前系统中发布的所有话题(使用如下命令)
~~~r
$ rostopic list -v
~~~
（上述显示的是可以录制的话题也是已发布的话题）

2. 开始录制
~~~ r
$ mkdir ~/bagfiles
$ cd ~/bagfiles
$ rosbag record -a
~~~
效果如下：
>>
![](https://github.com/cxy-jixie/assignment/blob/4.23/%E5%9B%BE%E7%89%87%E3%80%81/xiaoguoyi1.png)
##  2.检查并回放 bag 文件
### 检查
~~~r
rosbag info <your bagfile>
~~~
### 回放
~~~r
 rosbag play <your bagfile>
~~~
## 3. 录制数据子集
1. 命令中的-O参数告诉rosbag record将数据记录保存到名为subset.bag的文件中，同时后面的话题参数告诉rosbag record只能录制这两个指定的话题
~~~ r
rosbag record -O subset /turtle1/cmd_vel /turtle1/pose
~~~

2.  rosbag record/play 命令的局限性
>>受制于其本身的性能无法完全复制录制时的系统运行行为

>>当处理消息的过程中系统定时发生极小变化时也会使其行为发生微妙变化.
# roswtf入门
## 安装检查
1. 方法如下
~~~ r
$ roscd
$ roswtf
~~~
效果如下:

![](https://github.com/cxy-jixie/assignment/blob/4.23/%E5%9B%BE%E7%89%87%E3%80%81/xiaoguo2.png)


2. 在有节点的情况下运行则会出现如下情景
![](https://github.com/cxy-jixie/assignment/blob/4.23/%E5%9B%BE%E7%89%87%E3%80%81/xiaoguo3.png)

3. 错误报告
~~~r
$ roscd
$ ROS_PACKAGE_PATH=bad:$ROS_PACKAGE_PATH roswtf
~~~
在这个情况下就会产生“erro"而且其可以发现更多的错误可以尝试解决编译和通信之类的问题
# ROS维基
包含：

1. 首页
2.  package页面
3. stack页面
