[# R-programing-
## Vectors
### 1. Creating Vectors 
```
c(2.4.6) # Join element into vector 
2:6 # An integer sequence 
seq(2,3, by=0.5 # A complex sequence
rep(1:2, times=3) # Repeat a vector
rep(1:2, each=3) # Repeat elements of vector
```
### 2. Vector Functions 
```
sort(x) # Return x sorted
rev(x) # return x reversed
table(x) # see counts of values
unique(x) # see unique values
```
### 3. Selecting Vector element 
--- By position
```
x[4] #The fourth element
x[-4] # All but the fourth
x[2:4] # Element two to four
x[-(2:4)] # all elements except two to four
x[c(1,5)] # Elements one and five
```
---By value 
```
x[x == 10] # Element which are equal to 10
x[x< 0] # All element less than zero
x[x %in% c(1,2,5)] # elements in the set 1,2,5
```
---Named Vector 
```
x['Bryan'] # Element with name ' Bryan'
```
### 4. Programming 
---For loop 
