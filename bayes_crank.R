##Thist first example is for generating all of the values for the Bayesian Crank. This is a function in the Teach Bayes library which calculates the Posterior based on the Prior and the Likelihood. It also includes the vector P which contains all of the possible values. In this case, only five values are possible, .1-.5
# Define the values of the proportion: P. These are Discrete, which will rarely be the case, but it is helpful.
P <- c(0.1, 0.2, 0.3, 0.4, 0.5)

# Define a Prior:
Prior <- c(0.3, 0.3, 0.2, 0.1, 0.1)

# Compute the likelihoods: Likelihood
Likelihood <- dbinom(8, size = 20, prob = P)

# Create Bayes data frame: bayes_df
bayes_df <- data.frame(P, Prior, Likelihood)
print(bayes_df)
# Compute and print the posterior probabilities: bayes_df
bayes_df <- bayesian_crank(bayes_df)

#Bayesian Crank is fairly simple--just the Prior*Likelihood/Sum of Product:
# function (d) 
# {
#   d$Product <- d$Likelihood * d$Prior
#   d$Posterior <- d$Product/sum(d$Product)
#   d
# }

# Graphically compare the prior and posterior
prior_post_plot(bayes_df)


print(bayes_df)
