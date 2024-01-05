import psycopg2
from env import DB_USER, DB_PASSWORD, DB_HOST, DB_NAME, DB_PORT

class Database():

    def __init__(self, sandbox: bool):
        self.conn = psycopg2.connect(database=DB_NAME, user=DB_USER, password=DB_PASSWORD, host=DB_HOST, port=DB_PORT)
        self.cur = self.conn.cursor()
        self.sandbox = sandbox
    
    def close_connection(self):
        self.cur.close()
        self.conn.close()
    
    def commit_changes(self):
        if not self.sandbox:
            self.conn.commit()

    def rollback_changes(self):
        self.conn.rollback()

    def execute_select(self, query: str):
        self.cur.execute(query)
        return self.cur.fetchall()
    
    def execute_change(self, query: str):
        try:
            self.cur.execute(query) 
            id = self.cur.fetchone()[0]
            return self.check(id)
        except:
            self.rollback_changes()
 
    def check(self, id: int): #executes a select with the new/updated/deleted item to check if the change was made
        check = f"SELECT * FROM beverage WHERE id= {id};"
        result = self.execute_select(check)
        if (len(result) < 1):
            self.rollback_changes()
            return ["No results"]
        if (len(result) > 1):
            self.rollback_changes()
            return ["Check error: list returned more than one value"]
        self.commit_changes()
        return result

        
database = Database(sandbox=True)
