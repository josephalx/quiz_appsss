import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'bank.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Quiz(),
          ),
        ),
      ),
    ),
  );
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> score = [];
  Icon t = Icon(
    Icons.check_circle,
    color: Colors.green,
    size: 30.0,
  );
  Icon f = Icon(
    Icons.close,
    color: Colors.red,
    size: 30.0,
  );
  Bank bank = new Bank();
  int sc = 0;
  @override
  Widget build(BuildContext context) {
    void ans(bool ans) {
      setState(() {
        if (ans == bank.getans()) {
          score.add(t);
          sc++;
          print(bank.number());
        } else {
          score.add(f);
          print(bank.number());
        }

        if (bank.end() == true) {
          var alertStyle = AlertStyle(
            animationType: AnimationType.fromTop,
            isCloseButton: false,
            titleStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
            descStyle: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
            backgroundColor: Colors.grey[900],
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.00),
            ),
          );
          Alert(
              context: context,
              style: alertStyle,
              title: 'End of Quiz',
              desc: 'You have reached the end,\n You\'re score is $sc',
              buttons: [
                DialogButton(
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.white,fontSize: 20.0),
                  ),
                  onPressed: () => Navigator.pop(context),
                  color: Colors.grey[900],
                ),
              ]).show();

          bank.reset();
          score = [];
          sc = 0;
        }
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              bank.getquestions(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.green,
              child: Text('True'),
              onPressed: () {
                setState(() {
                  ans(true);
                });
                print('true');
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  ans(false);
                });
                print('false');
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: score,
          ),
        ),
      ],
    );
  }
}
