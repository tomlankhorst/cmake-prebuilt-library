#include "hello.hpp"

#include <random>

std::vector<uint8_t> libhello::dices(size_t n) {
  std::vector<uint8_t> dices(n);

  auto gen = std::mt19937(std::random_device {}());

  auto dis = std::uniform_int_distribution<>(1,6);

  std::generate(dices.begin(), dices.end(), [&dis, &gen](){
    return dis(gen);
  });

  return dices;
}
