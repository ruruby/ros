#include "ros/ros.h"    // ROS 기본 헤더파일
#include "ros_msg_test/Msg_order.h"    // Msg_order 메시지 파일 헤더(빌드 후 자동 생성됨)
#include <iostream>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

class kiosk {
//private:
public:
	char choice=' ';
	vector<string> burger = { "새우버거","불고기버거","싸이버거","딥치즈버거" };
	vector<int> bprice = { 4300, 4500, 4700, 4900 };
	vector<string> side = { "치즈스틱","감자튀김","샐러드","아이스크림" };
	vector<int> sprice = { 1500, 1000, 1500, 700 };
	vector<string> drink = { "사이다","콜라","환타","오렌지주스" };
	int dprice = 1000;
	vector<string> total = { "총 주문 메뉴" };
	vector<int> total_num = {};
	ofstream writeFile;

//public:
	kiosk() {};
	int border, sorder, dorder;
	int b, s, d;
	int cnt = 0;
	int totalprice = 0;
	char *p = &choice;
	void getburger();
	void getside();
	void getdrink();
	void select(int a) {};
	void cleartotal(){ total.clear(); }
	void receipt();
	~kiosk() {};
};

int main(int argc, char **argv) {
	ros::init(argc, argv, "order_topic_publisher");    // 노드명 초기화
	ros::NodeHandle nh;    // ROS 시스템과 통신을 위한 노드 핸들 선언
	ros::Publisher order_topic_publisher = nh.advertise< ros_msg_test :: Msg_order >("order_msg", 100);
	ros_msg_test :: Msg_order msg;  
	
	kiosk a;
	a.cleartotal();
	int pick=1;
	do {	
		do{
			if (pick == 1 || pick == 2 || pick == 3) {
				cout << "====== 메뉴 분류 ======" << endl;
				cout << "1. 햄버거\n2. 사이드\n3. 음료" << endl;
				cout << "=======================" << endl << endl << "몇번을 선택하시겠습니까? ";
			}
			cin >> pick;
			switch (pick) {
			case 1:
				a.getburger();
				break;
			case 2:
				a.getside();
				break;
			case 3:
				a.getdrink();
				break;
			default:
				cout << "존재하지 않는 분류를 선택하셨습니다\n다시 선택해 주십시오" << endl;
				break;
			}
		} while (*(a.p)== 'y');
	} while (pick != 1 && pick!=2 && pick!=3);
	  
	//a.receipt();

	//writeFile.open("receipt.txt");
	//writeFile<<"======영수증======"<<endl;
	cout<<"======영수증======"<<endl;
	for (int i = 0; i < a.cnt; i++) {
		string menu = a.total[i];
		//writeFile.write(menu.c_str(), menu.size());
		cout<<menu<<": "<<a.total_num[i]<<endl;
		msg.menu_data=menu.c_str();//revised
		//writeFile << " "<<a.total_num[i];
		msg.menu_cnt_data=a.total_num[i];//revised
		//string arr[3] = "개";
		//writeFile.write(arr, 2);
		msg.stamp=ros::Time::now();
		msg.total=a.total_num[i];
		ROS_INFO("time info : ", msg.stamp);
		ROS_INFO("order of %s * %d", msg.menu_data, msg.menu_cnt_data);    // data 메시지를 표시한다
		order_topic_publisher.publish(msg);    // 메시지를 발행한다
		//writeFile << endl;
	}
	cout<<"================="<<endl<<"총 가격 : "<<a.totalprice<<endl << "감사합니다." << endl;
	//writeFile.close();
	cout << "영수증이 출력되었습니다" << endl;
	//topic
	//msg.stamp=ros::Time::now();
	//order_topic_publisher.publish(msg);    // 메시지를 발행한다
	ROS_INFO("terminated time info : ", msg.stamp);	
	int choice;
	cout << "node should not be terminated." << endl;
	cin >> choice;
	while(true){
		msg.stamp=ros::Time::now();
		order_topic_publisher.publish(msg);
		ROS_INFO("send msg : ", msg.stamp);
		}
	
	
}


void kiosk::getburger() {
	string temp;
	for (int i = 0; i < 4; i++) {
		cout << i + 1 << ". " << burger[i] << "(" << bprice[i] << ")" << endl;
		}
		cout << endl<<endl<<"주문할 버거의 번호와 수량을 입력해주세요\nex>새우버거 2개 : 1 2" << endl;
		do{
			cin >> border >> b;
		if (border != 1 && border != 2 && border != 3 && border != 4) {
			cout << "존재하지 않는 메뉴를 선택하셨습니다\n다시 선택해 주십시오" << endl;
		}
	} while (border != 1 && border != 2 && border != 3 && border != 4);
	temp=burger.at(border-1);
	total.push_back(temp);
	total_num.push_back(b);
	totalprice += b * bprice[border-1];
	cnt++;
	
	cout << burger[border - 1] << " " << b << "개가 주문되었습니다" << endl;
	cout << "계속 선택하시겠습니까?(y,n)" << endl;
	cin >> choice;
}

void kiosk::getside() {
	string temp;
		for (int i = 0; i < 4; i++) {
			cout << i + 1 << ". " << side[i] << "(" << sprice[i] << ")" << endl;
		}
		cout << endl<< "주문할 사이드의 번호와 수량을 입력해주세요\nex>치즈스틱 2개 : 1 2" << endl;
		do{
			cin >> sorder >> s;
		if (sorder != 1 && sorder != 2 && sorder != 3 && sorder != 4) {
			cout << "존재하지 않는 메뉴를 선택하셨습니다\n다시 선택해 주십시오" << endl;
		}
	} while (sorder != 1 && sorder != 2 && sorder != 3 && sorder != 4);
	temp = side.at(sorder - 1);
	total.push_back(temp);
	total_num.push_back(s);
	totalprice += s * sprice[sorder - 1];
	cnt++;

	cout << side[sorder - 1] << " " << s << "개가 주문되었습니다" << endl;
	cout << "계속 선택하시겠습니까?(y,n)" << endl;
	cin >> choice;
}

void kiosk::getdrink() {
	string temp;
		for (int i = 0; i < 4; i++) {
			cout << i + 1 << ". " << drink[i] << "(" << dprice << ")" << endl;
		}
		cout << endl<<"주문할 음료의 번호와 수량을 입력해주세요\nex>사이다 2개 : 1 2" << endl;
		do{
			cin >> dorder >> d;
		if (dorder != 1 && dorder != 2 && dorder != 3 && dorder != 4) {
			cout << "존재하지 않는 메뉴를 선택하셨습니다\n다시 선택해 주십시오" << endl;
		}
	} while (dorder != 1 && dorder != 2 && dorder != 3 && dorder != 4);
	temp = drink.at(dorder - 1);
	total.push_back(temp);
	total_num.push_back(d);
	totalprice += d * dprice;
	cnt++;

	cout << drink[dorder - 1] << " " << d << "개가 주문되었습니다" << endl;
	cout << "계속 선택하시겠습니까?(y,n)" << endl;
	cin >> choice;
}

/*
void kiosk::receipt() {
	ros_msg_test :: Msg_order msg; 
	writeFile.open("receipt.txt");
	writeFile<<"======영수증======"<<endl;
	
	for (int i = 0; i < cnt; i++) {
		string menu = total[i];
		writeFile.write(menu.c_str(), menu.size());
		msg.menu_data=menu.c_str();//revised
		writeFile << " "<<total_num[i];
		msg.menu_cnt_data=total_num[i];//revised
		//string arr[3] = "개";
		//writeFile.write(arr, 2);
		ROS_INFO("order of %s * %d", menu.c_str(), msg.menu_cnt_data);    // data 메시지를 표시한다
		order_topic_publisher.publish(msg);    // 메시지를 발행한다
		writeFile << endl;
	}
	writeFile<<"================="<<endl<<"총 가격 : "<<totalprice<<endl << "감사합니다." << endl;
	writeFile.close();
	cout << "영수증이 출력되었습니다" << endl;
	//topic
}
*/
