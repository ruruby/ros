; Auto-generated. Do not edit!


(cl:in-package ros_msg_test-msg)


;//! \htmlinclude Msg_order.msg.html

(cl:defclass <Msg_order> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (menu_data
    :reader menu_data
    :initarg :menu_data
    :type cl:string
    :initform "")
   (menu_cnt_data
    :reader menu_cnt_data
    :initarg :menu_cnt_data
    :type cl:integer
    :initform 0)
   (total
    :reader total
    :initarg :total
    :type cl:integer
    :initform 0))
)

(cl:defclass Msg_order (<Msg_order>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Msg_order>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Msg_order)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_msg_test-msg:<Msg_order> is deprecated: use ros_msg_test-msg:Msg_order instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <Msg_order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_msg_test-msg:stamp-val is deprecated.  Use ros_msg_test-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'menu_data-val :lambda-list '(m))
(cl:defmethod menu_data-val ((m <Msg_order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_msg_test-msg:menu_data-val is deprecated.  Use ros_msg_test-msg:menu_data instead.")
  (menu_data m))

(cl:ensure-generic-function 'menu_cnt_data-val :lambda-list '(m))
(cl:defmethod menu_cnt_data-val ((m <Msg_order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_msg_test-msg:menu_cnt_data-val is deprecated.  Use ros_msg_test-msg:menu_cnt_data instead.")
  (menu_cnt_data m))

(cl:ensure-generic-function 'total-val :lambda-list '(m))
(cl:defmethod total-val ((m <Msg_order>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_msg_test-msg:total-val is deprecated.  Use ros_msg_test-msg:total instead.")
  (total m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Msg_order>) ostream)
  "Serializes a message object of type '<Msg_order>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'menu_data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'menu_data))
  (cl:let* ((signed (cl:slot-value msg 'menu_cnt_data)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'total)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Msg_order>) istream)
  "Deserializes a message object of type '<Msg_order>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'menu_data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'menu_data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'menu_cnt_data) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'total) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Msg_order>)))
  "Returns string type for a message object of type '<Msg_order>"
  "ros_msg_test/Msg_order")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Msg_order)))
  "Returns string type for a message object of type 'Msg_order"
  "ros_msg_test/Msg_order")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Msg_order>)))
  "Returns md5sum for a message object of type '<Msg_order>"
  "2ed0e9a3e1cd53d539f1bd23d1faae35")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Msg_order)))
  "Returns md5sum for a message object of type 'Msg_order"
  "2ed0e9a3e1cd53d539f1bd23d1faae35")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Msg_order>)))
  "Returns full string definition for message of type '<Msg_order>"
  (cl:format cl:nil "time stamp~%string menu_data~%int32 menu_cnt_data~%int32 total~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Msg_order)))
  "Returns full string definition for message of type 'Msg_order"
  (cl:format cl:nil "time stamp~%string menu_data~%int32 menu_cnt_data~%int32 total~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Msg_order>))
  (cl:+ 0
     8
     4 (cl:length (cl:slot-value msg 'menu_data))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Msg_order>))
  "Converts a ROS message object to a list"
  (cl:list 'Msg_order
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':menu_data (menu_data msg))
    (cl:cons ':menu_cnt_data (menu_cnt_data msg))
    (cl:cons ':total (total msg))
))
