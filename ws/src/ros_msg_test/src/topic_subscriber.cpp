#include "ros/ros.h"    // ROS 기본 헤더파일

#include "ros_msg_test/Msg_order.h"    // MsgTest 메시지 파일 헤더 (빌드 후 자동 생성됨)

#include "ros_msg_test/MsgTest.h"    // MsgTest 메시지 파일 헤더 (빌드 후 자동 생성됨)
// 메시지 콜백 함수로써, 밑에서 설정한 ros_test_msg라는 이름의 토픽

// 메시지를 수신하였을 때 동작하는 함수이다

// 입력 메시지로는 ros_msg_test 패키지의 MsgTest 메시지를 받도록 되어있다

int cumul=0;

void msgCallback(const  ros_msg_test ::Msg_order::ConstPtr& msg)

{

    ROS_INFO("recieve msg = %d", msg->stamp.sec);    // stamp.sec 메시지를 표시한다

    ROS_INFO("recieve msg = %s", msg->menu_data);    // stamp.nsec 메시지를 표시한다

    ROS_INFO("total_cnt = %d", msg->menu_cnt_data);    // data 메시지를 표시한다
    ROS_INFO("total_money = %d", msg->total); 
    cumul+=msg->total;
}

void msgCallback2(const  ros_msg_test ::MsgTest::ConstPtr& msg)

{

    ROS_INFO("recieve msg = %d", msg->stamp.sec);    // stamp.sec 메시지를 표시>한다

    ROS_INFO("recieve msg = %d", msg->stamp.nsec);    // stamp.nsec 메시지를 표시

    ROS_INFO("recieve msg = %d", msg->data);    // data 메시지를 표시한

}

int main(int argc, char **argv)    // 노드 메인 함수

{

    ros::init(argc, argv, "topic_subscriber");    // 노드명 초기화
    ros::init(argc, argv, "topic_subscriber"); 
 

    ros::NodeHandle nh;    // ROS 시스템과 통신을 위한 노드 핸들 선언

 
    ros::NodeHandle nh2;    // ROS 시스템과 통신을 위한 노드 핸들 선언
    // 서브스크라이버 선언, ros_msg_test 패키지의 MsgTest 메시지 파일을 이용한

    // 서브스크라이버  topic_subscriber  를 작성한다. 토픽명은 "ros_test_msg" 이며,

    // 서브스크라이버 큐(queue) 사이즈를 100개로 설정한다는 것이다

    ros::Subscriber  topic_subscriber  = nh.subscribe("order_msg", 100, msgCallback);

 
    ros::Subscriber  topic_subscriber2  = nh2.subscribe("ros_test_msg", 100, msgCallback2);
    // 콜백함수 호출을 위한 함수로써, 메시지가 수신되기를 대기, 

    // 수신되었을 경우 콜백함수를 실행한다

    ros::spin();

    std::cout<<"cumulative sale: "<< cumul <<std::endl;

    return 0;

}
