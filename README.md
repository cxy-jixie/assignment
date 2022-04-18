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

