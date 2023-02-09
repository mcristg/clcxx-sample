#include <string>
#include "clcxx/clcxx.hpp"

class ww {
 public:
  ww() {}
  std::string greet() { return "Hello, World"; }
  
};    

class xx : public ww {
 public:
  xx(int xx, int yy) : y(yy), x(xx) {}
  xx() : y(0), x(0) {}
  std::string greet() { return "Hello, World"; }
  int y;
  int x;
};

std::string greet() { return "Hello, World"; }
int Int(int x) { return x + 100; }
float Float(float y) { return y + 100.34; }
auto gr(std::complex<float> x) { return x; }
std::string hi(char* s) { return std::string("hi, " + std::string(s)); }
void ref_int(int& x) { x += 30; }
void ref_class(xx& x) { x.y = 1000000; }

CLCXX_PACKAGE TEST(clcxx::Package& pack) {
  pack.defclass<ww, false>("ww")
      .defmethod("foo", F_PTR(&ww::greet))
      .constructor<>();
  pack.defun("hi", F_PTR(&hi));
  pack.defun("test-int", F_PTR(&Int));
  pack.defun("greet", F_PTR(&greet));
  pack.defun("test-float", F_PTR(&Float));
  pack.defun("test-complex", F_PTR(&gr));
  pack.defun("ref-int", F_PTR(&ref_int));
  pack.defun("ref-class", F_PTR(&ref_class));
  pack.defclass<xx, true>("xx", "ww")
      .member("y", &xx::y)
      .defmethod("foo", F_PTR(&xx::greet))
      .constructor<int, int>();
}
