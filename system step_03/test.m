datasource = 'testuser';
conn = database(datasource,'testuser','1234');
conn.Message;


tablename = 'tbl_user';
colnames = {'id','name'};
insertdata = {1.1111111,'CCC'};
insertdata = cell2table(insertdata,'VariableNames',colnames)
fastinsert(conn,tablename,colnames,insertdata)

selectquery = 'SELECT * FROM tbl_user';
data = select(conn,selectquery)
