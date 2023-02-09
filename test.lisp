;;;(load "~/dev/03-clcxx/sample/test.lisp")

(ql:quickload :cffi)
(ql:quickload :trivial-garbage)

(pushnew "~/dev/03-clcxx/cl-cxx/" asdf:*central-registry*)
(asdf:oos 'asdf:load-op :cxx)

(cffi:load-foreign-library "~/.local/lib/libClCxx.so")
(cffi:load-foreign-library "~/.local/lib/libtest.so")

#|
(cffi:load-foreign-library "/home/martin/.local/lib/libclcxx.so")
(cffi:load-foreign-library "/home/martin/.local/lib/libtest.so")

(cxx:init)
(cxx:add-package "TEST" "TEST")

(cxx:init-generate-lisp-code "/home/martin/dev/03-clcxx/sample/cxx-test.lisp" "test")
(cxx:add-package "TEST" "TEST")


;(test:greet)

;(test:hi "Cxx")
;(test:test-float 12.34)

(cxx::remove-c-package "TEST")
(cxx:remove-package "TEST")
(cffi:close-foreign-library 'my-lib)

|#



(load "~/dev/03-clcxx/sample/cxx-test.lisp")
(cxx:init-cxx-wrap-ptr)
(cxx:add-package "TEST" "TEST")

#|
(defvar x1 (test:create-xx))

(defvar x1 (test:create-xx2 12 32))
(test:foo x1)
(test:y.get x1)
(test:y.set x1 50)

(defclass yy (test:xx)
           ((a1 :accessor a :initarg :a
             :initform nil)
            (b1 :accessor b :initarg :b
             :initform nil)))

(defvar y1 (test:create-xx 'yy :a 25 :b 199))

(defvar y1 (test:create-xx2 12 32 'yy :a 25 :b 199))

(a y1)
(b y1)

(test:foo y1)
(test:y.get y1)
(test:y.set y1 50)



|#

