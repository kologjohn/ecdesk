import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConsListViews extends StatelessWidget {
  ConsListViews({super.key});

  final List<String> items = List<String>.generate(20, (i) => "Item $i");
  int itemcount=0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Define the item width
    double itemWidth = 400.0;
    // Calculate the crossAxisCount dynamically
    int crossAxisCount = (screenWidth / itemWidth).floor();
    if(crossAxisCount<=1){
      crossAxisCount=1;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("POLLING STATION", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green[900],
      ),

      body: GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 2 / 0.8, // Aspect ratio to make rectangles (width/height)
        ),
        itemCount: items.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        "assets/svgs/ballot.svg",
                      width: 00,
                      height: 90,
                    )
                    //Icon(Icons.person, size: 80, color: Colors.green[900],)
                  ],
                ),
                Container(
                  height: 170,
                  width: 1,
                  color: Colors.grey,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("Polling Station:"),
                        const SizedBox(width: 8),
                        Text("Name", style: TextStyle(color: Colors.green[900])),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text("Polling Code:"),
                        const SizedBox(width: 8),
                        Text("Name", style: TextStyle(color: Colors.green[900])),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text("Male:"),
                            const SizedBox(width: 8),
                            Text("10,000", style: TextStyle(color: Colors.green[900])),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Text("Female:"),
                            const SizedBox(width: 8),
                            Text("20,000", style: TextStyle(color: Colors.green[900])),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text("Total:"),
                        const SizedBox(width: 8),
                        Text("30,000", style: TextStyle(color: Colors.green[900])),
                      ],
                    )
                  ],
                )
              ],
            )
          );
        },
      )
    );
  }
}
