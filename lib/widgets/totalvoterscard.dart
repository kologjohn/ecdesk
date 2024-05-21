import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class totalvoter extends StatelessWidget {
  const totalvoter({
    super.key,
    required this.mycolors,
    required this.regionalcode,
    required this.numformat1,
    required this.totals, required this.totalper, required this.regionName,
  });

  final Color mycolors;
  final String regionalcode;
  final NumberFormat numformat1;
  final String totals;
  final String totalper;
  final String regionName;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Tooltip(
        message: regionName,
        child: Container(
          height: 60,
          width: 176,
          decoration: BoxDecoration(
              color: Colors.black54.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(4))
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(8)),
                      color: mycolors,
                    ),
                    child: Center(
                        child: Text(
                          regionalcode,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        )
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(numformat1.format(int.parse(totals)), style: TextStyle(fontSize: 16),),
                   Text("${totalper}%", style: TextStyle(fontSize: 16),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
