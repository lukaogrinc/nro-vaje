#include <iostream>
#include <cmath>

using namespace std;

double arkus(double x, double n) {
    double result = 0;

    for (int i = 0; i < n; i++) {
        result += pow(-1, i) * pow(x, 2 * i + 1) / (2 * i + 1);
    }

    return result;
}

int main() {
    double a = 0;
    double b = M_PI_4;

    int tocke = 1000;
    double xi[tocke];

    for (int i = 0; i < tocke; i++) {
        xi[i] = static_cast<double>(i) * M_PI / (4 * (tocke-1));
    }

    double suma = 0;
    for (int i = 1; i < tocke-1; i++) {
        suma += exp(3 * xi[i]) * arkus(xi[i] / 2, 10);
    }

    double integral = (b - a) / (2 * tocke)*(2 *suma +exp(3 * a) * arkus(a / 2, 10)+exp(3 * b) * arkus(b / 2, 10)); 
    
   
    std::cout << integral << std::endl;

    return 0;
}