import hashlib
import mysql.connector

def hash(value):
    result = hashlib.md5(value.encode())
    return result.hexdigest()