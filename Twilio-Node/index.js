const express = require('express');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({
    extended: true
}));

app.post("/twilio", (req, res)=>{
    
});



app.listen(3000, ()=>{
    console.log("Server started listening on port 3000");
});