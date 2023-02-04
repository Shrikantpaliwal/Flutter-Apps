import 'package:flutter/material.dart';

class InitialLandingPage extends StatelessWidget {
  final Function modelView;

  InitialLandingPage(this.modelView);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Image(image: AssetImage('assets/image/landing.jpg')),
        ),
        SizedBox(
          height: MediaQuery.of(context).devicePixelRatio * 25,
        ),
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: 130,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              modelView(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Let's Start",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
