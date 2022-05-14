#include <ur_rtde/rtde_control_interface.h>

using namespace ur_rtde;

int main(int argc, char* argv[])
{
  RTDEControlInterface rtde_control("127.0.0.1");
  double velocity = 2;
  double acceleration = 1.0;
  double blend_1 = 0.15;
  double blend_2 = 0.2;
  double blend_3 = 0.5;
  std::vector<double> path_pose1 = {-0.143, -0.435, 0.10, -0.001, 3.14, 0.04, velocity, acceleration, blend_1};
  std::vector<double> path_pose2 = {-0.200, -0.51, 0.21, 0.001, 1.70, 0.04, velocity, acceleration, blend_2};
  std::vector<double> path_pose3 = {0.32, 0.61, 0.31, -0.01, 3.6, 0.14, velocity, acceleration, blend_3};
  std::vector<std::vector<double>> path;
  path.push_back(path_pose1);
  path.push_back(path_pose2);
  path.push_back(path_pose3);
  rtde_control.moveL(path);
  rtde_control.stopScript();
  std::vector<double> speed = {10, 0.12, -0.1, 0, 0, 0};
  rtde_control.moveUntilContact(speed);
  rtde_control.stopScript();
  return 0;
}
