# Aufgabe 3.2

# Einlesen der Daten 
data <- read.table(file = "messung.txt")
source("stichprobe.R")

n = 100;
vec1 <- 1:n
for(m in 1:n){
	p = stichprobe(10, data);
	vec1[m] <- var(p);
	}

hist(vec1)

# Die Varianz folgt im Gegensatz zum Mittelwert nicht der Normalverteilung.
