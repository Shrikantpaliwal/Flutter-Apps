import 'package:flutter/material.dart';

enum Gender { Male, Female }

class CaloricInfoModel extends StatefulWidget {
  @override
  _CaloricInfoModelState createState() => _CaloricInfoModelState();
}

class _CaloricInfoModelState extends State<CaloricInfoModel> {
  Gender _gender = Gender.Male;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Please Enter details below",
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter your Age'),
            ),
            Row(
              //To-Do : Fix Alignment Issue
              children: [
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
            )
          ],
        ));
  }
}
