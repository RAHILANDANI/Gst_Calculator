// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

void main() => runApp(GST());

class GST extends StatefulWidget {
  const GST({super.key});

  @override
  State<GST> createState() => _GSTState();
}

class _GSTState extends State<GST> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GSTHOME(),
    );
  }
}

class GSTHOME extends StatefulWidget {
  const GSTHOME({super.key});

  @override
  State<GSTHOME> createState() => _GSTHOMEState();
}

class _GSTHOMEState extends State<GSTHOME> {

  double fp = 0;
  double cgst = 0;
  double sgst = 0;
  String op = "";
  double gp = 0;
  int si = -1;
  List<double> gstPercentages = [3, 5, 12, 18, 28];

  void cfp() {
    double originalPrice = double.tryParse(op) ?? 0;
    double gstAmount = (originalPrice * gp) / 100;
    fp = originalPrice + gstAmount;
    cgst = gstAmount / 2;
    sgst = gstAmount / 2;
  }

  void onpress(String Value) {
    setState(() {
      op += Value;
    });
  }



  void remove() {
    setState(() {
      if (op.isNotEmpty) {
        op = op.substring(0, op.length - 1);
        if (op.isEmpty) {
          si = -1;
          fp = 0;
          cgst = 0;
          sgst = 0;
        }
        cfp();
      }
    });
  }
  void clear() {
    setState(() {
      op = "";
      si = -1;
      fp = 0;
      cgst = 0;
      sgst = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEEEEE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Color(0xffE9E9E9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "ORIGINAL PRICE",
                      style: TextStyle(
                        color: Color(0xff252427),
                      ),
                    ),
                    Text(op),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Color(0xffE9E9E9),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "GST",
                        style: TextStyle(color: Color(0xff252427), fontSize: 15),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          for (int index = 0;
                          index < gstPercentages.length;
                          index++)
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    gp = gstPercentages[index];
                                    si = index;
                                    cfp();
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: si == index
                                      ? Color(0xffFF6B00)
                                      : null,
                                ),
                                child: Text(
                                  "${gstPercentages[index]}%",
                                  style: TextStyle(
                                    color: Color(0xff252427),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: double.infinity,
                color: Color(0xffE9E9E9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "FINAL PRICE",
                      style: TextStyle(color: Color(0xff252427)),
                    ),
                    Text(
                      "${fp.toStringAsFixed(3)}₹ RS",
                      style: TextStyle(color: Color(0xff252427)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 90,
                width: 230,
                color: Color(0xffE9E9E9),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "CGST/SGST",
                      style: TextStyle(color: Color(0xff252427), fontSize: 19),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${cgst.toStringAsFixed(1)}₹ RS CGST\n${sgst.toStringAsFixed(1)}₹ RS SGST",
                      style: TextStyle(color: Color(0xff252427)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(width: 25,),
                  Column(
                    children: [
                      custombtn("7"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("4"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("1"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("00"),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      custombtn("8"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("5"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("2"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("0"),
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      custombtn("9"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("6"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("3"),
                      SizedBox(
                        height: 30,
                      ),
                      custombtn("."),
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => clear(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffFF6B00),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text(
                          "AC",
                          style: TextStyle(color: Colors.white,fontSize: 26),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          onPressed: () => remove(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFF6B00),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 64),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: Text("⌫",style: TextStyle(color: Colors.white,fontSize: 26),),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget custombtn(String Number) {
    return ElevatedButton(
      onPressed: () => onpress(Number),
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
        backgroundColor: Color(0xffEEEEEE),
        foregroundColor: Colors.black,
        elevation: 0
      ),
      child: Text(
        Number,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
