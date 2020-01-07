import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    Key key,
    this.onMenuPressed,
  }) : super(key: key);

  final VoidCallback onMenuPressed;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
    _animation = ColorTween(
      begin: Colors.black,
      end: Colors.black.withOpacity(0),
    ).animate(_animationController);
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, top: 16, bottom: 16),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.drag_handle),
            onPressed: widget.onMenuPressed,
          ),
          Text('Bhavik Makwana'.toUpperCase()),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => Container(
              width: 8,
              height: 12,
              color: _animation.value,
            ),
          ),
        ],
      ),
    );
  }
}
