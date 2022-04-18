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
效果如下：
~~~ 
path:        2014-12-10-20-08-34.bag
version:     2.0
duration:    1:38s (98s)
start:       Dec 10 2014 20:08:35.83 (1418270915.83)
end:         Dec 10 2014 20:10:14.38 (1418271014.38)
size:        865.0 KB
messages:    12471
compression: none [1/1 chunks]
types:       geometry_msgs/Twist [9f195f881246fdfa2798d1d3eebca84a]
             rosgraph_msgs/Log   [acffd30cd6b6de30f120938c17c593fb]
             turtlesim/Color     [353891e354491c51aabe32df673fb446]
             turtlesim/Pose      [863b248d5016ca62ea2e895ae5265cf9]
topics:      /rosout                    4 msgs    : rosgraph_msgs/Log   (2 connections)
             /turtle1/cmd_vel         169 msgs    : geometry_msgs/Twist
             /turtle1/color_sensor   6149 msgs    : turtlesim/Color
             /turtle1/pose           6149 msgs    : turtlesim/Pose
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
## 有效的命名
1. 具备如下特点：
（1）首字符必须是字母，波浪线，或者左斜杠
（2）后续字符可以是字母或数字，下划线，或者是左斜杠
2. 命名解析

 （1）基础（base）名称，例如：base。

 （2）全局（global）名称，例如：/global/name。

 （3）相对（relative）名称，例如：relative/name。

 （4）私有（private）名称，例如：~privat/name

3. 全局名称需要列出所有的命名空间，其解析度更高，但不能使用很多的全局名称会影响功能包的可移植性
4. 相对名称由ROS提供默认的命名空间，不需要带有开头的左斜杠，所以重点是如何确定默认的命名空间
ROS提供了如下方法：
>> 1. 通过命令参数设置。调用ros::init()的ROS程序会接收名为_ _ns的命令行参数，可以为程序设置默认的命名空间，赋值方法为 _ _ns:=default-namespace。
>>2. 在launch文件里设置在该文件里可通过设置ns参数来确定默认命名空间
>>3. 使用环境变量设置，也可以执行ROS程序在终端中设置默认命名空间的环境变量 
5. 命名重映射：所有节点内的资源名称都可以在节点启动时进行重映射，作用在于可以支持我们打开多个相同的节点但不会发生命名的冲突
~~~r
name:=new_name
--------------示例（将chatter重映射为/wg/chater)
rosrun rospy_turtorials talker chatter:=/wg/chatter
~~~
效果如下：

![](https://github.com/cxy-jixie/assignment/blob/4.23/%E5%9B%BE%E7%89%87%E3%80%81/xiaoguo.png)
# 总结
## ROS的通信结构
![](https://github.com/cxy-jixie/assignment/blob/4.23/%E5%9B%BE%E7%89%87%E3%80%81/yingyong.png)
## 关于节点的理解
![](https://github.com/cxy-jixie/assignment/blob/4.23/%E5%9B%BE%E7%89%87%E3%80%81/jiedianlijie.png)
# 服务通信机制
1. 服务是一种带有应答的通信机制，与话题通信相比，减少了Listener与Talker之间的通信
2. Talker注册：通过端口使用rpc向ROSMaster注册发布者信息，包含所提供的服务名
3. Listener注册：过程与上面基本一致，包含需要查找的服务名
4. ROSMaster进行信息匹配
5. 两者之间建立网络连接
6. Talker向Listener发布服务应答数据
