a=imread('/home/ankit/Documents/MajorProject/sirDocuments/kmeansAfterSegmentation.jpg');
b=im2bw(a);
c=bwmorph(b,'skel',Inf);
imshow(c);