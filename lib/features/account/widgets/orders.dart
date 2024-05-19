import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';


class Orders extends StatefulWidget{
  const Orders({Key? key}):super(key:key);
  @override
  State<Orders> createState()=> _OrdersState();
}

class _OrdersState extends State<Orders>{
  List list =[
"https://images.unsplash.com/photo-1610972221114-c48c6bb5d2eb?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BsYXNoJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
"https://images.unsplash.com/photo-1610972221114-c48c6bb5d2eb?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BsYXNoJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
"https://images.unsplash.com/photo-1610972221114-c48c6bb5d2eb?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BsYXNoJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
"https://images.unsplash.com/photo-1610972221114-c48c6bb5d2eb?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BsYXNoJTIwaW1hZ2V8ZW58MHx8MHx8fDA%3D",
  ];
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left:15,),
              child:const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ), 
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color:GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),  
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),

          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:list.length,
            itemBuilder: (context, index){
              return SingleProduct(
                image:list[index],
                );
            },
          ),
        )
      ],
    );
  }
}