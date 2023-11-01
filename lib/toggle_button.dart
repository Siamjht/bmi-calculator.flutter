import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late List<bool> isSelected;

  @override
  void initState(){
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
              borderColor: Colors.black,
              fillColor: Colors.indigo,
              borderWidth: 1,
              selectedBorderColor: Colors.black,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(10),
              onPressed: (int index){
                setState(() {
                  for(int i = 0; i < isSelected.length; i++){
                    isSelected[i] = i == index;
                  }
                });
              },
              isSelected: isSelected,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'MALE',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'FEMALE',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
  }
}
