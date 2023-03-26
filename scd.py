import hashlib
import mysql.connector

# GET VALUES FROM SRC
conn = mysql.connector.connect(host='localhost', database='source',user='sasdds', password='1234', port=3307)
source=conn.cursor(prepared=True)
source.execute("select CUST_CODE from CUSTOMER")
s=source.fetchall()
source.execute("select * from CUSTOMER")
st=source.fetchall()
ss=str(s).replace(",)","").replace("(","").replace("[","").replace("]","").replace(" ","")
#print(type(st))

#GET VALUES FORM TARGET
conn = mysql.connector.connect(host='localhost', database='dds',user='sasdds', password='1234', port=3307)
dds=conn.cursor()
query=" select CUST_CODE from DDS_CUSTOMER_INC where CUST_CODE in (" + ss +")"
dds.execute(query)
d=dds.fetchall()
query=" select * from DDS_CUSTOMER_INC where CUST_CODE in (" + ss +")"
dds.execute(query)
dt=dds.fetchall()
#print(dt)


# now check wehter to insert or update record
#   s contains all source keys
#   d contains all src keys present in targe (d will always be <= s)
#   1. set operations d-s will give insert count 
#   2. rest will give check for update cond
print(len(s),len(d))
ins_keys=set(s)-set(d)
print(len(ins_keys))
# i records to be insertd

insert =[]
for i in s:









