f <- function(x){
	z <- -5*(1/256 * x^4 - 1/16);
	return (z);
	}

# 1. Wahrscheinlichkeitsdichtefunktion -> Integral über f(x) muss 1 sein
# Grenzen ergeben sich aus dem Maximalradiuus zu -2, 2

integrate(f, -2, 2);

# 2. Wahrscheinlichkeit zur Detektion: Auftreffen der Photonen im Radius des 
# Detektorelements -> -1, 1

n = integrate(f, -1, 1)$value;
n; 

# 3. 

(10^5)/n