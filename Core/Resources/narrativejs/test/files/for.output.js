function for_block(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  njf1._x=1;njf1.pc(1,null,
  foo,[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1._i=njf1.rv1+njf1._x;case 3:njf1.pc(4,null,bar,[]);case 4:with(njf1)if((rv4=f.apply(c,a))==NJSUS){return fh;}njf1.cp=(njf1._i<njf1.rv4+njf1._x)?5:6;break;case 5:
  njf1._x=2;
  baz();njf1.pc(7,null,
  bee,[]);case 7:with(njf1)if((rv7=f.apply(c,a))==NJSUS){return fh;}
  blah();case 2:njf1._i++;njf1.cp=3;break;case 6:
  
  bang();break nj;}}}
  
  
function for_in_block_varDecl(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  dumb,[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1.pc(2,x,"foo",[]);case 2:with(njf1)if((rv2=f.apply(c,a))==NJSUS){return fh;}njf1.iter2=njkeys(njf1.rv2);njf1.ctr2=0;case 4:njf1.cp=(njf1.ctr2<njf1.iter2.length)?5:6;break;case 5:njf1._i=njf1.iter2[njf1.ctr2];
  bar();njf1.pc(7,null,
  baz,[]);case 7:with(njf1)if((rv7=f.apply(c,a))==NJSUS){return fh;}
  bee();case 3:njf1.ctr2++;njf1.cp=4;break;case 6:
  
  blah();break nj;}}}
  
  
function for_in_block_iterator(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  njf1.iter0=njkeys(foo);njf1.ctr0=0;case 2:njf1.cp=(njf1.ctr0<njf1.iter0.length)?3:4;break;case 3:i=njf1.iter0[njf1.ctr0];
  bar();njf1.pc(5,null,
  baz,[]);case 5:with(njf1)if((rv5=f.apply(c,a))==NJSUS){return fh;}
  bee();case 1:njf1.ctr0++;njf1.cp=2;break;case 4:
  
  blah();break nj;}}}
  
  
  
function test_identifier_resolution(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  bar,[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1._x=njf1.rv1;
  for(njf1._i in njf1._x)
  njf1._x++;
  
  for(njf1._i=njf1._x;njf1._i<njf1._x+1;njf1._i+=njf1._x)
  njf1._x++;break nj;}}}
  
