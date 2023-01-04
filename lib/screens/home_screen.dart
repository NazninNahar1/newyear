import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
                    children: [],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCircleWidget extends StatelessWidget {
  final IconData icon;
  final Color circleColor;
  final Color circleBorderColor;


  const CustomCircleWidget(
      {super.key, required this.icon,
      required this.circleColor,
      required this.circleBorderColor,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                width: 2,
                color: circleBorderColor,
              ),
            ),
            child: const Center(
                child: Text(
              '00',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: circleColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
                child: Text(
              '00',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
          Align(
            alignment: Alignment(1, .5),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: circleBorderColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: Icon(
                icon,
                color: circleColor,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
