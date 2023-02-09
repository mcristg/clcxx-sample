(cl:when (not (cl:find-package "TEST"))
  (cl:make-package "TEST")
  (cl:use-package 'cl 'test))
(cl:in-package :test)

(import 'cxx::cxx-ptr)
(export 'cxx-ptr)

(progn
 (defclass ww nil
           ((cxx::cxx-class-ptr :accessor cxx-ptr :initarg :cxx-ptr :initform
             (cxx::required "Use Class constructor function.")))
           (:documentation "Cxx class stored in lisp"))
 (export 'ww)
 (defparameter *destruct-ww-ptr* nil)
 (export 'destruct-ww)
 (defun destruct-ww (cxx::class-ptr)
   "delete class"
   (if (not (cffi-sys:null-pointer-p cxx::class-ptr))
       (cffi:foreign-funcall-pointer *destruct-ww-ptr* nil :pointer
                                     cxx::class-ptr :void)))
 nil) 
(progn
 (defclass xx nil
           ((cxx::cxx-class-ptr :accessor cxx-ptr :initarg :cxx-ptr :initform
             (cxx::required "Use Class constructor function.")))
           (:documentation "Cxx class stored in lisp"))
 (export 'xx)
 (defparameter *destruct-xx-ptr* nil)
 (export 'destruct-xx)
 (defun destruct-xx (cxx::class-ptr)
   "delete class"
   (if (not (cffi-sys:null-pointer-p cxx::class-ptr))
       (cffi:foreign-funcall-pointer *destruct-xx-ptr* nil :pointer
                                     cxx::class-ptr :void)))
 (progn
  (export 'create-xx)
  (defparameter *xx-default-constructor-ptr* nil)
  (defun create-xx (&optional (class nil) &rest rest)
    "create class with defualt constructor"
    (let* ((cxx::ptr
            (cffi:foreign-funcall-pointer *xx-default-constructor-ptr* nil
                                          :pointer))
           (cxx::initargs (append '(:cxx-ptr) (list cxx::ptr)))
           (cxx::ename-class
            (if class
                class
                'xx)))
      (when rest (setf cxx::initargs (append rest cxx::initargs)))
      (let ((cxx::obj
             (handler-case
              (apply #'make-instance cxx::ename-class (values cxx::initargs))
              (error (cxx::err) (destruct-xx cxx::ptr) (error cxx::err)))))
        (trivial-garbage:finalize cxx::obj (lambda () (destruct-xx cxx::ptr)))
        cxx::obj))))) 
(progn
 (export 'foo)
 (defparameter *foo-func-ptr* nil)
 (defmethod foo ((cxx::obj ww))
   (cffi:foreign-funcall-pointer *foo-func-ptr* nil :pointer (cxx-ptr cxx::obj)
                                 :string))) 
(progn
 (export 'create-ww0)
 (defparameter *create-ww0-func-ptr* nil)
 (defun create-ww0 (&optional (class nil) &rest rest)
   (let* ((cxx::ptr
           (cffi:foreign-funcall-pointer *create-ww0-func-ptr* nil :pointer))
          (cxx::initargs (append '(:cxx-ptr) (list cxx::ptr)))
          (cxx::ename-class
           (if class
               class
               'ww)))
     (when rest (setf cxx::initargs (append rest cxx::initargs)))
     (let ((cxx::obj
            (handler-case
             (apply #'make-instance cxx::ename-class (values cxx::initargs))
             (error (cxx::err) (destruct-ww cxx::ptr) (error cxx::err)))))
       (trivial-garbage:finalize cxx::obj (lambda () (destruct-ww cxx::ptr)))
       cxx::obj)))) 
(progn
 (export 'hi)
 (defparameter *hi-func-ptr* nil)
 (defun hi (v0)
   (cffi:foreign-funcall-pointer *hi-func-ptr* nil :string v0 :string))) 
(progn
 (export 'test-int)
 (defparameter *test-int-func-ptr* nil)
 (defun test-int (v0)
   (cffi:foreign-funcall-pointer *test-int-func-ptr* nil :int32 v0 :int32))) 
(progn
 (export 'greet)
 (defparameter *greet-func-ptr* nil)
 (defun greet () (cffi:foreign-funcall-pointer *greet-func-ptr* nil :string))) 
(progn
 (export 'test-float)
 (defparameter *test-float-func-ptr* nil)
 (defun test-float (v0)
   (cffi:foreign-funcall-pointer *test-float-func-ptr* nil :float v0 :float))) 
(progn
 (export 'test-complex)
 (defparameter *test-complex-func-ptr* nil)
 (defun test-complex (v0)
   (cffi:foreign-funcall-pointer *test-complex-func-ptr* nil :pointer v0
                                 :pointer))) 
(progn
 (export 'ref-int)
 (defparameter *ref-int-func-ptr* nil)
 (defun ref-int (v0)
   (cffi:foreign-funcall-pointer *ref-int-func-ptr* nil :pointer v0 :void))) 
(progn
 (export 'ref-class)
 (defparameter *ref-class-func-ptr* nil)
 (defun ref-class (v0)
   (cffi:foreign-funcall-pointer *ref-class-func-ptr* nil :pointer v0 :void))) 
(progn
 (export 'y.get)
 (defparameter *y.get-func-ptr* nil)
 (defmethod y.get ((cxx::obj xx))
   (cffi:foreign-funcall-pointer *y.get-func-ptr* nil :pointer
                                 (cxx-ptr cxx::obj) :int32))) 
(progn
 (export 'y.set)
 (defparameter *y.set-func-ptr* nil)
 (defmethod y.set ((cxx::obj xx) v0)
   (cffi:foreign-funcall-pointer *y.set-func-ptr* nil :pointer
                                 (cxx-ptr cxx::obj) :int32 v0 :void))) 
(progn
 (export 'foo)
 (defparameter *foo-func-ptr* nil)
 (defmethod foo ((cxx::obj xx))
   (cffi:foreign-funcall-pointer *foo-func-ptr* nil :pointer (cxx-ptr cxx::obj)
                                 :string))) 
(progn
 (export 'create-xx2)
 (defparameter *create-xx2-func-ptr* nil)
 (defun create-xx2 (v0 v1 &optional (class nil) &rest rest)
   (let* ((cxx::ptr
           (cffi:foreign-funcall-pointer *create-xx2-func-ptr* nil :int32 v0
                                         :int32 v1 :pointer))
          (cxx::initargs (append '(:cxx-ptr) (list cxx::ptr)))
          (cxx::ename-class
           (if class
               class
               'xx)))
     (when rest (setf cxx::initargs (append rest cxx::initargs)))
     (let ((cxx::obj
            (handler-case
             (apply #'make-instance cxx::ename-class (values cxx::initargs))
             (error (cxx::err) (destruct-xx cxx::ptr) (error cxx::err)))))
       (trivial-garbage:finalize cxx::obj (lambda () (destruct-xx cxx::ptr)))
       cxx::obj)))) 