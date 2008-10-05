function while_loop(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  foo();case 1:njf1.pc(2,null,
  cond,[]);case 2:with(njf1)if((rv2=f.apply(c,a))==NJSUS){return fh;}njf1.cp=(njf1.rv2)?3:4;break;case 3:
  bar();njf1.pc(5,null,
  baz,[]);case 5:with(njf1)if((rv5=f.apply(c,a))==NJSUS){return fh;}
  bee();njf1.cp=1;break;case 4:
  
  boo();break nj;}}}
  
  
function do_while_loop(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  foo();case 1:
  
  bar();njf1.pc(3,null,
  baz,[]);case 3:with(njf1)if((rv3=f.apply(c,a))==NJSUS){return fh;}
  bee();njf1.pc(4,null,
  cond,[]);case 4:with(njf1)if((rv4=f.apply(c,a))==NJSUS){return fh;}njf1.cp=(njf1.rv4)?1:2;break;case 2:
  boo();break nj;}}}
  
  
  
function test_identifier_resolution(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  foo,[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1._x=njf1.rv1;
  while(njf1._x)
  njf1._x++;
  
  do{
  njf1._x++;}
   while(njf1._x);break nj;}}}
