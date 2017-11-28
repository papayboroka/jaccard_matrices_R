
#Using multiple networks (represented as matrices) for the same workgroup, 
#we aggregate the selected networks into one binary matrix, based on the 
#number of edges between two nodes in the networks

#this time, it is executed on one cluster generated earlier


############second cluster
actual_network = c()
clusternames_by_group=c()
counter=0
#iterating through the workgroups
for (i in list_of_organizational) {
  print(i)
  counter=counter+1
  # selecting the actual network from the edgelist of the workgroup
  actual_network <- NULL
  actual_network <- networks[networks$group==i,]
  actual_network <- actual_network[3:5]
  companyattributes <- attributes[attributes$group==i,]
  every_employee <- sort(unique(companyattributes$respondent))
  # creating an empty matrix
  aggregated_graph<-data.frame(matrix(0, nrow=length(every_employee), ncol=length(every_employee)))
  colnames(aggregated_graph)=every_employee
  row.names(aggregated_graph)=every_employee
  zcounter=0
  #  Iterating through the networks and adding them together
  for (z in x2namelist){
    zcounter=zcounter+1
    workinggraph2 <- filter_graph(actual_network, z, every_employee)
    node_names <- V(workinggraph2)$name
    if (!is.null(node_names)){
      workinggraph2 <- as.matrix(get.adjacency(workinggraph2))
      workinggraph2 <- as.data.frame(workinggraph2)
      #print(workinggraph2)
      ycounter=0
      aggregated_graph=aggregated_graph+workinggraph2
    }
    # creating a binary matrix based on the values of the aggregated_graph
    by_workgroup<-aggregated_graph
    by_workgroup[by_workgroup<=2] <- 0
    by_workgroup[by_workgroup>2] <- 1
    assign(paste(i,'X2network',sep=''),by_workgroup)
    clusternames_by_group[counter]=(paste(i,'X2network',sep=''))
  }
}
