# Prints nucleotide diversity and standard deviation of pairwise nucleotide diversity values on shell.

# Takes the argument which is the file name of the IBS matrix.
args <- commandArgs(trailingOnly = T)
nuc_div_data <- read.table(args[1], sep = "\t")


dist_v <- c() 

# columns of the distance matrix file is traversed to concanate them in a vector
# if the value is larger than almost 0.
for (i in colnames(nuc_div_data)){
  
  dist_col <- c()
  dist_col <- nuc_div_data[,i]
  
  dist_v <- c(dist_v, dist_col[dist_col > 0.0000000001])
}


# library(ggplot2)

dist_v <- data.frame(dist_v)

# summary(dist_v)
print(args[1])
# print(paste("mean: ", mean(dist_v$dist_v) * (length(row.names(nuc_div_data)) / (length(row.names(nuc_div_data)) - 1))))
print(paste("mean: ", mean(dist_v$dist_v)))
std_str1 <- paste("std: ", var(dist_v$dist_v) ^ (1/2))
# std_str2 <- paste("     SE: ", (var(dist_v$dist_v) ^ (1/2)) / (length(colnames(nuc_div_data)) ^ (1/2)))
# print(paste(std_str1, std_str2))
print(std_str1)
print("----------------------------------")

# ggplot(dist_v, (aes(dist_v))) + geom_density()

# qqnorm(dist_v$dist_v, pch = 1, frame = FALSE)
# qqline(dist_v$dist_v, col = "steelblue", lwd = 2)