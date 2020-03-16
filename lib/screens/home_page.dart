import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:pyco_test_flutter/blocs/tinder_bloc.dart';
import 'package:pyco_test_flutter/model/infomation.dart';
import 'package:pyco_test_flutter/widgets/TinderWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CardController _controller;
  List<Widget> _tinderList;
  TinderBloc _tinderBloc;
  bool _isSaved; //TODO

  @override
  void initState() {
    _isSaved = false;
    _tinderBloc = TinderBloc();
    _tinderBloc.getTinderInfo(10);
//    _tinderList = <Widget>[
//    TinderWidget(
//      user: user,
//    ),
////      Container(),
//    ];
    super.initState();
  }

  @override
  void dispose() {
    _tinderBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('=================build() Method===================');

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<List<User>>(
              stream: _tinderBloc.tinderStream,
              builder: (context, snapshot) {
//                User userTinder = User(
//                    picture: 'http://api.randomuser.me/portraits/men/33.jpg',
//                    username: 'TEST',
//                    phone: '0935336625',
//                    email: 'herman.warren81@example.com',
//                    location: Location(street: '8589 cavour ave '),
//                    registered: '1031891135');

                if (snapshot.hasError) {
                  return Text(
                    'PLEASE ENABLED WIFI',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  );
                }

                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TinderSwapCard(
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: snapshot.data.length,
                    stackNum: 30,
                    swipeEdge: 3.0,
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: MediaQuery.of(context).size.width,
                    minWidth: MediaQuery.of(context).size.width * 0.85,
                    minHeight: MediaQuery.of(context).size.width * 0.85,
                    cardBuilder: (context, index) => Card(
                      child: TinderWidget(
                        user: User(
                          //TODO: BUG - When swipe left or right then state of next card isn't right
                          username: snapshot.data[index].username,
                          registered: snapshot.data[index].registered,
                          location: Location(
                              street: snapshot.data[index].location.street),
                          phone: snapshot.data[index].phone,
                          email: snapshot.data[index].email,
                          picture: snapshot.data[index].picture,
                        ),
                      ),
//                      child: Text(snapshot.data[index].username),
                    ),
                    cardController: _controller = CardController(),
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /*if (align.x < 0) {
                        //Card is LEFT swiping
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                      }*/
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      /*if (orientation == CardSwipeOrientation.LEFT) {
                        print('CardSwipeOrientation.LEFT');
                      } else if (orientation == CardSwipeOrientation.RIGHT) {
                        print('CardSwipeOrientation.RIGHT');
                      }*/
                    },
                  ),
                );
              }),
        ),
      ),
    );
  }
}
