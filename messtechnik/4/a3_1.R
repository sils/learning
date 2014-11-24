# Aufgabe 3.1

# Einlesen der Daten 
data <- read.table(file = "messung.txt")
source("stichprobe.R")
# 3.1

vec1 <- 1:100
for(m in 1:100){
	p = stichprobe(10, data);
	vec1[m] <- mean(p);
	}

hist(vec1)

# aus dem Histogramm erkennbar -> der Mittelwert ist normalverteilt