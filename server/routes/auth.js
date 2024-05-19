const express = require("express");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const User = require("../models/user");
const auth = require("../middlewares/auth");

const authRouter =express.Router();

authRouter.post("/api/signup", async(req,res)=>{
    try{

        const {name,email,password}=req.body;
    // {
        // 'name':'sachin','email':email,'password':password
// 
    // }
    // get data from client
    const existingUser = await User.findOne({ email });
    if(existingUser){
        return res.status(400).json({ msg:"User Email already exists"});
    }
    hashedPassword=await bcrypt.hash(password,8);

    let user = new User({
        email,
        name,
        password:hashedPassword ,
    });
    user =await user.save();
    res.json(user);

    }catch(e){
        res.status(500).json({error:e.message});
    }

    

    // save the data in database
    // return the data to the user
});

authRouter.post("/api/signin",async(req,res)=>{
    try{
        const{email,password}=req.body;
        const emailNotExists = await User.findOne({email});
        if(!emailNotExists){
            return res.status(400).json({msg:"User Email does not exist"});
        }
        const incorrectPassword = await bcrypt.compare(password,emailNotExists.password);
        if(!incorrectPassword){
            return res.status(400).json({msg:"Incorrect Password"});
        }
        const token = jwt.sign({id:emailNotExists._id},"passwordkey")
        res.json({ token , ...emailNotExists._doc});
    }catch(e){
        res.status(500).json({error:e.message});
    }
})

authRouter.post("/tokenIsValid",async (req,res)=>{
    try{
        const token= req.header('x-auth-token');
        if(!token){
            return res.json(false);
        }
        const verified = jwt.verify(token,'passwordkey');
        if(!verified) return res.json(false);

        const user =await User.findById(verified.id);
        if(!user) return res.json(false);
        res.json(true);
        
    }catch(e){}
})

authRouter.get("/",auth,async(req,res)=> {
    const user =await User.findById(req.user);
    res.json({
        ...user._doc,
        token:req.token
    });
});




module.exports=authRouter;
