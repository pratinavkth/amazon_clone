import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}
 class _DealOfDayState extends State<DealOfDay>{
  @override
  Widget build(BuildContext context){
    return Column(
      children:[
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left:10,top:15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(
              fontSize:20
            ),
          ),
        ),
         Image.network('https://as1.ftcdn.net/v2/jpg/06/02/92/62/1000_F_602926211_p4jysG2ODSQWuETwpMLpDWxTloHS0mF8.jpg',
            height: 235,
            fit: BoxFit.fitHeight,
          ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left:10,top:15,right:40),
          child: const Text(
            ' \$500.00',
            style: TextStyle(
              fontSize:20,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left:10,top:5,right:40),
          child: const Text(
            'Watermellon',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ), 
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
        Image.network('https://as2.ftcdn.net/v2/jpg/06/01/33/05/1000_F_601330592_nR1mjmUDEh1Mb2Hzik8uylCkAgfuJfKV.jpg' ,fit:BoxFit.fitWidth,height: 100,width: 100,),
        Image.network('https://as1.ftcdn.net/v2/jpg/07/87/42/86/1000_F_787428692_k2EIv7RelQT63wCg7BQD5unYEQVYCCsR.jpg',fit:BoxFit.fitWidth,height: 100,width: 100,),
        Image.network('https://as1.ftcdn.net/v2/jpg/07/87/42/86/1000_F_787428692_k2EIv7RelQT63wCg7BQD5unYEQVYCCsR.jpg',fit:BoxFit.fitWidth,height: 100,width: 100,),
        Image.network('https://as1.ftcdn.net/v2/jpg/07/87/42/86/1000_F_787428692_k2EIv7RelQT63wCg7BQD5unYEQVYCCsR.jpg',fit:BoxFit.fitWidth,height: 100,width: 100,),
        Image.network('https://t3.ftcdn.net/jpg/07/55/78/90/240_F_755789083_Mws7mbTXXwnmZvAhWe4hluoRApvoMeKy.jpg',fit:BoxFit.fitWidth,height: 100,width: 100,),
        Image.network('https://as2.ftcdn.net/v2/jpg/07/76/63/79/1000_F_776637985_3Mth2bhwZgRxevk7uo4eUgGugm8m3YPq.jpg',fit:BoxFit.fitWidth,height: 100,width: 100,),
          ],
        ),
        ),
        Container(
          padding: const EdgeInsets.only(left:15,top:15,right:15),
          alignment: Alignment.topLeft,
          child: const Text('See all deals',
          style: TextStyle(
            color:Colors.cyan,
          ),),
        ),
      ],  
    );
  }

}