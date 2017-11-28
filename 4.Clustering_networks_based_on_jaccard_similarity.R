# We calculate an average of the jaccard matrices
jaccardaverage=(A_ajaccardok+A_bjaccardok+B_ajaccardok+B_bjaccardok)/4


# Creating a distance matrix
jaccardaverage = 1 - jaccardaverage
cluster_model=hclust(as.dist(jaccardaverage), method='complete')
# visualizing cluster
plot(cluster_model)
#extract clusters
groups<-cutree(cluster_model, k=3)
jaccardaveragecluster<-cbind(jaccardaverage,groups)

x1<- subset(jaccardaveragecluster, groups==1)
x2<- subset(jaccardaveragecluster, groups==2)
x3<- subset(jaccardaveragecluster, groups==3)

# extracting the network names in the clusters
x1namelist <-row.names(x1)
x2namelist <-row.names(x2)
x3namelist <-row.names(x3)


