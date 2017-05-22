#1: Define mean and standard deviation of NORMAL Prior. 
Prior<-c(260,10)


#2: Collect observations
times <- c(240, 267, 308, 275, 271,
           268, 258, 295, 315, 262)

# Compute Info on Observations ybar and standard error
ybar <- mean(times)
sigma <- 20; 
se <- sigma / sqrt(10)

# Define mean and standard error: Data
Data <- c(ybar, se)

# Use normal_update() function: Posterior
Posterior <- normal_update(Prior, Data)


# function (prior, data, teach = FALSE) 
# {
#   prior <- unlist(prior)
#   prior_mean <- prior[1]
#   prior_sd <- prior[2]
#   data_mean <- data[1]
#   data_se <- data[2]
#   prior_precision <- 1/prior_sd^2
#   data_precision <- 1/data_se^2
#   post_precision <- prior_precision + data_precision
#   post_sd <- sqrt(1/post_precision)
#   post_mean <- weighted.mean(c(prior_mean, data_mean), c(prior_precision, 
#                                                          data_precision))
#   if (teach == TRUE) 
#     data.frame(Type = c("Prior", "Data", "Posterior"), Mean = c(prior_mean, 
#                                                                 data_mean, post_mean), Precision = c(prior_precision, 
#                                                                                                      data_precision, post_precision), Stand_Dev = c(prior_sd, 
#                                                                                                                                                     data_se, post_sd))
#   else c(post_mean, post_sd)
# }


# Construct plot of prior and posterior
many_normal_plots(list(Prior, Posterior))
