# Calculate jaccard indexes for each organization

# generating a list that contains the name of the existing  networks
networklist=unique(networks$network_id)
# generating a list with unique organization ID-s
list_of_organizational = unique(attributes$group)
# creating an empty vector for 
actual_network = c()
jaccard_matrix_namelist= c()
# first, iterating through the working groups
for (i in list_of_organizational) {
  print(i)
  # selecting the edgelist for the organizational group as the actual network
  actual_network <- NULL
  actual_network <- networks[networks$group==i,]
  actual_network <- actual_network[3:5]
  companyattributes <- attributes[attributes$group==i,]
  # selecting the total list of employees from the attibutes file 
  every_employee <- sort(unique(companyattributes$respondent))
  zcounter=0
  jaccards=c()
  # iterating through the networks for each working group
  for (z in networklist){
    zcounter=zcounter+1
    # selecting the network as a graph object from the actual_network dataframe
    # with 'every_employee', we make sure that every node is in the network
    workinggraph2 <- filter_graph(actual_network, z, every_employee)
    node_names <- V(workinggraph2)$name
    # calculating the jaccard indexes between each network, putting them in one single row for each network 
    jaccardrow=c()
    if (!is.null(node_names)){
      workinggraph2 <- as.matrix(get.adjacency(workinggraph2))
      ycounter=0
      for (y in networklist) {
        ycounter=ycounter+1
        workinggraph <- filter_graph(actual_network, y, every_employee)
        node_names <- V(workinggraph)$name
        if (!is.null(node_names)){
          workinggraph <- as.matrix(get.adjacency(workinggraph))
          jc = jaccard(workinggraph, workinggraph2)
        } else {
          jc=0
        }
        jaccardrow[ycounter]=jc
      }
    } else {
      jaccardrow <- rep(0, length(networklist))
    }
    # putting the rows into one matrix. One matrix for each workgroup
    jaccards=rbind(jaccards,jaccardrow)
    colnames(jaccards)=networklist
    
  }
  row.names(jaccards)=networklist
  assign(paste(i,'jaccardok',sep=''),jaccards)
  jaccard_matrix_name=(paste(i,'jaccardok',sep=''))
  jaccard_matrix_namelist[i] = jaccard_matrix_name
}
