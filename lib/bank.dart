import 'questions.dart';

class Bank {
  int _num = 0;
  List<Questions> _quest = [
    Questions(
        a: 'Approximately one quarter of human bones are in the feet', b: true),
    Questions(
        a: 'The average person will shed 10 pounds of skin during their lifetime.',
        b: true),
    Questions(a: 'Sneezes regularly exceed 100 m.p.h.', b: true),
    Questions(a: 'The Great Wall Of China is visible from the moon.', b: false)
  ];
  int number() {
    if (_num <=_quest.length-1) {
      _num++;
    }
    return _num;
  }
  bool end()
  {
    if(_num==_quest.length)
    {
      return true;
    }
    else {
      return false;
    }
  }
  void reset()
  {
    _num=0;
  }
  String getquestions()
  {
    return _quest[_num].questions;
  }
  bool getans()
  {
    return _quest[_num].ans;
  }
}
