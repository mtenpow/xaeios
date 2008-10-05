function args_on_multiple_lines(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  foo,
  [1,
  2,
  3]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}
  njf1._arguments;break nj;}}}
  
  
function continuation_arg(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  bar,[1,2,3]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1.pc(2,null,foo,[njf1.rv1]);case 2:with(njf1)if((rv2=f.apply(c,a))==NJSUS){return fh;}break nj;}}}
  
  
function continuate_arg_on_separate_line(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,
  
  bar,[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1.pc(2,null,foo,[njf1.rv1]);case 2:with(njf1)if((rv2=f.apply(c,a))==NJSUS){return fh;}break nj;}}}
  
  
function continuation_args_multiple_lines(){var njf1=njen(this,arguments);nj:while(1){switch(njf1.cp){case 0:njf1.pc(1,null,

  baz,[1,2,3]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}njf1.pc(2,null,
  bee,[1,2]);case 2:with(njf1)if((rv2=f.apply(c,a))==NJSUS){return fh;}njf1.pc(3,null,
  blah,[]);case 3:with(njf1)if((rv3=f.apply(c,a))==NJSUS){return fh;}njf1.pc(4,null,bar,[njf1.rv1,njf1.rv2,njf1.rv3]);case 4:with(njf1)if((rv4=f.apply(c,a))==NJSUS){return fh;}break nj;}}}
