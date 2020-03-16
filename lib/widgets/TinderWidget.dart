import 'package:flutter/material.dart';
import 'package:pyco_test_flutter/model/infomation.dart';

class TinderWidget extends StatefulWidget {
  TinderWidget(
      {this.borderRadius = 5.0,
      this.activeIconColor = Colors.green,
      this.inActiveIconColor = Colors.grey,
      this.user});

  final double borderRadius;
  final Color activeIconColor;
  final Color inActiveIconColor;
  final User user;

  @override
  _TinderWidgetState createState() => _TinderWidgetState();
}

class _TinderWidgetState extends State<TinderWidget> {
  String _iconActive;
  String _title;
  String _titleContent;

  @override
  void initState() {
    _iconActive = 'username';
    _title = 'name';
    _titleContent = widget.user.username;
    super.initState();
  }

  void _handleActiveIcon(icon) {
    switch (icon) {
      case 'username':
        _iconActive = 'username';
        _title = 'name';
        _titleContent = widget.user.username; //TODO
        break;
      case 'date':
        _iconActive = 'date';
        _title = 'registered';
        _titleContent = widget.user.registered; //TODO
        break;
      case 'place':
        _iconActive = 'place';
        _title = 'address';
        _titleContent = widget.user.location.street;
        break;
      case 'call':
        _iconActive = 'call';
        _title = 'call';
        _titleContent = widget.user.phone;
        break;
      case 'lock':
        _iconActive = 'lock';
        _title = 'email';
        _titleContent = widget.user.email; //TODO
        break;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: 400,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70.0,
                    color: Color(0xFF263238),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 70.0,
                      color: Color(0xFFE0E0E0),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(widget.borderRadius),
                                topRight: Radius.circular(widget.borderRadius),
                              ),
                            ),
                          ),
                          Container(
                            height: 220.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(widget.borderRadius),
                                bottomRight:
                                    Radius.circular(widget.borderRadius),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 70,
                                ),
                                Container(
                                  height: 100,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'My $_title is',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        _titleContent,
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: IconButton(
                                        icon: Icon(Icons.public),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          _handleActiveIcon('username');
                                        },
                                        color: _iconActive == 'username'
                                            ? widget.activeIconColor
                                            : widget.inActiveIconColor,
                                      ),
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: IconButton(
                                        icon: Icon(Icons.date_range),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          _handleActiveIcon('date');
                                        },
                                        color: _iconActive == 'date'
                                            ? widget.activeIconColor
                                            : widget.inActiveIconColor,
                                      ),
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: IconButton(
                                        icon: Icon(Icons.place),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          _handleActiveIcon('place');
                                        },
                                        color: _iconActive == 'place'
                                            ? widget.activeIconColor
                                            : widget.inActiveIconColor,
                                      ),
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: IconButton(
                                        icon: Icon(Icons.call),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          _handleActiveIcon('call');
                                        },
                                        color: _iconActive == 'call'
                                            ? widget.activeIconColor
                                            : widget.inActiveIconColor,
                                      ),
                                    ),
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      child: IconButton(
                                        icon: Icon(Icons.lock),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          _handleActiveIcon('lock');
                                        },
                                        color: _iconActive == 'lock'
                                            ? widget.activeIconColor
                                            : widget.inActiveIconColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(0xFFBDBDBD), width: 1.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipOval(
                              child: FadeInImage.assetNetwork(
                                  fadeInCurve: Curves.easeInOut,
                                  fit: BoxFit.cover,
                                  placeholder: 'assets/loading.png',
                                  image: widget.user.picture),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
