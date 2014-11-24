stichprobe <- function(n,data) {

	l <- nrow(data);
	samples =round(runif(n,1,l));
	return(data[samples,1]);
	}
