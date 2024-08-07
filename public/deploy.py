import sqlite3

def getDataSQL(query):
    res = []
    try:
        con = sqlite3.connect("db.sqlite")
        cur = con.cursor()
        res = cur.execute(query).fetchall()
        con.close()
    except:
        res = []
    return res

# column index starts at 0
for item in getDataSQL("SELECT * FROM master"):
    print(item[0],item[1],item[2],item[3],item[4],item[5],item[6],)


