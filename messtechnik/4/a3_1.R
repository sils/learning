# Aufgabe 3.1

# Einlesen der Daten 
data <- read.table(file = "messung.txt")
source("stichprobe.R")
# 3.1

n = 100;
vec1 <- 1:n
for(m in 1:n){
	p = stichprobe(10, data);
	vec1[m] <- mean(p);
	}

pdf("3.1.pdf")
hist(vec1)
dev.off()

# aus dem Histogramm erkennbar -> der Mittelwert ist normalverteilt
