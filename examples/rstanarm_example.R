# A Simple example using rstanarm
# M. Espe
# Mar 2018

library(rstanarm)

# Use the exact same data and priors as the rstan example
fit = stan_glm(data_list$y ~ data_list$X,
               # prior = normal(0,2),
               # prior_intercept = normal(20, 5),
               iter = 1000)

print(fit, probs = c(0.05, 0.95))
plot(fit)
