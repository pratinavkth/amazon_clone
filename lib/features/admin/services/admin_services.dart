
import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';



class AdminService{
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async{
    final userProvider = Provider.of<UserProvider>(context,listen:false);
    try {
      final cloudinary =CloudinaryPublic('date8zuls', 'ssx7ievt');
      List<String> imageUrls =[];

      for(int i=0;i<images.length;i++){
        CloudinaryResponse res =await cloudinary.uploadFile(
        CloudinaryFile.fromFile(images[i].path,folder: name,),
        );
        imageUrls.add(res.secureUrl);
      }
      Product product =Product(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        category: category,
        images: imageUrls,
      );

     http.Response res= await http.post(Uri.parse('$uri/admin/add-product'),
      headers:{
        'Content-Type':'application/json; charset=UTF-8',
        'x-auth-token':userProvider.user.token,
      },
      body: product.toJson(),
      );

      httpErrorHandle(response: res, context: context, onSuceess: (){
        showSnackBar(context, 'Product added successfully');
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}