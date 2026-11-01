# Same Same Different Different:  Quantifying Similarity and Difference in Parenting and Child Development

Consider the following multilevel model:

$$\text{child behavior outcome} = \beta_0 + \beta \text{parenting} + \Sigma \beta \text{covariates} + u_{0j} + u_{1j} \times \text{parenting} + e_{ij}$$

In the equation above, all of the error terms have the usual interpretations, but notably $u_{1j}$ quantifies the country specific differences in the degree to which parenting is associated with the child behavior outcome. 

Thus $\textcolor{red}{u_{1 \text{country 1}}}$ would provide information about the country specific association in country 1, while $\textcolor{blue}{u_{1 \text{country 2}}}$ would provide information about the country specific association in country 2.

There are a number of both Bayesian and frequentist methods to obtain estimates of the distribution of these country specific random effects. 

After obtaining estimates of these country specific effects, one could estimate the amount of overlap, or similarity, in these country specific random effects using the R library `overlapping`, which employs the formula below:

$$\textcolor{purple}{\eta_{overlap}} = \int min[\textcolor{red}{f(x_1)}, \textcolor{blue}{g(x_2)}] dx$$

<img src="overlap-heuristic.png" width="50%">

This formula would provide an estimate of the similarity and difference in country specific relationships of parenting and child behavior outcomes. 
