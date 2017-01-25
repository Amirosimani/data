source_file = read.csv(file.choose(), sep = ",", header = F)

library(reshape)

Matrix2Edge <- function(x){
  final <- data.frame("a"=character(),"b"=character())
  for (i in 1:(ncol(x)-1)){
    id = paste("V", i, sep="")
    edge_list <- melt(x, id = (id))
    x[id] <- NULL
    keeps <- c(id, "value")
    edge_list <- edge_list[keeps]
    colnames(edge_list) <- colnames(final)
    final <- rbind(final,edge_list)
  }
  final <- final[!(final$b=="" | final$b==" "),]
  return(final)
}

edge_list <- Matrix2Edge(source_file)
