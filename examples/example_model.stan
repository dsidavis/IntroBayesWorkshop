/* Example Stan model
   M. Espe
   Mar 2018
*/


data{
  int N;
  int K;
  matrix[N, K] X;
  vector[N] y;
}

parameters{
  real alpha;
  vector[K] beta;
  real<lower = 0> sigma;
}

model{
  alpha ~ normal(40,10);
  //target += normal_lpdf(y | X * beta + alpha, sigma);
  y ~ normal(X * beta + alpha, sigma);
}
