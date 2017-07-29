
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg''open a face as input for Tarining');
fnstr=strcat(path,fname);
imrd=imread(fnstr);  
im = rgb2gray(imrd);
imshow(im);
title('Import Success');
c=input('Please Enter the Image Number :'); 


F=FeatureStatistical(im);

try 
    load db; 
    F=[F c];
    db=[db;F];
    save db.mat db 
    msgbox('Successfully Data is Train');
catch
       msgbox('Database Save Error');
end