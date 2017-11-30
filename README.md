

# jaccard_matrices_R

Following the method described in:
> Vörös, A. (2015). The emergence of multiple status systems in adolescent communities: a multiplex network theory of group formation (Doctoral dissertation, University of Oxford).

## Expected libraries
```
library('statnet')
library('ergm')
library('readr')
library('igraph')
library('intergraph')
library('plyr')
library('MASS')
library('gtools')
library('irr')

```
## Expected data structures

You can also check the test datasets
### Networks

Networks are expected as edge lists. For all the companies (schools or other units), all the work groups (school classes or any type of groups), for all the directed networks within one table.
Calculations are usually done by workgroups. 

Dataframe should look like the following:

Read csv by the following command: `file <- read.csv(...)`

```
company	group	respondent	nominated_person	network_id
A   	  Ac  	A01	        A14	              friend
A   	  Ac	  A02	        A08	              friend
A   	  Ac	  A01	        A14	              admired
A   	  Ad	  A25	        A14	              friend
...
B   	  Bc  	Bc01	        Bc14	          friend
B   	  Bc	  Bc02	        Bc08	          friend
B   	  Bc	  Bc01	        Bc14	          admired
B   	  Bd	  Bd12	        Bd22	          friend
```
### Attributes
Dataframe with the following columns:
```
respondent  group org
```
and any other attribute


## 1. Functions
### 1.1. Jaccard function
Calculating jaccard index of two directed matrices within a function 

### 1.2. Selecting network function
A function that generates a graph object from an edgelist based on a network's name. The function generates the whole set of nodes, regardless of where the edges are, based on the attributes file. 

## 2. Calculating jaccard matrices
Iterate over all the data, calculate jaccard indexes for each matrix pair using the previous function. Generate matrices from the jaccard indexes

## 3. Calculating Kendall W on jaccard matrices
For the jaccard matrices generated earlier, calculates Kendall W by row, to see, which networks (represented by rows) are behaving consistently within the workgroups. 

## 4. Clustering networks based on jaccard similatrities
Using the jaccard matrices generated earlier, we generate a distance matrix. The distance matrix is used to (hierarchically) cluster the networks.  

## 5. Aggregating multiple networks into binary matrices
Using multiple networks (represented as matrices) for the same workgroup, we aggregate the selected networks into one binary matrix, based on the number of edges between two nodes in the networks. 
