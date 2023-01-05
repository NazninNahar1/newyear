import 'package:flutter/material.dart';

class CustomCircleWidget extends StatelessWidget {
  final IconData icon;
  final Color circleColor;
  final Color circleBorderColor;

  const CustomCircleWidget({
    super.key,
    required this.icon,
    required this.circleColor,
    required this.circleBorderColor,
  });

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
            alignment: const Alignment(1, .5),
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
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
