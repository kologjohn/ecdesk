import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Contents extends StatelessWidget {
final String name;
final int age;
final String voterid;
final String pscode;
final String sex;
final String image;
final String constituency;
final String region;
final String psname;
  const Contents({super.key, required this.name, required this.age, required this.voterid, required this.pscode, required this.sex, required this.image, required this.constituency, required this.region, required this.psname, });
  @override
  Widget build(BuildContext context,) {
    List<String> splitname=name.split(" ");
    String surname=splitname[0];
    String othername=name.replaceAll(surname, "");
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: FittedBox(
        //fit: BoxFit.contain,
        child: Container(
          decoration:  BoxDecoration(
              gradient: LinearGradient(colors: [Colors.cyan.shade100, Colors.grey.shade200])
          ),
          child: Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/CoA.png", width: 50,),
                  const SizedBox(width: 10),
                  const Text("ELECTORAL COMMISSION OF GHANA", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/flag.png", width: 50,)
                ],
              ),
              const Text("VOTER CARD", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: 120,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: SizedBox(
                          height: 50,
                            width: 50,
                            child: CircularProgressIndicator()
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset("assets/images/male.png"),
                    ),
                  ),
                  // Container(
                  //   decoration:  BoxDecoration(
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //         image: AssetImage(img3)
                  //     )
                  //   ),
                  //   height: 150,
                  //   width: 120,
                  // ),

                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Surname", style: const TextStyle(fontSize: 10,),),
                              Text("$surname", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                              Text("Other Names", style: const TextStyle(fontSize: 10,),),
                              Text("$othername", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),

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
                                              Text("Sex", style: const TextStyle(fontSize: 10,),),
                                              Text("$sex", style: const TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          const SizedBox(width: 120),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Reg. Age", style: const TextStyle(fontSize: 10,),),
                                              Text("$age", style: const TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text("Polling Station Code", style: TextStyle(fontSize: 10,),),
                                              Text("$pscode", style: const TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          const SizedBox(width: 60),
                                          const Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text("Date Of Registration", style: TextStyle(fontSize: 10,),),
                                              Text("2020/07/25", style: TextStyle(fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  QrImageView(
                                    data: '$name | $age | $psname | $region | $constituency',
                                    version: QrVersions.auto,
                                    size: 80.0,
                                  ),
                                  // Image.asset("assets/images/QRcode.png", width: 50,)
                                ],
                              ),

                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Voter Identification Number", style: const TextStyle(fontSize: 10,),),
                          Text("$voterid", style: const TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );

  }
}
