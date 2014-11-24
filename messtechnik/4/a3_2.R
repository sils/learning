# Aufgabe 3.2

# Einlesen der Daten 
data <- read.table(file = "messung.txt")
source("stichprobe.R")

vec1 <- 1:100
for(m in 1:100){
	p = stichprobe(10, data);
	vec1[m] <- var(p);
	}

hist(vec1)

# Die Varianz folgt im Gegensatz zum Mittelwert nicht der Normalverteilung.