import 'package:flutter/material.dart';

class WrapItems extends StatelessWidget {
  const WrapItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> items=[];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: [
          Card(
            elevation: 2,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),

                height: 150,
                width: 370,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 3,
                        child: Image.asset(
                          "assets/images/profile.jpg",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "MALE",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Text(
                                "10,000",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.orange
                                ),
                              ),
                              SizedBox(width: 15),
                              Text("~"),
                              const SizedBox(width: 15),
                              Text(
                                "49%",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green[900]
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),

              height: 150,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 3,
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "FEMALE",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              "10,000",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange
                              ),
                            ),
                            SizedBox(width: 15),
                            Text("~"),
                            const SizedBox(width: 15),
                            Text(
                              "49%",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green[900]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),

              height: 150,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 3,
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "MINORS",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              "10,000",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange
                              ),
                            ),
                            SizedBox(width: 15),
                            Text("~"),
                            const SizedBox(width: 15),
                            Text(
                              "49%",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green[900]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),

              height: 150,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 3,
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "EXECUTIVES",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text(
                              "10,000",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.orange
                              ),
                            ),
                            SizedBox(width: 15),
                            Text("~"),
                            const SizedBox(width: 15),
                            Text(
                              "49%",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.green[900]
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
