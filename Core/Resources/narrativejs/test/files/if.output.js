function test_simple(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  njf1.cp=(true)?1:2;break;case 1:
  foo();njf1.pc(3,null,
  bar,[]);case 3:with(njf1)if((rv3=f.apply(c,a))==NJSUS){return fh;}
  baz();njf1.cp=2;break;case 2:
  
  bee();break nj;}}}
  
  
function test_else(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  njf1.cp=(true)?1:2;break;case 1:
  foo();njf1.pc(4,null,
  bar,[]);case 4:with(njf1)if((rv4=f.apply(c,a))==NJSUS){return fh;}
  baz();njf1.cp=3;break;case 2:
  
  baz();njf1.pc(5,null,
  bar,[]);case 5:with(njf1)if((rv5=f.apply(c,a))==NJSUS){return fh;}
  foo();njf1.cp=3;break;case 3:
  
  bee();break nj;}}}
  
  
function test_mismatch(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:
  njf1.cp=(true)?1:2;break;case 1:
  foo();
  baz();njf1.cp=3;break;case 2:
  
  foo();njf1.pc(4,null,
  bar,[]);case 4:with(njf1)if((rv4=f.apply(c,a))==NJSUS){return fh;}
  baz();njf1.cp=3;break;case 3:
  
  bee();break nj;}}}
  
  
function test_condition(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  foo,[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1.cp=(njf1.rv1)?2:3;break;case 2:
  bar();njf1.pc(4,null,
  baz,[]);case 4:with(njf1)if((rv4=f.apply(c,a))==NJSUS){return fh;}
  bee();njf1.cp=3;break;case 3:
  
  blah();break nj;}}}
