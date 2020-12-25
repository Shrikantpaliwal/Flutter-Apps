import 'package:flutter/material.dart';

enum Gender { Male, Female }

class CaloricInfoModel extends StatefulWidget {
  @override
  _CaloricInfoModelState createState() => _CaloricInfoModelState();
}

class _CaloricInfoModelState extends State<CaloricInfoModel>
    with SingleTickerProviderStateMixin {
  //Animation Beta
  AnimationController _controller;

  TextEditingController _controllerAge;
  TextEditingController _controllerHeight;
  TextEditingController _controllerWeight;

  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controllerAge = TextEditingController();
    _controllerHeight = TextEditingController();
    _controllerWeight = TextEditingController();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 500.0, end: 250.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _controllerAge.dispose();
    _controllerHeight..dispose();
    _controllerWeight..dispose();
    super.dispose();
  }

  Gender _gender = Gender.Male;

  static const Map<String, double> exerciseLevel = {
    'Basal Metabolic Rate': 1,
    'Little/no exercise': 1.2,
    '3 times/week': 1.375,
    '4 times/week': 1.4187,
    '5 times/week': 1.4625,
    'Daily': 1.550,
    '5 times/week (intense)': 1.6375,
    'Daily (intense) or twice daily': 1.725,
    'Daily exercise + physical job': 1.9,
  };

  double _selectedLocation = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: InkWell(
        // to dismiss the keyboard when the user tabs out of the TextField
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Please Enter details below",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter your Age'),
                controller: _controllerAge,
              ),
              Row(
                //To-Do : Fix Alignment Issue
                children: [
                  Text("Gender"),
                  Radio(
                      value: Gender.Male,
                      groupValue: _gender,
                      onChanged: (Gender value) {
                        setState(() {
                          _gender = value;
                        });
                      }),
                  Text("Male"),
                  Radio(
                      value: Gender.Female,
                      groupValue: _gender,
                      onChanged: (Gender value) {
                        setState(() {
                          _gender = value;
                        });
                      }),
                  Text("Female")
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Enter your Weight in Kg'),
                controller: _controllerWeight,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Enter your Height in cm'),
                controller: _controllerHeight,
                focusNode: _focusNode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exercise level"),
                  DropdownButton<String>(
                      hint: Text('Please choose'),
                      value: _selectedLocation.toString(),
                      items: exerciseLevel
                          .map((String desc, double value) {
                            return MapEntry(
                                desc,
                                DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(desc),
                                ));
                          })
                          .values
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = double.parse(newValue);
                        });
                      })
                ],
              ),
              SizedBox(
                height: 4,
              ),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {},
              ),
              SizedBox(
                height: _animation.value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
