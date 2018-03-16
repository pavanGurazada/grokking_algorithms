#define ARMA_64BIT_WORD
#include <RcppArmadillo.h>

using std::random_device;
using std::mt19937;
using std::normal_distribution;
using std::exp;
using std::sqrt;
using std::max;

// [[Rcpp::depends(RcppArmadillo)]]
// [[Rcpp::plugins(cpp11)]]

double randn() {
  static random_device rd;
  static mt19937 gen(rd());
  
  static normal_distribution<double> d(0.0, 1.0);
  
  double res = d(gen);
  
  return res;
}


// [[Rcpp::export]]
double monte_carlo_price(long n_sims, double S, double K, double r,
                         double v, double T) {
  
  double S_adjust = S * exp(T * (r - 0.5 * v * v));
  double S_curr = 0.0;
  double payoff_sum = 0.0;
  
  
  for (long i = 0; i < n_sims; i++) {
    double gauss_bm = randn();
    S_curr = S_adjust * exp(sqrt(v * v * T) * gauss_bm);
    payoff_sum += max(S_curr - K, 0.0);
  }
  
  return (payoff_sum/n_sims) * exp(-r * T);
}



/*** R
monte_carlo_price(1e9, 100.0, 100.0, 0.05, 0.2, 1)
*/
