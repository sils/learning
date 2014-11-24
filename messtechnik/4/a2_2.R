source("a2_1.R")

g <- function(y){
	z <- 1/2 * exp(-y/2);
	return(z);
	}

# 1. gemeinsame Wahrscheinlichkeitsdichtefunktion ist das Produkt beider Funktionen
fg <-  function(x, y){
	z <- f(x)*g(y);
	return (z);
	} 

# 2. für m = 2

x = seq(-2, 2)
y = seq(0, 2)
res = outer(x, y, fg)

persp(x, y, res, col = 'blue');
