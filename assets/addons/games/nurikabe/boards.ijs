NB. sample boards

fixnum=: 3 : '0&". ;._2 (0 : 0)'

n1=: fixnum''
0 1 0 0 0
0 0 0 0 2
0 0 0 0 0
3 0 0 0 0
0 0 0 2 0
)

n2=: fixnum''
0 0 0 0 2
0 0 2 0 0
0 0 0 0 0
0 0 2 0 0
2 0 0 0 0
)

n3=: fixnum''
0 0 0 0 0
3 0 0 0 0
0 1 0 2 0
0 0 0 0 5
0 0 0 0 0
)

n4=: fixnum''
0 5 0 0 2
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
2 0 0 1 0
)

n5=: fixnum''
0 0 1 0 5
0 0 0 0 0
0 0 0 0 0
0 0 0 0 0
7 0 1 0 0
)

n6=: fixnum''
0 0 0 0 0 0 0 3 0
0 0 0 0 0 0 5 0 0
1 0 0 0 0 0 0 0 0
0 0 4 0 0 0 0 0 0
5 0 0 0 0 0 0 0 5
0 0 0 0 0 0 5 0 0
0 0 0 0 0 0 0 0 5
0 0 1 0 0 0 0 0 0
0 3 0 0 0 0 0 0 0
)

n7=: fixnum''
0 0 5 0 0 0 0 0 0
0 8 0 0 0 0 0 0 3
0 0 0 0 0 0 0 0 0
0 0 0 0 0 3 0 0 0
2 0 0 0 0 0 0 0 1
0 0 0 4 0 0 0 0 0
0 0 0 0 0 0 0 0 0
2 0 0 0 0 0 0 6 0
0 0 0 0 0 0 3 0 0
)

n8=: fixnum''
0 0 0 0 0 0 0 5 0 2
3 0 0 0 0 0 0 0 0 0
0 4 0 0 2 0 0 0 0 0
0 0 0 0 0 0 3 0 0 0
0 4 0 0 0 4 0 0 0 0
0 0 0 0 0 0 0 0 0 3
0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0
0 3 0 0 3 0 0 0 0 0
0 0 1 0 0 1 0 3 0 3
)

NB. Sample problem 6 by OX from the Nikoli page
n9=: fixnum''
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
1 0 0 0 0 12 0 0 0 0 0 3 0 12 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2
2 0 0 0 0 3 0 0 0 0 0 3 0 0 0 0 3 0
0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0
3 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 2 0 0 2 0 3 0 2 0 0 0 0 0 0 0
2 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0
0 0 3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 12 0 1
)

NB. =========================================================
demoboard=: 3 : 0
id=. 'n',":y
run ('Board',":y);".id
)
