##Find Alpha and Beta using the beta.select function:
##This function returns your A and B from a binominal distribution given two Quantile/X pairs: 

# Quantile 1==@.2--the user believe X to be .5
quantile1 <- list(p = 0.2, x = 0.50)

# Quantile 2==@.8, the user believes X to be .9:
quantile2 <- list(p = .8, x = 0.9)

# Find the beta shape parameters matching the two quantiles: ab
ab <- beta.select(quantile1,quantile2)

print(ab)


function (quantile1, quantile2) 
{
  betaprior1 = function(K, x, p) {
    m.lo = 0
    m.hi = 1
    flag = 0
    while (flag == 0) {
      #continues to adjust M0 which is a combiniton of m.lo and m.hi until p ==p0
      m0 = (m.lo + m.hi)/2
      ##At this point, we're trying to get P0 and P
      ## pbeta(q, shape1, shape2,K*.5,,5
      p0 = pbeta(x, K * m0, K * (1 - m0))
      if (p0 < p) 
        m.hi = m0
      else m.lo = m0
      if (abs(p0 - p) < 1e-04) 
        flag = 1
    }
    return(m0)
  }
  p1 = quantile1$p
  x1 = quantile1$x
  p2 = quantile2$p
  x2 = quantile2$x
  logK = seq(-3, 8, length = 100)
  K = exp(logK)
  #Returns vector K from betaprior(k,x1,p1)
  m = sapply(K, betaprior1, x1, p1)
  prob2 = pbeta(x2, K * m, K * (1 - m))
  ind = ((prob2 > 0) & (prob2 < 1))
  app = approx(prob2[ind], logK[ind], p2)
  K0 = exp(app$y)
  m0 = betaprior1(K0, x1, p1)
  return(round(K0 * c(m0, (1 - m0)), 2))
}
