#include <ur_rtde/rtde_control_interface.h>
#include <ur_rtde/rtde_receive_interface.h>

#include <chrono>
#include <iostream>
#include <thread>

using namespace ur_rtde;
using namespace std::chrono;
int main(int argc,char* argv[])
{
  RTDEControlInterface rtde_control("127.0.0.1");  //ip地址
  std::vector<double>  initial_position={-1.54,-1.83,-2.28,-0.59,1.60,0.023};
  std::vector<double>  task_frame={0,0,0,0,0,0};
  std::vector<int>     change={0,0,1,0,0,0};
  std::vector<double>  move1={0,0,-10,10,(3.14/2),0};
  std::vector<double>  limits={2,2,1.5,1,1,1};
  rtde_control.moveJ(initial_position);
  int force_type=2;
  double dt=1/500;
  for(unsigned int i=0; i<1000; i++)
  {
  auto t_start = high_resolution_clock::now();
  rtde_control.forceMode(task_frame, change, move1, force_type, limits);
  auto t_stop = high_resolution_clock::now();
  auto t_duration = std::chrono::duration<double>(t_stop - t_start);

   if (t_duration.count() < dt)
    {
      std::this_thread::sleep_for(std::chrono::duration<double>(dt - t_duration.count()));
    }

 
  }
   rtde_control.forceModeStop();
   rtde_control.stopScript();
   std::vector<double> speed = {0, 0.12, -0.100, 0, 0, 0};
   rtde_control.moveUntilContact(speed);
   rtde_control.stopScript();
  return 0;
  }
