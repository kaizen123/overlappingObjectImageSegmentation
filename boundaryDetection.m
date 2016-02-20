img=imread('/home/ankit/Documents/research papers/TB detection/data/Tb_UFAM_CFBAD1_1.JPG');
binImage=im2bw(img,graythresh(img));

subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(binImage);