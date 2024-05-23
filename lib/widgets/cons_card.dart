import 'package:flutter/material.dart';

class ConstituencyCard extends StatelessWidget {
  const ConstituencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 176,
      decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        children: [
          Text("Upper East"),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius:  const BorderRadius.all(Radius.circular(8)),
                      color: Colors.green[900],
                    ),
                    child: const Center(child: Text(
                      "T",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                      ),
                    )
                    ),
                  )
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("10,000", style: TextStyle(fontSize: 16)),
                  Text("47%", style: TextStyle(fontSize: 16)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
