
import 'package:flutter/material.dart';
import 'package:fluttertask8/splitbill.dart';


class Result extends StatefulWidget {
  final friends,tip,tax,total;

  Result({required this.friends,required this.tip,required this.tax,required this.total});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate_bill();
  }
  late double finalbill;
  calculate_bill(){
    double taxamt=double.parse(widget.total)*double.parse(widget.tax.text)/100;
    print(taxamt);
    finalbill=(double.parse(widget.total)+taxamt+widget.tip)/widget.friends;
    print(finalbill);
    return finalbill;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10,),
              Text('Result',style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ],
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 2),
            child: Container(
              height: (MediaQuery.of(context).size.height * 0.26),
              width: (MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                color: Colors.yellow[700],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,top: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Equally Divided Amount',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.currency_rupee,color: Colors.yellow,size: 29,),
                        Text(finalbill.toStringAsFixed(2).toString(),style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 33),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text('Friends',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 3,),
                              Text('Tax',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 3,),
                              Text('Tip',style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),
                          SizedBox(width: 15,),
                          Column(
                            children: [
                              SizedBox(height: 3,),
                              Text(widget.friends.toStringAsFixed(0).toString(),style: TextStyle(
                                color: Colors.yellow[300],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Text(widget.tax.text,style: TextStyle(
                                    color: Colors.yellow[300],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                  SizedBox(width: 4,),
                                  Text('%',style: TextStyle(
                                    color: Colors.yellow[300],
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  )),
                                ],
                              ),
                              SizedBox(height: 3,),
                              Text(widget.tip.toString(),style: TextStyle(
                                color: Colors.yellow[300],
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.only(left: 12,right: 12,top: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Everybody should pay  ',style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
                Icon(Icons.currency_rupee,color: Colors.blueGrey[700],),
                Text(finalbill.toStringAsFixed(2).toString(),style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),
              ],
            ),
          ),
          SizedBox(height: 13,),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Split()));
            },
            child: Text('Split Again ?',style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                primary: Colors.yellow[700]
            ),
          ),
        ],
      ),
    );
  }
}