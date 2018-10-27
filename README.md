# Join-Us
A simple web application that serves as a mailing list.

![join us](https://i.imgur.com/5DHqgPZ.png)

### Program Execution
npm install [ Install all the dependencies listed in the package.json. ]

mysql -u root -p [ Login to MySQL servers. ]

source schema.sql [ Create the necessary database and schema. ]

node false_data.js [ Add 500 randomly generated users into database. ]

node app.js [ Run the web application, which you can view by opening "localhost:8080" on your web browser. ]
