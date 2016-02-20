a=imread('/home/ankit/Documents/MajorProject/sirDocuments/kmeansAfterSegmentation.jpg');
b=im2bw(a);
skelImage=bwmorph(b,'skel',Inf);
%imshow(skelImage);
%figure;
[rows, columns]=size(skelImage);
skelImageInt=uint8(skelImage);
skelImageIntTemp=skelImageInt;
imshow(skelImageInt,[]);
figure;
for r=2:(rows-1) 
    for c=2:(columns-1)
         neighbors(1)= skelImageIntTemp(r-1,c-1); % Upper left.  r = row, c = column.
         neighbors(2) = skelImageIntTemp(r-1,c); % Upper middle.  r = row, c = column.
         neighbors(3) = skelImageIntTemp(r-1,c+1); % Upper right.  r = row, c = column.
         neighbors(4) = skelImageIntTemp(r,c-1); % left.  r = row, c = column.
         neighbors(5) = skelImageIntTemp(r+1,c+1); % Lowerleft.  r = row, c = column.
         neighbors(6) = skelImageIntTemp(r,c+1); % right. r = row, c = column.
         neighbors(7) = skelImageIntTemp(r+1,c-1);
         neighbors(8) = skelImageIntTemp(r+1,c); % lower middle.  r = row, c = column.
         
         sum1=0;
         sum2=0;
         for k=1:4
             sum1=sum1+neighbors(k*2);
             sum2=sum2+neighbors(2*k-1);
         end
        
         if(skelImageInt(r,c)==1)
             if(sum1==1)
                 if(skelImageIntTemp(r-1,c)==1 && ((sum2-(skelImageIntTemp(r-1,c+1)+skelImageIntTemp(r-1,c-1)))==0))
                     skelImageInt(r,c)=3;
                      disp('Sum1=');
         disp(sum1);
         disp('Sum2=');
         disp(sum2);
                     disp('r=');
                     disp(r);
                     disp(' c=');
                     disp(c);
                     
                 elseif(skelImageIntTemp(r,c+1)==1 && ((sum2-(skelImageIntTemp(r-1,c+1)+skelImageIntTemp(r+1,c+1)))==0))
                     skelImageInt(r,c)=3;
                      disp('Sum1=');
         disp(sum1);
         disp('Sum2=');
         disp(sum2);
                     disp('r=');
                     disp(r);
                     disp(' c=');
                     disp(c);
                     
                  elseif(skelImageIntTemp(r+1,c)==1 && ((sum2-(skelImageIntTemp(r+1,c-1)+skelImageIntTemp(r+1,c+1)))==0))
                     skelImageInt(r,c)=3;
                      disp('Sum1=');
         disp(sum1);
         disp('Sum2=');
         disp(sum2);
                     disp('r=');
                     disp(r);
                     disp(' c=');
                     disp(c); 
                     
                   elseif((sum2-(skelImageIntTemp(r-1,c-1)+skelImageIntTemp(r+1,c-1)))==0)
                     skelImageInt(r,c)=3;
                      disp('Sum1=');
         disp(sum1);
         disp('Sum2=');
         disp(sum2);
                     disp('r=');
                     disp(r);
                     disp(' c=');
                     disp(c);
                 else
                     disp('Sum1=');
         disp(sum1);
         disp('Sum2=');
         disp(sum2); 
                 end
             elseif(sum1==0 && sum2==1)
                 skelImageInt(r,c)=3;
                 disp('r=');
                 disp(r);
                 disp(' c=');
                 disp(c);
             else
                  disp('Sum1=');
         disp(sum1);
         disp('Sum2=');
         disp(sum2);
             end
         end
        
    end
end
imshow(skelImageInt,[]);
figure;
imshow(skelImageInt>2);
