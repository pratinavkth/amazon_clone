console.log("hello world!")


const express = require('express');
// importing express

const PORT = 3000;

const app = express();

// create an api

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at a port ${PORT}`)

})
