import 'package:flutter/material.dart';
class CustomAnimatedButton extends StatefulWidget {

  CustomAnimatedButton({Key? key,}) : super(key: key);

  @override
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  double boxX =-1;
  bool istapped =false;
  Color boxColor=Color(0xff12B76A);
  String text = 'Turn Off';

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
    return  Row(
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
      );

  }
}
