#include <iostream>
#include <vector>

int main (int argc, char *argv[]) {
    std::cout << "hello\n";
    std::vector<int> a;
    a.push_back(1);
    a.push_back(2);
    for(auto data : a) {
        std::cout << data << std::endl;
    }
    return 0;
}
