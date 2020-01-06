import 'package:flutter/material.dart';
import 'package:ibhavikmakwana/utils/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double containerVerticalMargin = 0.0;
  double containerHorizontalMargin = 32;
  double containerWidth = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (containerWidth == 0.0)
      containerWidth = MediaQuery.of(context).size.width;
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        containerWidth = MediaQuery.of(context).size.width / 2;
        containerVerticalMargin = 48;
        containerHorizontalMargin = 32;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 32, top: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.drag_handle),
                  onPressed: () {},
                ),
                Text('Bhavik Makwana'.toUpperCase()),
              ],
            ),
          ),
          AnimatedContainer(
            width: containerWidth,
            duration: Duration(milliseconds: kDefaultAnimationDuration),
            alignment: Alignment.centerLeft,
            color: Colors.red,
            margin: EdgeInsets.symmetric(
              vertical: containerVerticalMargin,
              horizontal: containerHorizontalMargin,
            ),
          ),
          Center(
            child: Text(
              'He\nllo'.toUpperCase(),
              style: TextStyle(
                fontSize: 128,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
