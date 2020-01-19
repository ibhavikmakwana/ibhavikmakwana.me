import 'package:flutter/material.dart';
import 'package:ibhavikmakwana/utils/constants.dart';
import 'package:ibhavikmakwana/utils/extensions.dart';

class HelloWidget extends StatefulWidget {
  @override
  _HelloWidgetState createState() => _HelloWidgetState();
}

class _HelloWidgetState extends State<HelloWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _animation;
  double containerVerticalMargin = 0.0;
  double containerHorizontalMargin = 32;
  double containerWidth = 0.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _animation = ColorTween(
      begin: Colors.red,
      end: Colors.red.withOpacity(0),
    ).animate(_animationController);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (containerWidth == 0.0)
      containerWidth = MediaQuery.of(context).size.width;
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        containerWidth = MediaQuery.of(context).size.width / 2;
        containerVerticalMargin = 56;
        containerHorizontalMargin = 32;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) => RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 148.sdp,
                    fontFamily: 'MajorMonoDisplay',
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'He\nllo'.toUpperCase(),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(color: _animation.value),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
