import 'package:bmi_weight_calculator/toggle_button.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double result = 0.00;
  int flag = 0;
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications),
            color: Colors.white,
          ),
        ],
        leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlueAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
      ),
      backgroundColor: const Color(0xFFf7f6f4),

      body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Height in INCH',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lime),
                            )
                          ),
                          controller: height,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "Weight in KG",
                            labelStyle: TextStyle(
                              color: Colors.grey
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lime),
                            )
                          ),
                          controller: weight,
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                      // child: const ToggleButton(),
                      child: Row(
                        children: [
                          TextButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.greenAccent),
                            ),
                              onPressed: (){
                                setState(() {
                                  result = (703 * double.parse(weight.text) * 2.205 / pow(double.parse(height.text), 2) );
                                  flag = 1;
                                });
                              },
                              child: const Text(
                                'MALE',
                              ),
                          ),
                          TextButton(
                            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.greenAccent)),
                              onPressed: (){
                                setState(() {
                                  result = (703 * double.parse(weight.text) * 2.205 / pow(double.parse(height.text), 2) );
                                  flag = 0;
                                });
                              },
                              child: const Text('FEMALE'))
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 20, right: 20, bottom: 20),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Age in Year",
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            // gapPadding: 4.0,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lime,
                            ),
                          ),
                        ),
                        controller: age,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Text(
                  "Result: ${result.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                child: flag == 0? Text(((){
                  if(result < 0 && result < 17.5){
                    return "'You are underweight'";
                  }
                  else if(result > 17.5 && result < 24){
                    return "Great!!! You are normal";
                  }
                  else if(result > 24 && result < 29){
                    return "You are overweight!";
                  }
                  else if(result > 29 && result < 34){
                    return "You are severe overweight!!";
                  }
                  else if(result > 34){
                    return "You are very obese";
                  }
                  return " ";
                })(),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ): Text(((){
                  if(result < 0 && result < 18.4){
                    return "'You are underweight'";
                  }
                  else if(result > 18.5 && result < 24.9){
                    return "Great!!! You are normal";
                  }
                  else if(result > 24.9 && result < 29.9){
                    return "You are overweight!";
                  }
                  else if(result > 29.9 && result < 34.9){
                    return "You are severe overweight!!";
                  }
                  else if(result >=35 ){
                    return "You are very obese";
                  }
                  return " ";
                })(),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              SizedBox(
                height: 350,
                child: flag == 0?
                Image.asset("assets/bmiWomen.png", fit: BoxFit.fill,):
                Image.asset("assets/bmiMen.png", fit: BoxFit.fill,),
              )
            ],
          )),
    );
  }
}
