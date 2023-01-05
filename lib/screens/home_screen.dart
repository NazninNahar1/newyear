import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'custom_cicle_widget.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  double boxX =-1;
  bool istapped =false;
  var boxColor =Color(0xff12B76A);
  String text ='Turned off';

  bool TapToggle(){
    return istapped = !istapped;
  }


  void ontapped(){
    setState(() {
        MoveBox();
        changeBoxColor();
        changeText();
        TapToggle();
      print('tapped');
    });
  }
  void MoveBox(){
    setState(() {
      if(istapped==false){
        boxX=1;
      }else{
        boxX=-1;
      }
    });
  }
  void changeBoxColor(){
    setState(() {
      if(istapped==false){
        boxColor = Color(0xfffd3535);
      }else{
        boxColor =Color(0xff12B76A);
      }
    });
  }
  void changeText(){
    setState(() {

      if(istapped==false){
        text = 'Turn Off';
      }else{
        text = 'Turn On';
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff005981),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffD0D7DD),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        CustomCircleWidget(
                          icon: Icons.play_arrow,
                          circleColor: Colors.green,
                          circleBorderColor: Color(0xffe4ffce),
                        ),
                        CustomCircleWidget(
                          icon: Icons.pause_outlined,
                          circleColor: Colors.red,
                          circleBorderColor: Color(0xffffd9ce),
                        ),
                        CustomCircleWidget(
                          icon: Icons.settings,
                          circleColor: Colors.orange,
                          circleBorderColor: Color(0xfffadcba),
                        ),
                        CustomCircleWidget(
                          icon: Icons.sentiment_very_satisfied_sharp,
                          circleColor: Colors.indigo,
                          circleBorderColor: Color(0xffb2c2fa),
                        ),
                        CustomCircleWidget(
                          icon: Icons.sentiment_very_dissatisfied,
                          circleColor: Colors.blue,
                          circleBorderColor: Color(0xffcef2fd),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: ontapped,
                        child: AnimatedContainer(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          duration: Duration(milliseconds: 100),
                          child: Row(
                            children:[
                              Stack(children: [
                                Center(
                                  child: Row(
                                    children:  [
                                      const SizedBox(width:100 ),
                                      const Icon(Icons.power_settings_new,color: Colors.white,),
                                      Text(text,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 300,
                                  child: AnimatedContainer(
                                    duration:  Duration(milliseconds: 100),
                                    alignment: Alignment(boxX,0),
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.all(8),
                                      height: 50,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),

                                    ),
                                  ),
                                )

                              ],),

                            ] ,
                          ),
                        ),
                      )
                    ],
                  ),)
            ],
          ),
        ),
      ),
    );
  }
}
//

