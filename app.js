const express = require("express")
const bodyParser = require("body-parser")
const morgan = require("morgan")
const mongoose = require("mongoose")

let app = express()

let http = require("http").Server(app)
let io = require("socket.io")(http)

/*
mongoose.connect(config.database_link, (err) => {
    if(err)
    {
        console.log("Error connecting to DB " + config.database_name)
    }
    else
    {
        console.log("Connected to DB " + config.database_name)
    }
})
*/

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(morgan("dev"))

app.use(express.static(`${__dirname}/public`))
app.use('/scripts', express.static(`${__dirname}/node_modules`))

let api = require("./app/routes/api")(app, express, io)
app.use("/api", api)

app.get("*", (request, response) => {
    response.sendFile(`${__dirname}/public/app/views/index.html`)
})

http.listen(228, (err) => {
    if(err)
    {
        console.log(err)
    }
    else
    {
        console.log("Listening on port 228")
    }
})