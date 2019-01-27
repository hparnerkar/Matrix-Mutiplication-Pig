# Matrix-Mutiplication-Pig

The purpose of this project is to develop a simple program for matrix multiplication using Apache Pig.

 sparse matrix M is represented as a dataset of triples (i,j,v) so that M[i,j]=v. Missing entries are assumed to have a zero value. The Pig schema for such triple is ( I: long, J: long, V: double ). For example, the matrix:

1,0,3.0
0,0,5.0
1,2,-2.0
2,0,9.0
0,1,-3.0
0,2,-1.0
1,1,8.0
2,1,4.0
represents the 3x3 matrix:
5.0  -3.0  -1.0
3.0   8.0  -2.0
9.0   4.0   0.0
The multiplication of two matrices M and N is a matrix P such that Pij=sumkMik*Nkj. It can be done using the following SQL query:
select M.I, N.J, SUM( M.V * N.V )
from M, N
where M.J = N.I
group by M.I, N.J
