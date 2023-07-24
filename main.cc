#include <iostream>
#include <nix/config.hh>

// this line produces an error about missing "util.hh"
#include <nix/value.hh>

int main() {
  std::cout << "Hello, world!" << std::endl;
  return 1;
}
