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

pdf("3.3.pdf")
plot(1:100, varianz, type = 'l')
dev.off()

# 3.3.6: 
# Mit zunehmender Stichprobengroesse sinkt die Varianz der
# Stichprobenmittelwerte.

# Daher ist die Schaetzfunktion erst ab einer Stichprobengroesse von ungefaehr
# 40 (siehe Plot) eine gute Schaetzung des Mittelwertes.

# Die Messwerte sind unabhaengig voneinander.
