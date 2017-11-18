# Expected data structures
## Networks

Networks are expected as edge lists. FOr all the companies (schools or other units), all the work groups (school classes or any type of groups), 
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
