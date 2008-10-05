



































function sleep(millis){var njf1=njen(this,arguments,"millis");nj:while(1){switch(njf1.cp){case 0:
njf1._en=new EventNotifier();
setTimeout(njf1._en,njf1._millis);njf1.pc(1,
njf1._en,"wait",[]);case 1:with(njf1)if((rv1=f.apply(c,a))==NJSUS){return fh;}break nj;}}}


function fetch(url,timeout){var njf1=njen(this,arguments,"url","timeout");nj:while(1){try{switch(njf1.cp){case 0:
njf1._en=new EventNotifier();
njf1._http=NjsRuntime.createXmlHttp();

njf1._http.open("GET",njf1._url,true);
njf1._http.onreadystatechange=njf1._en;njf1.ecp=1;

njf1._http.send(null);case 3:
njf1.cp=(njf1._http.readyState!=4)?4:5;break;case 4:
njf1._startTime=new Date().getTime();njf1.pc(6,
njf1._en,"wait",[njf1._timeout]);case 6:with(njf1)if((rv6=f.apply(c,a))==NJSUS){return fh;}
njf1._timeout-=new Date().getTime()-njf1._startTime;njf1.cp=3;break;case 5:njf1.cp=2;break;case 1:njf1.ecp=null;njf1.thr=false;njf1._e = njf1.ex;


return null;njf1.cp=2;break;case 2:


return njf1._http.responseText;break nj;}}catch(ex){njf1.doex(ex)}}}
