
function Im = crop(Im,n,m)
   
   [r,c,h] = size(Im);
 
    
    cx=round(r/2);
    cy=round(c/2);
    Xcor1=cx-n/2;
    Ycor1=cy-m/2;
    
    Xcor2=cx+n/2;
    Ycor2=cy+m/2;
    Im1=Im(:,:,1);
    Im1=Im1(Xcor1:Xcor2-1,Ycor1:Ycor2-1);
      
    Im2=Im(:,:,2);
    Im2=Im2(Xcor1:Xcor2-1,Ycor1:Ycor2-1);
    
    Im3=Im(:,:,3);
    Im3=Im3(Xcor1:Xcor2-1,Ycor1:Ycor2-1);
    
    Im=cat(3,Im1,Im2,Im3);
    
end