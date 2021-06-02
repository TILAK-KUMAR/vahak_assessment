import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:vahak_assessment/Utils/constants.dart';
import 'package:vahak_assessment/Utils/myColors.dart';


class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Map<String, double> resultMap = {
    // "Correct Answer": 2,
    "Correct Answer": Constants.correct_answers.toDouble(),
    // "Wrong Answer": 5,
    "Wrong Answer": Constants.wrong_answers.toDouble(),
    // "Not Answered": 3,
    "Not Answered": Constants.not_answered.toDouble(),
  };
  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('this is marks card : ${Constants.marks_details_list}');
    // PieChart(dataMap: resultMap);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: MyColors.toolbarBlue,
        title: Text('${Constants.homeAppBarTitle}',style: TextStyle(
            fontSize: 18,color: MyColors.colorwhite
        ),),
        elevation: 5.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ScoreCard(),
              ),
              SizedBox(height: 20,),
              Text('${Constants.report_summary}',style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[400]
              ),),
              SizedBox(height: 20,),
              chartWidget(),
              SizedBox(height: 20,),
              MarksList(),



            ],
          ),
        )
      )
    );
  }

  Widget ScoreCard()=>Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: MyColors.colorwhite,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.6),
          spreadRadius: 3,
          blurRadius: 3,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20,),
        Text('${Constants.correct_answers}',style: TextStyle(
          fontSize: 28,fontWeight: FontWeight.bold,color: MyColors.colorBlack
        ),),
        SizedBox(height: 30,),
        Text('${Constants.max_marks}',style: TextStyle(
            fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[500]
        ),),
      ],
    ),
  );

  Widget chartWidget()=>Container(
      decoration: BoxDecoration(
        color: MyColors.colorwhite,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical:18.0,horizontal: 10.0),
          child: PieChart(
            dataMap: resultMap,
            animationDuration: Duration(seconds: 3),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            centerText: '${Constants.correct_answers}',
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              // legendShape: _BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:18.0),
          child: Text('You have completed quiz in ${Constants.total_time_taken} seconds',style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[400])),
        )
      ],
    )
  );

  Widget MarksList()=>ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: Constants.marks_details_list.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context,int index){

      return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child:Container(
        decoration: BoxDecoration(
          color: MyColors.colorwhite,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width-100,
                  child:   Text('Question : ${Constants.marks_details_list[index]['question']}',style: TextStyle(
                      fontSize: 12,color: MyColors.colorBlack
                  )),
                ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text('Answered : ${Constants.marks_details_list[index]['answered']}',style: TextStyle(
                        fontSize: 12,color: Colors.grey),softWrap: false),
                  ),
                  Text('Correct Answer : ${Constants.marks_details_list[index]['correct']}',style: TextStyle(
                      fontSize: 12,color: MyColors.buttonColor),softWrap: false),
                  Constants.marks_details_list[index]['time_taken']=='-'?Text('Answered In : Not Answered',style: TextStyle(
                      fontSize: 12,color: Colors.grey),softWrap: false):
                  Constants.marks_details_list[index]['time_taken']=='1'?Text('Answered In : ${Constants.marks_details_list[index]['time_taken']} second',style: TextStyle(
                      fontSize: 12,color: Colors.grey),softWrap: false):Text('Answered In : ${Constants.marks_details_list[index]['time_taken']} seconds',style: TextStyle(
                      fontSize: 12,color: Colors.grey),softWrap: false),
                ],
              ),
              Constants.marks_details_list[index]['result']=='0'?Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: MyColors.buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ):Constants.marks_details_list[index]['result']=='1'?Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ):Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ));
      });
}
