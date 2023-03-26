import hashlib
import mysql.connector

# GET VALUES FROM SRC
conn = mysql.connector.connect(host='localhost', database='source',user='sasdds', password='1234', port=3307)
source=conn.cursor(prepared=True)
source.execute("select CUST_CODE from CUSTOMER")
s=source.fetchall()
source.execute("select * from CUSTOMER")
st=source.fetchall()
conn.commit()
ss=str(s).replace(",)","").replace("(","").replace("[","").replace("]","").replace(" ","")
#print(type(st))

#GET VALUES FORM TARGET
conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
dds=conn.cursor()
query=" select CUST_CODE from DDS_CUSTOMER where CUST_CODE in (" + ss +")"
dds.execute(query)
d=dds.fetchall()
query=" select * from DDS_CUSTOMER where CUST_CODE in (" + ss +")"
dds.execute(query)
dt=dds.fetchall()
conn.commit()
#print(dt)


# now check wehter to insert or update record
#   s contains all source keys
#   d contains all src keys present in targe (d will always be <= s)
#   1. set operations d-s will give insert count 
#   2. rest will give check for update cond

#print(len(s),len(d))
ins_keys=list(set(s)-set(d))
ins_keys=list(zip(*ins_keys))[0]

# i records to be insertd
insert =[]
for i in range(len(st)):
    if st[i][0] in ins_keys:
        insert.append(st[i] + ('5999-01-12','2023-03-26',))
print(insert[0],len(insert))


# Insert statement
conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
insert_rec=conn.cursor(prepared=True)
query='''INSERT INTO `dds_customer` (`CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`, `VALID_TO_DTTM`, `VALID_FROM_DTTM`) 
VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);'''
insert_rec.executemany(query,insert)
conn.commit()

