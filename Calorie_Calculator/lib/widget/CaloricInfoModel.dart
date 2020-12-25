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
  Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 500.0, end: 250.0).animate(_controller)
      ..addListener(() {
        setState(() {});
        print("Animation" + _animation.value.toString());
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

    super.dispose();
  }

  Gender _gender = Gender.Male;
  String _selectedLocation = 'Daily';

  List<String> exerciseLevel = <String>[
    'Basal Metabolic Rate',
    'Little/no exercise',
    '3 times/week',
    '4 times/week',
    '5 times/week',
    'Daily',
    '5 times/week (intense)',
    'Daily (intense) or twice daily',
    'Daily exercise + physical job'
  ];
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
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Enter your Height in cm'),
                focusNode: _focusNode,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exercise level"),
                  DropdownButton<String>(
                      hint: Text('Please choose'),
                      value: _selectedLocation,
                      items: exerciseLevel.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
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
