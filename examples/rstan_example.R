# A Simple example using rstan and a .stan file
# M. Espe
# Mar 2018

library(rstan)
source("prep_data.R")

# Don't use all cores for hyperthreaded CPUs
options(mc.cores = parallel::detectCores()/2)
fit2 = stan(file = "examples/example.stan", data = data_list,
           iter = 1000)

print(fit2, probs = c(0.05, 0.95))
plot(fit)
