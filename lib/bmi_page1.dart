 import 'package:flutter/material.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  TextEditingController HeightController=TextEditingController();
  TextEditingController WeightController=TextEditingController();
 double result=0;
  var _formKey = GlobalKey<FormState>();
  bool value=false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("BMI CALCULATOR",
          style: TextStyle(color: Colors.black),),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,

          child: Column(
            children: [


          Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: HeightController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Enter a height";
                  };




                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),

                  ),
                  labelText: "Height",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),

                  ),
                  ),
                ),),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: WeightController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "enetr a weight";
                    };
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),

                    ),
                    labelText: "Weight",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),

                    ),
                  ),
                ),),

              ElevatedButton(onPressed: (){
                calculate();

              },
                  child: Text('Calculate'),),
              Text(result.toStringAsFixed(2))
              
        ],
            ),
          ),
      ],
        ),

    );
  }

  void calculate() {

    double height=double.parse(HeightController.text)/100;
    double weight=double.parse(WeightController.text);
    double h=height*height;
    double results=weight/h;

    setState(() {
      result=results;
    });

  }
}
