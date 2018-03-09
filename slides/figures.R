library(rstanarm)

prior.mu = 5
prior.s = 3

like.mu = 10
like.s = 1
like.n = 100
like = rnorm(like.n, like.mu, like.s)
prior = rnorm(like.n, prior.mu, prior.s)
post = rnorm(like.n, (prior.mu + like.mu)/2, 1.5)

png("prior_v_post.png", width = 7, height = 5, units = "in", res = 300)
plot(density(like, adjust = 2),
     xlim = c(0, 20), lty = 3,
     xlab = "Value",
     ylab = "",
     main = "Prior vs. likelihood vs posterior")
lines(density(prior, adjust = 2), lty = 2)
lines(density(post, adjust = 2), lty = 1)
legend("topright", legend = c("Prior", "Likelihood", "Posterior"),
       lty = c(2, 3, 1))
dev.off()
