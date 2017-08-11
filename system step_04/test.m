% datasource = 'testuser';
% conn = database(datasource,'testuser','1234');
% conn.Message;
% 
% % tablename = 'tbl_data';
% % colnames = {'mean_value','stand_value','class'};
% % insertdata = {2345.4567,2345.6666,44};
% 
% tablename = 'tbl_user';
% colnames = {'id','name'};
% insertdata = {456.66,'CCC'};
% insertdata = cell2table(insertdata,'VariableNames',colnames)
% fastinsert(conn,tablename,colnames,insertdata)
% 
% selectquery = 'SELECT * FROM tbl_user';
% data = select(conn,selectquery)


try
datasource = 'testuser';
conn = database(datasource,'testuser','1234');
conn.Message;




colnames = {'m_values','s_values','class'};

insertdata = [33322.33333,223333.4533333,7.00000];

data_table = cell2table(insertdata,'VariableNames',colnames);
tablename = 'tbl_ss';
insert(conn,tablename,colnames,data_table);

    msgbox('Successfully Data is Saved');
    
curs = exec(conn,'SELECT * FROM tbl_ss');
curs = fetch(curs);
curs.Data  
close(curs)
close(conn)
catch
      msgbox('Database Save Error !');
      close(curs)
      close(conn)
end





 
