
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

% try 
% datasource = 'testuser';
% conn = database(datasource,'testuser','1234');
% conn.Message;
% 
% 
% 
% 
% 
% colnames = {'m_values','s_values','class'};
% 
% insertdata = {F(1),F(2),c};
% 
% data_table = cell2table(insertdata,'VariableNames',colnames);
% tablename = 'tbl_ss';
% insert(conn,tablename,colnames,data_table);
% 
% msgbox('Successfully Data is Saved');
%     close(conn)
% catch
%       msgbox('Database Save Error !');
%       close(conn)
% end