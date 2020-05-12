;; Auto-generated. Do not edit!


(when (boundp 'assignment_1::laser)
  (if (not (find-package "ASSIGNMENT_1"))
    (make-package "ASSIGNMENT_1"))
  (shadow 'laser (find-package "ASSIGNMENT_1")))
(unless (find-package "ASSIGNMENT_1::LASER")
  (make-package "ASSIGNMENT_1::LASER"))

(in-package "ROS")
;;//! \htmlinclude laser.msg.html


(defclass assignment_1::laser
  :super ros::object
  :slots (_processedRange ))

(defmethod assignment_1::laser
  (:init
   (&key
    ((:processedRange __processedRange) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _processedRange __processedRange)
   self)
  (:processedRange
   (&optional __processedRange)
   (if __processedRange (setq _processedRange __processedRange)) _processedRange)
  (:serialization-length
   ()
   (+
    ;; int32[] _processedRange
    (* 4    (length _processedRange)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _processedRange
     (write-long (length _processedRange) s)
     (dotimes (i (length _processedRange))
       (write-long (elt _processedRange i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _processedRange
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _processedRange (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _processedRange i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get assignment_1::laser :md5sum-) "e307b89be484e2eb589951f9421237f0")
(setf (get assignment_1::laser :datatype-) "assignment_1/laser")
(setf (get assignment_1::laser :definition-)
      "int32[] processedRange

")



(provide :assignment_1/laser "e307b89be484e2eb589951f9421237f0")


