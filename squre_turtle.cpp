#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#define PI 3.1415926                      

int main(int argc,char * argv[])
{

    ros::init(argc,argv,"squre_turtle");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10); 
    ros::Rate rate(2);            
    geometry_msgs::Twist twist;
    float x1;
    float z1;
    int count = 0;          
    int countz =0;   
    twist.linear.x = 0;    
    twist.angular.z = 0;   
    twist.linear.y = 0;
    twist.linear.z = 0;
    twist.angular.x = 0;
    twist.angular.y = 0;

    while (ros::ok())
    {  
      
        count ++;
        countz++;
        x1 = 0.6;
        z1= 0;
        if (count == 5)      
        {
            z1= PI;
            count = 0;
            countz ++;
        }
        
        if (countz==60)
        {
            break;
        }
        twist.linear.x = x1;        
        twist.angular.z = z1;   
        pub.publish(twist);                
        rate.sleep();
        ros::spinOnce();
    }
    return 0;
}

