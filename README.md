

# jaccard_matrices_R


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
library('Kendall')
```
## Expected data structures

### Networks

Networks are expected as edge lists. For all the companies (schools or other units), all the work groups (school classes or any type of groups), 
for all the directed networks within one table.

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


## 2. Calculating jaccard matrices
Iterate over all the data, calculate jaccard indexes for each matrix pair using the previous function. Generate matrices from the jaccard indexes

## 3. Calculating Kendall W on jaccard matrices

## 4. Clustering networks based on jaccard similatrities

## 5. Aggregating multiple networks into binary networks
