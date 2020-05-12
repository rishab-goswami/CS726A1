; Auto-generated. Do not edit!


(cl:in-package assignment_1-msg)


;//! \htmlinclude bumper.msg.html

(cl:defclass <bumper> (roslisp-msg-protocol:ros-message)
  ((bumper
    :reader bumper
    :initarg :bumper
    :type cl:integer
    :initform 0))
)

(cl:defclass bumper (<bumper>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <bumper>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'bumper)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignment_1-msg:<bumper> is deprecated: use assignment_1-msg:bumper instead.")))

(cl:ensure-generic-function 'bumper-val :lambda-list '(m))
(cl:defmethod bumper-val ((m <bumper>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignment_1-msg:bumper-val is deprecated.  Use assignment_1-msg:bumper instead.")
  (bumper m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <bumper>) ostream)
  "Serializes a message object of type '<bumper>"
  (cl:let* ((signed (cl:slot-value msg 'bumper)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <bumper>) istream)
  "Deserializes a message object of type '<bumper>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bumper) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<bumper>)))
  "Returns string type for a message object of type '<bumper>"
  "assignment_1/bumper")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'bumper)))
  "Returns string type for a message object of type 'bumper"
  "assignment_1/bumper")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<bumper>)))
  "Returns md5sum for a message object of type '<bumper>"
  "6d6f918bdf3f8c0d7fc9d69d24c5a14f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'bumper)))
  "Returns md5sum for a message object of type 'bumper"
  "6d6f918bdf3f8c0d7fc9d69d24c5a14f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<bumper>)))
  "Returns full string definition for message of type '<bumper>"
  (cl:format cl:nil "int32 bumper~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'bumper)))
  "Returns full string definition for message of type 'bumper"
  (cl:format cl:nil "int32 bumper~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <bumper>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <bumper>))
  "Converts a ROS message object to a list"
  (cl:list 'bumper
    (cl:cons ':bumper (bumper msg))
))
