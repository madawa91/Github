
clc;
clear all;
close all;
[fname, path]=uigetfile('.jpg''open a face as input for Tarining');
fnstr=strcat(path,fname);
imrd=imread(fnstr);  
im = rgb2gray(imrd);
imshow(im);
title('Import Image is Success');

c=input('Please Enter the Class Number :'); 


F=FeatureStatistical(im);

try 
    load db; 
    F=[F c];
    db=[db;F];
    save db.mat db 
    msgbox('Successfully Data is Saved');
catch
       msgbox('Database Save Error !');
end