const express = require("express");
const adminRouter= express.Router();
const admin = require("../middlewares/admin");
const Product = require("../models/product");

adminRouter.post("/admin/add-product", admin, async(req,res)=>{
    try{
        const {name,price,description,image,category,quantity}=req.body;
        let product = new Product({
            name,
            price,
            description,
            image,
            category,
            quantity,
            
        });
        product =await product.save();
        res.json(product);
    }
    catch(e){
        res.status(500).json({error:e.message});
    }
})

module.exports=adminRouter;