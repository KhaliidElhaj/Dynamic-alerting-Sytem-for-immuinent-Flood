import 'package:flutter/material.dart';


//used to display orb like containers, two parameters(the text and the variable)
Container buildStatCont(statText,stat) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.white10.withOpacity(1),
      ),
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(40),
    ),
    height: 100,
    width: 100,
    child: Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            statText+':',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            stat,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
        ],
      ),
    ),
  );
}


