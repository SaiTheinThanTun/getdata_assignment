##Creating codebook for HAR_clean.txt
##First, you need to run "run_analysis.R" on UCI HAR Dataset (Samsung dataset)
sum <- summary(HAR_clean) #Gets summaries for all var in HAR_clean
minmax <- sum[c(1,6),] #Selects only Min, and Max values

#Creating a new vector to show the width of variables
HAR_clean[,2] <- as.numeric(HAR_clean[,2])
maxchar <- numeric(81)
for(i in 1:81){
  maxchar[i] <- max(nchar(HAR_clean[,i]))
}
maxchar.name <- rep("Width of variable :",81)
var.wid <- paste(maxchar.name,maxchar)

##Another way of getting maxchar
#var <- 1:81
#maxchar <- sapply(nvar, function(x) {
#  y <<- x 
#  max(nchar(HAR_clean[,y]))
#  })
codebook <- rbind(minmax,var.wid,deparse.level=0)
#rownames(codebook) <- c("","","") # deparse.level was added to overcome this.
write.table(codebook,"CodeBook.txt")

#If a transposed codebook is required, use the following:
codebookT <- t(codebook)
write.table(codebookT,"CodeBookTransposed.txt")
