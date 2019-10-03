#include "libhello/hello.hpp"

#include <iostream>

auto main() -> int {

  size_t n = 5;

  std::cout << "Roll " << n << " dices:\n";

  for(auto r : libhello::dices(n))
    std::cout << +r << "\n";

}