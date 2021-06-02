import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vahak_assessment/Quiz/quiz.dart';
import 'package:vahak_assessment/Utils/constants.dart';
import 'package:vahak_assessment/Utils/myColors.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class HomeDetails extends StatefulWidget {
  final String catagory;

  const HomeDetails({Key key, this.catagory}) : super(key: key);
  @override
  _HomeDetailsState createState() => _HomeDetailsState(catagory);
}

class _HomeDetailsState extends State<HomeDetails> {
  final String _catagory;
  String _videoURL = '';
  String desc_txt = '';
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  String timelapse = '';
  List _notesList = [];
  TextEditingController notesController = TextEditingController();


  _HomeDetailsState(this._catagory);


  @override
  void initState() {

    getVideoUrl(_catagory);

    super.initState();
  }


  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showFab(),
      appBar:  AppBar(
        backgroundColor: MyColors.toolbarBlue,
        title: Text('${Constants.homeAppBarTitle}',style: TextStyle(
            fontSize: 18,color: MyColors.colorwhite
        ),),
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                videoPlayer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:12.0),
                  child: Text('${_catagory}',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: MyColors.colorBlack),),
                ),
                Text('${desc_txt}',style: TextStyle(
                    fontSize: 14,color: MyColors.colorBlack
                ),),
                savedNotes(),

              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:28.0,horizontal: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-200,
                    child: RaisedButton(
                      color: MyColors.toolbarBlue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      onPressed: () {
                        Navigator.of(context).push(new PageRouteBuilder(
                            opaque: true,
                            transitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context, _, __) {
                              return Quiz(topic: _catagory,);
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Quiz(topic: _catagory,),
                        //   ), //MaterialPageRoute
                        // );
                      },
                      child: Text('TAKE QUIZ',style: TextStyle(
                          color: MyColors.colorwhite,fontSize: 18
                      ),),
                    ),
                  ),
                )
            )
          ],
        )
      )
    );
  }

  Widget videoPlayer() =>Container(
    height: MediaQuery.of(context).size.height*0.4,
    width: MediaQuery.of(context).size.width,
    child: Chewie(
        controller: chewieController
    ),
  );

  Widget savedNotes()=>
      Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _notesList.length,
            itemBuilder:(BuildContext context,int index){
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('${_notesList[index]['time']}',style: TextStyle(
                      fontSize: 16,color: MyColors.toolbarBlue,fontWeight: FontWeight.w400
                  ),),
                  SizedBox(width: 20,),
                  Text('${_notesList[index]['notes']}',style: TextStyle(
                      fontSize: 16,color: MyColors.colorBlack,fontWeight: FontWeight.w400
                  ),)
                ],
              );
            }),
      );

  Widget showFab() =>FloatingActionButton(
    onPressed: (){
     displayBottomSheet();
     if(videoPlayerController.value.isPlaying){
       setState(() {
         videoPlayerController.pause();
         timelapse = '00.${videoPlayerController.value.position.inSeconds.toString()}s';
       });
     }
      print('this is the duration of the video : ${videoPlayerController.value.position.inSeconds.toString()}');
    },
    elevation: 5.0,
    backgroundColor: MyColors.toolbarBlue,
    child: Icon(Icons.note_add,color: MyColors.colorwhite,),
  );

  void getVideoUrl(String catagory) {
    String url,desc;
    switch(catagory){
      case 'Cow' :
        url = '${Constants.cow_url}';
        desc = '${Constants.cow_desc}';

        break;
      case 'Horse':
        url = '${Constants.horse_url}';
        desc = '${Constants.horse_desc}';

      break;
      case 'Butterfly' :
        url = '${Constants.butterfly_url}';
        desc = '${Constants.butterfly_desc}';

      break;
      case 'Elephant':
        url = '${Constants.elephant_url}';
        desc = '${Constants.elephant_desc}';

      break;
    }
    setState(() {
      _videoURL = url;
      desc_txt = desc;

      videoPlayerController = VideoPlayerController.network(_videoURL);

      chewieController = ChewieController(

          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoPlay: true,
          looping: false,
        showControls: true,

        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightGreen,
        ),
        placeholder: Container(
          color: Colors.grey,
        ),
        autoInitialize: true,
        allowFullScreen: false,
        allowMuting: true,
        allowedScreenSleep: false,
        fullScreenByDefault: false,
        cupertinoProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightGreen,
        ),

        showControlsOnInitialize: true

      );
    });
  }



  Widget makeNotesTextField()=>Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextFormField(
      controller: notesController,
      cursorColor: MyColors.colorBlack,
      cursorWidth: 1,
      maxLines: 4,
      keyboardType: TextInputType.multiline,
      style: TextStyle(fontSize: 16,color: MyColors.colorBlack,fontWeight: FontWeight.w300),
      decoration: InputDecoration(

          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintText: '${Constants.write_your_points}'
      ),
    ),
  );

  Widget submitButton()=>Padding(
    padding: const EdgeInsets.symmetric(vertical:28.0,horizontal: 20.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        color: MyColors.toolbarBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {
          addValuetoNotes();
        },
        child: Text('${Constants.save_btn_text}',style: TextStyle(
            color: MyColors.colorwhite,fontSize: 18
        ),),
      ),
    ),
  );



  displayBottomSheet() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
        context: context,builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left:12.0,right:12.0),
        child: Container(
          // height: MediaQuery.of(context).size.height*0.4,
          decoration: BoxDecoration(
            color: MyColors.colorwhite,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              makeNotesTextField(),
              SizedBox(height: 10,),
              submitButton()

            ],
          ),
        ),
      );
    });
  }

  addValuetoNotes() {
    var tempList = {'time':'$timelapse','notes':'${notesController.text}'};
    setState(() {
      _notesList.add(tempList);
      notesController.clear();

    if(!(videoPlayerController.value.isPlaying)){
      videoPlayerController.play();
    }
    });
    Navigator.pop(context);
    print('this is the notes list : ${_notesList}');
    // print('this is the notes list length : ${_notesList[1]['time']}');
  }

}
