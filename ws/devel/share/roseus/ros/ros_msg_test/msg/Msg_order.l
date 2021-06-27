;; Auto-generated. Do not edit!


(when (boundp 'ros_msg_test::Msg_order)
  (if (not (find-package "ROS_MSG_TEST"))
    (make-package "ROS_MSG_TEST"))
  (shadow 'Msg_order (find-package "ROS_MSG_TEST")))
(unless (find-package "ROS_MSG_TEST::MSG_ORDER")
  (make-package "ROS_MSG_TEST::MSG_ORDER"))

(in-package "ROS")
;;//! \htmlinclude Msg_order.msg.html


(defclass ros_msg_test::Msg_order
  :super ros::object
  :slots (_stamp _menu_data _menu_cnt_data _total ))

(defmethod ros_msg_test::Msg_order
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:menu_data __menu_data) "")
    ((:menu_cnt_data __menu_cnt_data) 0)
    ((:total __total) 0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _menu_data (string __menu_data))
   (setq _menu_cnt_data (round __menu_cnt_data))
   (setq _total (round __total))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:menu_data
   (&optional __menu_data)
   (if __menu_data (setq _menu_data __menu_data)) _menu_data)
  (:menu_cnt_data
   (&optional __menu_cnt_data)
   (if __menu_cnt_data (setq _menu_cnt_data __menu_cnt_data)) _menu_cnt_data)
  (:total
   (&optional __total)
   (if __total (setq _total __total)) _total)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; string _menu_data
    4 (length _menu_data)
    ;; int32 _menu_cnt_data
    4
    ;; int32 _total
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; string _menu_data
       (write-long (length _menu_data) s) (princ _menu_data s)
     ;; int32 _menu_cnt_data
       (write-long _menu_cnt_data s)
     ;; int32 _total
       (write-long _total s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _menu_data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _menu_data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _menu_cnt_data
     (setq _menu_cnt_data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _total
     (setq _total (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get ros_msg_test::Msg_order :md5sum-) "2ed0e9a3e1cd53d539f1bd23d1faae35")
(setf (get ros_msg_test::Msg_order :datatype-) "ros_msg_test/Msg_order")
(setf (get ros_msg_test::Msg_order :definition-)
      "time stamp
string menu_data
int32 menu_cnt_data
int32 total

")



(provide :ros_msg_test/Msg_order "2ed0e9a3e1cd53d539f1bd23d1faae35")


