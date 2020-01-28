data {
  int<lower=0> M;
  int<lower=0> J;
  int<lower=0, upper=J> y[M] ; // y is a length-M vector of integers
}
parameters {
  real<lower=0, upper=1> p ;
  real<lower=0, upper=1> psi;
  vector[M] z;
}
model {
  p ~  uniform(0, 1);
  psi ~ uniform(0, 1); 
  z ~ binomial(M, psi); 
  for (i in 1:M){
    y[i] ~ binomial(J, p*z[i]); 
 }
}
