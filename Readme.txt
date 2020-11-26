 -- @author Muhammad Hassan (mhassa31)

 Instructions to run the project (in windows)

 1. build the database in MySQL
    a. download mysql and mysql workbench.
    b. run the pharma_table_creator.sql file (found in the root project folder) in MySQL workbench using your root id.
        this will create the database and users needed to run the program.
    
2. start the backend server
    a. install a JDK distribution to run the java apps
    b. open a command shell inside the root folder (I used powershell)
    c. run the following commands:
        cd pharmaDBRestApi\target
        java -jar .\pharmaDBRestApi.jar

3. run the front end
    a. install requirements: Node.js and npm 
    b. open a command prompt inside the root folder ( I used Powershell)
    c. run the following commands:
        cd pharmadb-frontend
        npm install
        npm install -g serve
        npx serve -s build
    d. finally, the front-end should be running on http://localhost:5000
       go in google chrome and go to the url: http://localhost:5000.
    

features: 

1. the website features 3 different users: admin, pharmacy1, and pharmacy2
   the home page includes three cards that you can click to access each one of them
   the cards also have a short description of what you can do with each user.
2. Search Bar: you can use the search bar to search a specific drug or company (depending on the tab you are in)
3. Create Form: useing the create form you can create new entities 
4. Delete Button: delete entities from the database by clicking the delete icon.
5. Update Button: update entities in the database by clicking the update icon.

    