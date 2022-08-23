import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 60),
        _buildButton(context,'/login', "Login", Colors.white, Colors.green),
        const SizedBox(height: 40),
        _buildButton(context,'/signup', "Register", Colors.brown, Colors.white),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildButton(BuildContext context,
      String path, String text, Color textClr, Color buttonClr) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Center(
        child: Container(
          width: 200,
          height: 60,
          decoration: BoxDecoration(
            color: buttonClr,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(3, 3),
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: Colors.black26),
            ],
          ),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                      fontSize: 25,
                      color: textClr,
                      fontWeight: FontWeight.w500))),
        ),
      ),
    );
  }
}
