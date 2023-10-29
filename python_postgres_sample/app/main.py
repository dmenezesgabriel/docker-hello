import psycopg2

conn = psycopg2.connect(
    host="db",
    database="postgres",
    user="postgres",
    password="postgres")

cursor = conn.cursor()
cursor.execute("SELECT * FROM books")
rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()