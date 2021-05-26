import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vahak_assessment/Result/Result.dart';
import 'package:vahak_assessment/Utils/constants.dart';
import 'package:vahak_assessment/Utils/myColors.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class Quiz extends StatefulWidget {
  final topic;

  const Quiz({Key key, this.topic}) : super(key: key);
  @override
  _QuizState createState() => _QuizState(topic);
}

class _QuizState extends State<Quiz> {

  Timer _timer;
  final selected_topic;
  int _start = 5;
  CountDownController _timercontroller = CountDownController();
  int _duration = 10;
  List _questions = [];
  int question_number = 1;
  bool isQuizCompleted = false;
  var marks;

  _QuizState(this.selected_topic);



  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    getQuestionsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: MyColors.toolbarBlue,
          appBar: AppBar(
            backgroundColor: MyColors.toolbarBlue,
            leading: Container(),
            title: Text('${Constants.homeAppBarTitle}',style: TextStyle(
                fontSize: 18,color: MyColors.colorwhite
            ),),
            elevation: 0.0,
          ),
          body:_start!=0?showCountdownTimer():question_number==11?Container(
            color:MyColors.colorwhite,height: MediaQuery.of(context).size.height,
          ):quizWidget()
      );
  }

  Widget showCountdownTimer() {
    startTimer();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          question_number==11?Text('${Constants.quiz_completed_txt}', style: TextStyle(
              fontSize: 24, color: MyColors.colorwhite,fontWeight: FontWeight.bold
          ),):question_number>1?Text('${Constants.quiz_next_txt}', style: TextStyle(
        fontSize: 24, color: MyColors.colorwhite,fontWeight: FontWeight.bold
    ),):Text('${Constants.quiz_start_txt}', style: TextStyle(
              fontSize: 24, color: MyColors.colorwhite,fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('${_start}', style: TextStyle(
                fontSize: 24, color: MyColors.colorwhite,fontWeight: FontWeight.bold
            ),),
          ),

        ],
      ),
    );
  }

  Widget quizWidget()=>Column(
    children: <Widget>[
      circleTimer(),
      Text('Question ${question_number}',style: TextStyle(fontSize: 16,color: MyColors.colorwhite),),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text('${_questions[question_number-1]['question']}',style: TextStyle(fontSize: 16,
            color: MyColors.colorwhite,fontWeight: FontWeight.bold),),
      ),
      SizedBox(height: 20,),
      optionsBlock()

    ],
  );

  Widget optionsBlock()=>GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 28.0,
          mainAxisSpacing: 20.0
      ),
      itemCount: 4,
      itemBuilder:(BuildContext context,int index){

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () =>validateAnswer(index),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: index==0?Colors.cyan[800]:index==1?Colors.orange[600]:
                index == 2?Colors.green[500]:MyColors.toolbarBlue,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 6,
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: index==0?Text('${_questions[question_number-1]['A']}',style: TextStyle(
                      fontSize: 20,color: MyColors.colorwhite,fontWeight: FontWeight.w400
                  ),textAlign: TextAlign.center,):index == 1?Text('${_questions[question_number-1]['B']}',style: TextStyle(
                      fontSize: 20,color: MyColors.colorwhite,fontWeight: FontWeight.w400
                  ),textAlign: TextAlign.center,):index == 2?Text('${_questions[question_number-1]['C']}',style: TextStyle(
                      fontSize: 20,color: MyColors.colorwhite,fontWeight: FontWeight.w400
                  ),textAlign: TextAlign.center,):Text('${_questions[question_number-1]['D']}',style: TextStyle(
                      fontSize: 20,color: MyColors.colorwhite,fontWeight: FontWeight.w400
                  ),textAlign: TextAlign.center,),
                ),
              ),
            ),
          ),
        );

      });


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            _timer.cancel();
            timer.cancel();
            if(question_number==11){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(),
                ), //MaterialPageRoute
              );
            }

          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget circleTimer()=> CircularCountDownTimer(
    duration: 5,
    initialDuration: 0,
    controller: _timercontroller,
    width: MediaQuery.of(context).size.width / 4,
    height: MediaQuery.of(context).size.height / 4,
    ringColor: Colors.grey[300],
    ringGradient: null,
    fillColor: Colors.purpleAccent[100],
    fillGradient: null,
    backgroundColor: Colors.purple[500],
    backgroundGradient: null,
    strokeWidth: 20.0,
    strokeCap: StrokeCap.round,
    textStyle: TextStyle(
        fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
    textFormat: CountdownTextFormat.S,
    isReverse: false,
    isReverseAnimation: false,
    isTimerTextShown: true,
    autoStart: true,
    onStart: () {
      print('Countdown Started');
    },
    onComplete: () {
      print('Countdown Completed');
      setState(() {
        question_number +=1;
        Constants.not_answered +=1;
        marks = {'question':'${_questions[question_number-1]['question']}','answered':'Not Answered',
          'correct':'${_questions[question_number-1]['E']}','result':'2'};
        Constants.marks_details_list.add(marks);
        _start = 5;

      });
    },
    );

  void getQuestionsList() {
    List tempList = [];
    switch(selected_topic){
      case 'Cow' :
       tempList = Constants.cow_questions;

        break;
      case 'Horse':
        tempList = Constants.horse_questions;

        break;
      case 'Butterfly' :
        tempList = Constants.butterfly_questions;

        break;
      case 'Elephant':
        tempList = Constants.elephant_questions;

        break;
    }
    setState(() {
      _questions = tempList;
    });
  }

  validateAnswer(int option) {

    _timercontroller.pause();



    String selectedOption;
    switch(option){
      case 0:selectedOption ='A';
      break;
      case 1:selectedOption ='B';
      break;
      case 2:selectedOption ='C';
      break;
      case 3:selectedOption ='D';
      break;
    }
    if((_questions[question_number-1][selectedOption])==(_questions[question_number-1]['E'])){
      Constants.correct_answers += 1;
      marks = {'question':'${_questions[question_number-1]['question']}','answered':'${_questions[question_number-1][selectedOption]}',
        'correct':'${_questions[question_number-1]['E']}','result':'0'};
      correctAnswerAlert();

    }
    else{
      Constants.wrong_answers +=1;
      marks = {'question':'${_questions[question_number-1]['question']}','answered':'${_questions[question_number-1][selectedOption]}',
        'correct':'${_questions[question_number-1]['E']}','result':'1'};
      wrongAnswerAlert();
    }

    setState(() {

      Constants.marks_details_list.add(marks);

    });
    print('Result is Correct Answers : ${Constants.correct_answers}');
    print('Result is Wrong Answers : ${Constants.wrong_answers}');
    print('Result is Not Answerd : ${Constants.not_answered}');
  }

  correctAnswerAlert() {
    // Create button
    Widget okBtn = Container(
      width: MediaQuery.of(context).size.width,
       child: Center(
          child: RaisedButton(
            color: MyColors.buttonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              setState(() {
                _start = 5;
                question_number +=1;
              });
              Navigator.of(context).pop();
            },
            child: Text('OK',style: TextStyle(
                color: MyColors.colorwhite,fontSize: 16
            ),),
          ),
        )
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Icon(Icons.check,color: MyColors.buttonColor,size: 60,),
      content:Text('${Constants.right_answer}',style: TextStyle(
            fontSize: 20,color: MyColors.colorBlack,fontWeight: FontWeight.bold
        ),textAlign: TextAlign.center,),

      actions: [
        okBtn,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  wrongAnswerAlert() {
    // Create button
    Widget okBtn = Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RaisedButton(
            color: MyColors.buttonColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {
              setState(() {
                _start = 5;
                question_number +=1;
              });
              Navigator.of(context).pop();
            },
            child: Text('OK',style: TextStyle(
                color: MyColors.colorwhite,fontSize: 16
            ),),
          ),
        )
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Icon(Icons.clear,color: Colors.red,size: 60,),
      content: Text('${Constants.wrong_answer}',style: TextStyle(
              fontSize: 20,color: MyColors.colorBlack,fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),

      actions: [
        okBtn,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
