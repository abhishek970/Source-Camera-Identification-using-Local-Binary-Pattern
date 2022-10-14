%run the matlab code
%change the path for each camera folder
%example: imds=imageDatastore('path');

features = zeros(0,177);
imds=imageDatastore('G:\Final_project\DIF_mage_data\SAMSUNG_2');
a=0;
while(hasdata(imds))
    img=read(imds);
    img=crop(img,256,256);
    redChannel = img(:,:,1); 
    lbp1= extractLBPFeatures(redChannel);
    greenChannel = img(:,:,2);
    lbp2= extractLBPFeatures(greenChannel);
    blueChannel = img(:,:,3);
    lbp3= extractLBPFeatures(blueChannel);
    
    feature=horzcat(lbp1,lbp2,lbp3);
    features=[features; feature];
    fprintf('%d',a);
    a = a + 1; 
end           