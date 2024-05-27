import 'package:flutter/material.dart';

import 'card_info.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({
    super.key, required this.info,
  });

  final CardInfo info;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Image.asset(info.src, width: 50,height: 50,),
            ),
            const SizedBox(height: 8),
            Text(info.name, style: const TextStyle(color: Colors.black, fontSize: 12),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(info.num, style: const TextStyle(color: Colors.black54, fontSize: 12),),
                const SizedBox(width: 5),
                const Text("~", style: TextStyle(color: Colors.black54),),
                const SizedBox(width: 5),
                Text("96.94%", style: TextStyle(color: Colors.green[900], fontSize: 12),),
              ],
            ),
            //const SizedBox(height: 8,),
            Icon(Icons.front_hand, color: Colors.green[900],size: 20,),
            //const SizedBox(height: 8,),
            Text(info.title, style: const TextStyle(color: Colors.black54, fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
