# ros程序包
1. 一个程序包要想称为catkin程序包必须符合以下要求：
>>  该程序包必须包含catkin compliant package.xml文件
这个package.xml文件提供有关程序包的元信息。
>>

>>  程序包必须包含一个catkin 版本的CMakeLists.txt文件，而Catkin metapackages中必须包含一个对CMakeList.txt文件的引用。
>>

>>  每个目录下只能有一个程序包。
这意味着在同一个目录下不能有嵌套的或者多个程序包存在。
>>
2. 创建程序包首先要创建工作空间
~~~ ros
--------创建工作空间
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src
--------编译空间
$ cd ~/catkin_ws/
$ catkin_make
--------将当前工作空间设置在ROS工作环境的最顶层
$ source devel/setup.zsh
~~~
创建程序包
~~~ ros
--------步骤一
$ cd ~/catkin_ws/src
---------步骤二
$ catkin_create_pkg +‘名字’+依赖关系
~~~
3. 程序包的依赖关系：

(1) 可以使用rospack命令工具来查看一级依赖包
~~~ ros
$ rospack depends1 beginner_tutorials 
$ roscd beginner_tutorials
$ cat package.xml
~~~
(2)间接依赖
~~~ ros
------- 在很多情况中，一个依赖包还会有它自己的依赖包
$ rospack depends1 rospy
------- 利用递归可以检测出所有依赖包
$ rospack depends beginner_tutorials
~~~

（3）自定义你的程序包
~~~ ros
----- 描述标签
 <description>The beginner_tutorials
  package</description>
----- 维护者标签（能够让其他人联系到程序包的相关人员。）
     <!-- One maintainer tag required, multiple allowed, one person per tag --> 
     <!-- Example:  -->
     <!-- <maintainer email="jane.doe@example.com">Jane Doe</maintainer> -->
     <maintainer email="user@todo.todo">user</maintainer>
------ 许可标签
    <!-- One license tag required, multiple allowed, one license per tag -->
    <!-- Commonly used license strings: -->
    <!--   BSD, MIT, Boost Software License, GPLv2, GPLv3, LGPLv2.1, LGPLv3 -->
    <license>TODO</license>
------ 依赖项标签
   <buildtool_depend>catkin</buildtool_depend>
     <build_depend>roscpp</build_depend>
     <build_depend>rospy</build_depend>
     <build_depend>std_msgs</build_depend>
~~~
# 编译Ros程序包
1. 使用 catkin_make 命令行可以简化流程
2. 开始编译程序包
~~~ ros
------- 切换到workspace 并查看文件
$ cd ~/catkin_ws/
$ ls src
------- 使用 catkin_make 进行编译
~~~
# 理解Ros节点
1. 几种节点

>>1. Nodes:节点,一个节点即为一个可执行文件，它可以通过ROS与其它节点进行通信。
>>2. Messages:消息，消息是一种ROS数据类型，用于订阅或发布到一个话题。
>>3. Topics:话题,节点可以发布消息到话题，也可以订阅话题以接收消息。
>>4. Master:节点管理器，ROS名称服务 (比如帮助节点找到彼此)。
>>5. rosout: ROS中相当于stdout/stderr。
>>roscore: 主机+ rosout + 参数服务器 (参数服务器会在后面介绍)。
2. 节点：ros程序包的一个执行文件，可实现客户库与其他节点的通信。可以接收或发布，或提供某种服务
3. 可实现不同编程语言之间的通信
4. roscore是运行ros之前必需要执行的命令行
5. 使用rosnode list可以看到正在运行的节点;rosnode info 返回一个特定的节点
6. rosrun 直接运行一个包内节点；使用Remapping Argument改变节点名称
7. 使用另外一个 rosnode 指令, ping来测试；
# 理解ros话题
1. 创建当前系统运行的动态图形
~~~r
$ rosrun rqt_graph rqt_graph
~~~
2. ostopic命令工具能获取有关ROS话题的信息
~~~r
$ rostopic -h
~~~
3. rostopic echo可以显示在某个话题上发布的数据。
~~~ r
--------用法
$ rostopic echo [topic]
~~~
4. rostopic list能够列出所有当前订阅和发布的话题
~~~r
$ rostopic list -h
~~~
5. rostopic type 命令用来查看所发布话题的消息类型
~~~r
$ rostopic type [topic]
$ rostopic type /turtle1/cmd_vel
~~~
6. rostopic pub可以把数据发布到当前某个正在广播的话题上
~~~r
$ rostopic pub [topic] [msg_type] [args]
~~~
7. rostopic hz命令可以用来查看数据发布的频率
~~~r
$ rostopic hz [topic]
~~~
8. rqt_plot命令可以实时显示一个发布到某个话题上的数据变化图形。
~~~r
$ rosrun rqt_plot rqt_plot
~~~
# 理解ros服务和参数
1. 是节点之间通讯的另一种方式
2. 
~~~
rosservice list                    输出可用服务的信息
rosservice call [service] [args]   调用带参数的服务
rosservice type [service]          输出服务类型
rosservice find                   依据类型寻找服务
find services by service type
rosservice uri               输出服务的ROSRPC uri
~~~
3. 
~~~
rosparam set            ----设置参数
rosparam get            ----获取参数
rosparam load           ----文件读取参数
rosparam dump           ----向文件中写入参数
rosparam delete         ----删除参数
rosparam list           ----列出参数名
~~~
# 消息与服务
1. 消息(msg): msg文件就是一个描述ROS中所使用消息类型的简单文本。它们会被用来生成不同语言的源代码。

2. 服务(srv): 一个srv文件描述一项服务。它包含两个部分：请求和响应。 msg文件存放在package的msg目录下，srv文件则存放在srv目录下。 msg文件实际上就是每行声明一个数据类型和变量名。可以使用的数据类型如下：
~~~
int8, int16, int32, int64 (plus uint*)
float32, float64
string
time, duration
other msg files
variable-length array[] and fixed-length array[C]
~~~
3. 创建一个msg
~~~ r
------例子
$ cd ~/catkin_ws/src/beginner_tutorials
$ mkdir msg
$ echo "int64 num" > msg/Num.msg
~~~
4. 将文件转换为编程语言的源代码
~~~ r
  <build_depend>message_generation</build_depend>
  <run_depend>message_runtime</run_depend>
~~~
5. 通过rosmsg show命令，检查ROS是否能够识消息
~~~r
-----形式
$ rosmsg show [message type]
-----样例
$ rosmsg show beginner_tutorials/Num；
~~~
6. 创建srv
~~~r
$ roscd beginner_tutorials
$ mkdir srv
~~~
从其他的package中复制一个服务。 roscp是一个很实用的命令行工具，它实现了将文件从一个package复制到另外一个package的功能。
~~~r
-----用法
$ roscp [package_name] [file_to_copy_path] [copy_path]
-----例子
$ roscp rospy_tutorials AddTwoInts.srv srv/AddTwoInts.srv
~~~
7. 通过 rossrv show 命令，检查ROS是否能够识别该服务。
~~~ r
------方法
$ rossrv show <service type> 
------例子
$ rossrv show beginner_tutorials/AddTwoInts
~~~
#  编写简单的消息发布器和订阅器 (C++)
1. 列表项初始化 ROS 系统
列表项在 ROS 网络内广播我们将要在 chatter 话题上发布 std_msgs/String 类型的消息
列表项以每秒 10 次的频率在 chatter 上发布消息
2. 列表项初始化ROS系统
列表项订阅 chatter 话题
列表项进入自循环，等待消息的到达
列表项当消息到达，调用 chatterCallback() 函数
# 测试消息发布器和订阅器
1. 首先打开roscore
2. 然后运行之前编写的发布器
~~~r
$ rosrun beginner_tutorials talker      (C++)
~~~
3. 启动订阅器
~~~r
$ rosrun beginner_tutorials listener     (C++)
~~~
# 编写简单的服务器和客户端
1. 编写Service节点
2. 编写Client节点
3. 编译节点
4. 运行命令
~~~r
# In your catkin workspace
cd ~/catkin_ws
catkin_make
~~~
# 测试简单的服务器和客户端
1. 运行Service
2. 运行Client
3. 
![](https://github.com/cxy-jixie/assignment/blob/4.16/Q%245_%25W4AVL9VFF~T_QVIY8K.png)
