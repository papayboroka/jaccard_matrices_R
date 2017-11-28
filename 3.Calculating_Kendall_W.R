#library('irr')

# Calculating rank order within the rows of jaccard matrices of workgroups
# using Kendall W
counter=0
for (j in 1:length(networklist)) {
  counter=counter+1
  byrow=c()
  for (i in jaccard_matrix_namelist) {
    table=eval(parse(text=i))
    row <- table[counter,]
    byrow=rbind(byrow,row)
  }
  number=kendall(t(byrow), TRUE)
  print(networklist[counter])
  print(number)
}