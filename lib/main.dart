import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pyco_test_flutter/screens/home_page.dart';

void main() => runApp(MyApp());

/// PYCO TEST FLUTTER

/// 1. Create a tinder like carousel to swipe left and right random people. => DONE
/// 2. Every card in the app, has the details of person with person's image on top and icons on
/// bottom, name and other info from the ​api​. => DONE
/// 3. The card should look like the following: => DONE
/// 4. If I swipe left I get the details of the next person from the API.
/// => BUG - When swipe left or right then state of next card isn't right
/// * NOTE: Init 10 card, information get from api
/// 5. At the bottom there are multiple icons on touch the information changes. => DONE
/// 6. The user whom I swiped right should be stored as favourite. => TODO:
/// 7. My favourite list of people should be ​available offline​ also. => TODO:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}
