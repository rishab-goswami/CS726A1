;; Auto-generated. Do not edit!


(when (boundp 'assignment_1::bumper)
  (if (not (find-package "ASSIGNMENT_1"))
    (make-package "ASSIGNMENT_1"))
  (shadow 'bumper (find-package "ASSIGNMENT_1")))
(unless (find-package "ASSIGNMENT_1::BUMPER")
  (make-package "ASSIGNMENT_1::BUMPER"))

(in-package "ROS")
;;//! \htmlinclude bumper.msg.html


(defclass assignment_1::bumper
  :super ros::object
  :slots (_bumper ))

(defmethod assignment_1::bumper
  (:init
   (&key
    ((:bumper __bumper) 0)
    )
   (send-super :init)
   (setq _bumper (round __bumper))
   self)
  (:bumper
   (&optional __bumper)
   (if __bumper (setq _bumper __bumper)) _bumper)
  (:serialization-length
   ()
   (+
    ;; int32 _bumper
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _bumper
       (write-long _bumper s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _bumper
     (setq _bumper (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get assignment_1::bumper :md5sum-) "6d6f918bdf3f8c0d7fc9d69d24c5a14f")
(setf (get assignment_1::bumper :datatype-) "assignment_1/bumper")
(setf (get assignment_1::bumper :definition-)
      "int32 bumper

")



(provide :assignment_1/bumper "6d6f918bdf3f8c0d7fc9d69d24c5a14f")


