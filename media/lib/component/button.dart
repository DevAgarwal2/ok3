import "package:flutter/material.dart";

class myButton extends StatelessWidget {
  final String name;
  final Function()? ontap;
  const myButton({super.key, required this.name, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
       
        width: 300,
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.brown.shade900,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),
        ),
      ),
    );
  }
}
