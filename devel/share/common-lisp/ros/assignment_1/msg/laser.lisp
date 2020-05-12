; Auto-generated. Do not edit!


(cl:in-package assignment_1-msg)


;//! \htmlinclude laser.msg.html

(cl:defclass <laser> (roslisp-msg-protocol:ros-message)
  ((processedRange
    :reader processedRange
    :initarg :processedRange
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass laser (<laser>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <laser>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'laser)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment_1-msg:<laser> is deprecated: use assignment_1-msg:laser instead.")))

(cl:ensure-generic-function 'processedRange-val :lambda-list '(m))
(cl:defmethod processedRange-val ((m <laser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_1-msg:processedRange-val is deprecated.  Use assignment_1-msg:processedRange instead.")
  (processedRange m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <laser>) ostream)
  "Serializes a message object of type '<laser>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'processedRange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'processedRange))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <laser>) istream)
  "Deserializes a message object of type '<laser>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'processedRange) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'processedRange)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<laser>)))
  "Returns string type for a message object of type '<laser>"
  "assignment_1/laser")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laser)))
  "Returns string type for a message object of type 'laser"
  "assignment_1/laser")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<laser>)))
  "Returns md5sum for a message object of type '<laser>"
  "e307b89be484e2eb589951f9421237f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'laser)))
  "Returns md5sum for a message object of type 'laser"
  "e307b89be484e2eb589951f9421237f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<laser>)))
  "Returns full string definition for message of type '<laser>"
  (cl:format cl:nil "int32[] processedRange~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'laser)))
  "Returns full string definition for message of type 'laser"
  (cl:format cl:nil "int32[] processedRange~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <laser>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'processedRange) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <laser>))
  "Converts a ROS message object to a list"
  (cl:list 'laser
    (cl:cons ':processedRange (processedRange msg))
))
