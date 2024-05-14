const express = require('express');

const authRouter =express.Router();

authRouter.post('/api/signup',(req,res)=>{

    const {name,email,password}=req.body;
    // {
        // 'name':'sachin','email':email,'password':password
// 
    // }
    // get data from client
    
    // save the data in database
    // return the data to the user
});

module.exports=authRouter;