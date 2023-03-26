import hashlib
import mysql.connector
import datetime
from md5 import hash

# GET VALUES FROM SRC
conn = mysql.connector.connect(host='localhost', database='source',user='sasdds', password='1234', port=3307)
source=conn.cursor(prepared=True)
source.execute("select CUST_CODE from CUSTOMER")
s=source.fetchall()
source.execute("select `CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE` from CUSTOMER")
st=source.fetchall()
conn.commit()
ss=str(s).replace(",)","").replace("(","").replace("[","").replace("]","").replace(" ","")


#GET VALUES FORM TARGET WITH MATCHING BUSINESS KEYS
conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
dds=conn.cursor()
query=" select CUST_CODE from DDS_CUSTOMER where CUST_CODE in (" + ss +") AND VALID_TO_DTTM='5999-01-12 00:00:00'"
dds.execute(query)
d=dds.fetchall()
query=" select `CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE` ,CUSTOMER_RK from DDS_CUSTOMER where CUST_CODE in (" + ss +") AND VALID_TO_DTTM='5999-01-12 00:00:00'"
dds.execute(query)
dt=dds.fetchall()
conn.commit()

#print(len(s) ,len(d) )

# if difference between src and dds is zero then 
if len(s) <= len(d)  :
    upd_keys=set(s).union(set(d))
    upd_keys=list(zip(*upd_keys))[0]
    for i in range(len(d)): # iter for each present key
        update=[]
        insert=[]
        for j in range(len(dt)):
            if dt[j][0] == upd_keys[i]:
                tmp1= dt[j]
        for j in range(len(st)):
            if st[j][0] == upd_keys[i]:
                tmp2= st[j]
        h1,h2= hash(str(tmp1[:-1])),hash(str(tmp2))
        #print(h1,h2)
        if h1==h2:
            pass
        else :
            print(h1,h2,upd_keys[i])
            #update.append(dt[i] + (str(datetime.datetime.today().strftime('%Y-%m-%d %H:%M:%S')),))
            #insert.append(st[i] + ('5999-01-12',str(datetime.datetime.today().strftime('%Y-%m-%d %H:%M:%S')),))
            update=(str(datetime.datetime.today().strftime('%Y-%m-%d %H:%M:%S')),) + (upd_keys[i],)
            conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
            upd_rec=conn.cursor(prepared=True)
            query='''UPDATE `dds_customer` SET VALID_TO_DTTM=%s WHERE CUST_CODE=%s;'''
            upd_rec.execute(query,update)
            conn.commit()
            
            insert=tmp2 + ('5999-01-12',str(datetime.datetime.today().strftime('%Y-%m-%d %H:%M:%S')),) + (tmp1[len(tmp1)-1],)
            print(insert)
            conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
            insert_rec=conn.cursor(prepared=True)
            query='''INSERT INTO `dds_customer` (`CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`
             , `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`, `VALID_TO_DTTM`, `VALID_FROM_DTTM`, CUSTOMER_RK) 
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);'''
            insert_rec.execute(query,insert)
            conn.commit()
# if values in src are greater than dds then insert missing ones. 
elif len(s) > len(d)  :
    ins_keys=list(set(s)-set(d))
    ins_keys=list(zip(*ins_keys))[0]
    # i records to be insertd
    insert =[]
    for i in range(len(st)):
        if st[i][0] in ins_keys:
            insert.append(st[i] + ('5999-01-12',str(datetime.datetime.today().strftime('%Y-%m-%d %H:%M:%S')),))
    # Insert statement
    conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
    insert_rec=conn.cursor(prepared=True)
    query='''INSERT INTO `dds_customer` (`CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`, `VALID_TO_DTTM`, `VALID_FROM_DTTM`) 
    VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);'''
    insert_rec.executemany(query,insert)
    conn.commit()

