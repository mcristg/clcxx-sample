(cl:when (not (cl:find-package "TEST"))
  (cl:make-package "TEST")
  (cl:use-package 'cl 'test))
(cl:in-package :test)

(import 'cxx::cxx-ptr)
(export 'cxx-ptr)

(progn
 (defclass ww
           nil
           ((cxx::cxx-class-ptr :accessor cxx-ptr :initarg :cxx-ptr :initform
             (cxx::required "Use Class constructor function.")))
           (:documentation "Cxx class stored in lisp"))
 (defparameter *destruct-ptr-ww* nil)
 (defun destruct-ptr-ww (cxx::class-ptr)
   "delete class pointer"
   (if (not (cffi-sys:null-pointer-p cxx::class-ptr))
       (cffi:foreign-funcall-pointer *destruct-ptr-ww*
                                     nil
                                     :pointer
                                     cxx::class-ptr
                                     :void)))
 nil) 
(progn
 (defclass xx
           nil
           ((cxx::cxx-class-ptr :accessor cxx-ptr :initarg :cxx-ptr :initform
             (cxx::required "Use Class constructor function.")))
           (:documentation "Cxx class stored in lisp"))
 (defparameter *destruct-ptr-xx* nil)
 (defun destruct-ptr-xx (cxx::class-ptr)
   "delete class pointer"
   (if (not (cffi-sys:null-pointer-p cxx::class-ptr))
       (cffi:foreign-funcall-pointer *destruct-ptr-xx*
                                     nil
                                     :pointer
                                     cxx::class-ptr
                                     :void)))
 (progn
  (defparameter *xx-default-constructor-ptr* nil)
  (defun create-xx (&optional (class ()) &rest rest)
    "create class with default constructor"
    (let* ((cxx::ptr
            (cffi:foreign-funcall-pointer *xx-default-constructor-ptr*
                                          nil
                                          :pointer))
           (cxx::initargs (append '(:cxx-ptr) (list cxx::ptr)))
           (cxx::ename-class (if class class 'xx)))
      (when rest (setf cxx::initargs (append rest cxx::initargs)))
      (let ((cxx::obj
             (handler-case
              (apply #'make-instance cxx::ename-class (values cxx::initargs))
              (error (cxx::err) (destruct-ptr-xx cxx::ptr) (error cxx::err)))))
        (trivial-garbage:finalize cxx::obj
                                  (lambda () (destruct-ptr-xx cxx::ptr)))
        cxx::obj))))) 
(progn
 (defparameter *foo-func-ptr* nil)
 (defmethod foo
            ((cxx::obj ww))
            (let* ((cxx::val
                    (cffi:foreign-funcall-pointer *foo-func-ptr*
                                                  nil
                                                  :pointer
                                                  (cxx-ptr cxx::obj)
                                                  :string+ptr))
                   (cxx::str (car cxx::val))
                   (cxx::ptr (cadr cxx::val)))
              (trivial-garbage:finalize cxx::str
                                        (lambda ()
                                          (cxx:destruct-string cxx::ptr)))
              cxx::str))) 
(progn
 (defparameter *create-ww0-func-ptr* nil)
 (defun create-ww0 (&optional (class ()) &rest rest)
   (let* ((cxx::ptr
           (cffi:foreign-funcall-pointer *create-ww0-func-ptr* nil :pointer))
          (cxx::initargs (append '(:cxx-ptr) (list cxx::ptr)))
          (cxx::ename-class (if class class 'ww)))
     (when rest (setf cxx::initargs (append rest cxx::initargs)))
     (let ((cxx::obj
            (handler-case
             (apply #'make-instance cxx::ename-class (values cxx::initargs))
             (error (cxx::err) (destruct-ptr-ww cxx::ptr) (error cxx::err)))))
       (trivial-garbage:finalize cxx::obj
                                 (lambda () (destruct-ptr-ww cxx::ptr)))
       cxx::obj)))) 
(progn
 (defparameter *hi-func-ptr* nil)
 (defun hi (v0)
   (let* ((cxx::val
           (cffi:foreign-funcall-pointer *hi-func-ptr*
                                         nil
                                         :string
                                         v0
                                         :string+ptr))
          (cxx::str (car cxx::val))
          (cxx::ptr (cadr cxx::val)))
     (trivial-garbage:finalize cxx::str
                               (lambda () (cxx:destruct-string cxx::ptr)))
     cxx::str))) 
(progn
 (defparameter *test-int-func-ptr* nil)
 (defun test-int (v0)
   (cffi:foreign-funcall-pointer *test-int-func-ptr* nil :int32 v0 :int32))) 
(progn
 (defparameter *greet-func-ptr* nil)
 (defun greet ()
   (let* ((cxx::val
           (cffi:foreign-funcall-pointer *greet-func-ptr* nil :string+ptr))
          (cxx::str (car cxx::val))
          (cxx::ptr (cadr cxx::val)))
     (trivial-garbage:finalize cxx::str
                               (lambda () (cxx:destruct-string cxx::ptr)))
     cxx::str))) 
(progn
 (defparameter *test-float-func-ptr* nil)
 (defun test-float (v0)
   (cffi:foreign-funcall-pointer *test-float-func-ptr* nil :float v0 :float))) 
(progn
 (defparameter *test-complex-func-ptr* nil)
 (defun test-complex (v0)
   (cffi:foreign-funcall-pointer *test-complex-func-ptr*
                                 nil
                                 :pointer
                                 v0
                                 :pointer))) 
(progn
 (defparameter *ref-int-func-ptr* nil)
 (defun ref-int (v0)
   (cffi:foreign-funcall-pointer *ref-int-func-ptr* nil :pointer v0 :void))) 
(progn
 (defparameter *ref-class-func-ptr* nil)
 (defun ref-class (v0)
   (cffi:foreign-funcall-pointer *ref-class-func-ptr* nil :pointer v0 :void))) 
(progn
 (defparameter *y.get-func-ptr* nil)
 (defmethod y.get
            ((cxx::obj xx))
            (cffi:foreign-funcall-pointer *y.get-func-ptr*
                                          nil
                                          :pointer
                                          (cxx-ptr cxx::obj)
                                          :int32))) 
(progn
 (defparameter *y.set-func-ptr* nil)
 (defmethod y.set
            ((cxx::obj xx) v0)
            (cffi:foreign-funcall-pointer *y.set-func-ptr*
                                          nil
                                          :pointer
                                          (cxx-ptr cxx::obj)
                                          :int32
                                          v0
                                          :void))) 
(progn
 (defparameter *foo-func-ptr* nil)
 (defmethod foo
            ((cxx::obj xx))
            (let* ((cxx::val
                    (cffi:foreign-funcall-pointer *foo-func-ptr*
                                                  nil
                                                  :pointer
                                                  (cxx-ptr cxx::obj)
                                                  :string+ptr))
                   (cxx::str (car cxx::val))
                   (cxx::ptr (cadr cxx::val)))
              (trivial-garbage:finalize cxx::str
                                        (lambda ()
                                          (cxx:destruct-string cxx::ptr)))
              cxx::str))) 
(progn
 (defparameter *create-xx2-func-ptr* nil)
 (defun create-xx2 (v0 v1 &optional (class nil) &rest rest)
   (let* ((cxx::ptr
           (cffi:foreign-funcall-pointer *create-xx2-func-ptr*
                                         nil
                                         :int32
                                         v0
                                         :int32
                                         v1
                                         :pointer))
          (cxx::initargs (append '(:cxx-ptr) (list cxx::ptr)))
          (cxx::ename-class (if class class 'xx)))
     (when rest (setf cxx::initargs (append rest cxx::initargs)))
     (let ((cxx::obj
            (handler-case
             (apply #'make-instance cxx::ename-class (values cxx::initargs))
             (error (cxx::err) (destruct-ptr-xx cxx::ptr) (error cxx::err)))))
       (trivial-garbage:finalize cxx::obj
                                 (lambda () (destruct-ptr-xx cxx::ptr)))
       cxx::obj)))) 

(export '(ww xx create-xx foo create-ww0 hi test-int greet test-float
          test-complex ref-int ref-class y.get y.set foo create-xx2))