Installation Guide:

- Install PostgreSQL and import the database from \core\beverage_stock.sql file.
- Configure the database in env.py file.
- Configure the "sandbox" attribute in db.py file. It enables or disables database commits.
- Install libraries using 'pip install -r requirements.txt'.
- Run 'uvicorn main:app --reload'
- Access 'localhost/docs' to test the API.