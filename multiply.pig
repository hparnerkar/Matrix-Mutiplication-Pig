Nmat = LOAD 'N-matrix-large.txt' USING PigStorage(',') AS (row,column,value:double);
Mmat = LOAD 'M-matrix-large.txt' USING PigStorage(',') AS (row,column,value:double);
JoinMN = JOIN Mmat BY column FULL OUTER, Nmat BY row;
multi = FOREACH JoinMN GENERATE Mmat::row AS r, Nmat::column AS c, (Mmat::value)*(Nmat::value) AS value;
grp = GROUP multi BY (r, c);
result = FOREACH grp GENERATE group.$0 as row, group.$1 as col, SUM(multi.value);
STORE result INTO 'output' USING PigStorage(',');
