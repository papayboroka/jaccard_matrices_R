filter_graph <- function(df, var_name, vertice_list){
  df <- df[df$network_id %in% c(var_name),]
  graph <- graph.data.frame(df, vertices = vertice_list)
  return(graph)
}