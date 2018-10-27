var express = require("express");
var mysql = require("mysql");
var bodyParser = require("body-parser");

var app = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
    host        : 'localhost',
    user        : 'root',
    password    : '1234',
    database    : 'join_us'
});

app.get("/", function(req, res) {
    var q = "SELECT COUNT(*) AS count FROM users";
    connection.query(q, function(err, results) {
        if(err) throw err;
        var count = results[0].count;

        res.render("home", {data: count});
    });
});

app.post("/register", function(req, res) {
    var person = {
                    email: req.body.email
                 };

    connection.query("INSERT INTO users SET ?", person, function(err, results) {
        if(err) console.log(err);
        res.redirect("/");
    });
});

app.listen(8080, function() {
    console.log('Join Us web application is listening on Port 8080.');
});