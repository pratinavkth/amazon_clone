const express = require('express');
const mongoose = require('mongoose');
// importing express from packages

// iMPORTS FROM OTHER FILES
const authRouter=require("./routes/auth");
const adminRouter=require("./routes/admin");

// INITIALIZE EXPRESS APP
const PORT = 3000;
const app = express();
const DB ="mongodb+srv://pratinavkothia123:Kothia%40123@cluster0.4pnjqpu.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// MIDDLEWARES
// clientside(flutter)->middleware (make the work easy)
//  ->server it will return something and comes to client side -> flutter
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//connections
mongoose.connect(DB).then(()=>{
    console.log("connected to database");
}).catch(e=>{
    console.log(e);
});


app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at a port ${PORT}`);
});
