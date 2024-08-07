const mongoose = require('mongoose');
const productSchema = mongoose.Schema({
    name:{
        type:String,
        required:true,
        trim:true,
    },
    price:{
        type:Number,
        required:true,
    },
    description:{
        type:String,
        required:true,
        trim:true,
    },
    image:[{
        type:String,
        required:true,
    },
    ],
    category:{
        type:String,
        required:true,
        
    },
    quantity:{
        type:Number,
        required:true,
    },
    sold:{
        type:Number,
        default:0,
    }

    

});

const Product =mongoose.model('Product',productSchema);
module.exports = Product;