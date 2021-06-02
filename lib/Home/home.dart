import 'package:flutter/material.dart';
import 'package:vahak_assessment/HomeDetails/homeDetails.dart';
import 'package:vahak_assessment/Utils/constants.dart';
import 'package:vahak_assessment/Utils/myColors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _list = Constants.catagories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBlue,
      appBar: AppBar(
        backgroundColor: MyColors.toolbarBlue,
        title: Text('${Constants.homeAppBarTitle}',style: TextStyle(
          fontSize: 18,color: MyColors.colorwhite
        ),),
        elevation: 5.0,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text('${Constants.select_topic}',style: TextStyle(color: MyColors.colorwhite,
                fontSize: 40,fontWeight: FontWeight.w400),),
            SizedBox(
              height: 50,
            ),
            catagoryGrid()


          ],
        ),
      ),
    );
  }

  Widget catagoryGrid() =>GridView.builder(
    shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 28.0,
          mainAxisSpacing: 32.0
      ),
      itemCount: _list.length,
      itemBuilder:(BuildContext context,int index){

        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(new PageRouteBuilder(
                  opaque: true,
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (BuildContext context, _, __) {
                    return HomeDetails(catagory: _list[index],);
                  },
                  transitionsBuilder: (_, Animation<double> animation, __, Widget child) {

                    return new SlideTransition(
                      child: child,
                      position: new Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                    );
                  }
              ));
            },
            child: Container(
              height: 50,
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
                  child: Text('${_list[index]}',style: TextStyle(
                    fontSize: 24,color: MyColors.colorwhite,fontWeight: FontWeight.w400
                  ),),
                ),
              ),
            ),
          ),
        );

  });
}
