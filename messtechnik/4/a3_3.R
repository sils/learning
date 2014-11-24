# Aufgabe 3.3

data <- read.table(file = "messung.txt")
source("stichprobe.R")

varianz <- 1:100
mw <- 1:100

for (n in 1:100){
	for(m in 1:100){
		p = stichprobe(n, data);
		mw[m] = mean(p);
	}
	varianz[n] = var(mw)
}

plot(1:100, varianz, type = 'l')

# 3.3.6: 