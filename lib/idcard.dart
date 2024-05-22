import 'package:flutter/material.dart';

class Contents extends StatelessWidget {

  const Contents({super.key, });

  @override
  Widget build(BuildContext context, ) {
    return Column(
      children: [
        Content().content(
            'assets/images/CoA.png',
            'assets/images/flag.png',
            'assets/images/passport.png',
            'assets/images/QRcode.png',
            'ELECTORAL COMMISSION OF GHANA ',
            'VOTER CARD',
            'Surname',
            'KOLOG',
            'OtherNames',
            'WRIGHT NAYA',
            'Sex',
            'MALE',
            'Date of Birth',
            '1998/02/07',
            'Polling Station Code',
            'R091302',
            'date of Registration',
            '2020/07/25',
            'Voter Identification Number',
            '7283008255',
        )
      ],
    );
  }
}
class Content {
  content(
      String img1, String img2, String img3,String img4,
      String text1, String text2, String text3,
      String text4, String text5, String text6,
      String text7, String text8, String text9,
      String text10, String text11, String text12,
      String text13, String text14, String text15,String text16,

      ){
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(colors: [Colors.cyan.shade100, Colors.white])
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(img1, width: 50,),
                    Text(text1),
                    Image.asset(img2, width: 50,)
                  ],
                ),
                const SizedBox(height: 5),
                Text(text2, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration:  BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage(img3)
                        )
                      ),
                      height: 150,
                      width: 120,
                    ),

                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(text3, style: const TextStyle(fontSize: 10,),),
                                Text(text4, style: const TextStyle(fontWeight: FontWeight.bold),),
                                Text(text5, style: const TextStyle(fontSize: 10,),),
                                Text(text6, style: const TextStyle(fontWeight: FontWeight.bold),),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(text7, style: const TextStyle(fontSize: 10,),),
                                                Text(text8, style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            const SizedBox(width: 120),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(text9, style: const TextStyle(fontSize: 10,),),
                                                Text(text10, style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(text11, style: const TextStyle(fontSize: 10,),),
                                                Text(text12, style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            const SizedBox(width: 60),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(text13, style: const TextStyle(fontSize: 10,),),
                                                Text(text14, style: const TextStyle(fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Image.asset(img4, width: 50,)
                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(text15, style: const TextStyle(fontSize: 10,),),
                            Text(text16, style: const TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
