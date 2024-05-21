import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:google_fonts/google_fonts.dart';

class Global {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 67, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;

  static const Color primaryColor = Color(0xFF2697FF);
  static const Color secondaryColor = Color(0xFF2A2D3E);
  static const Color bgColor = Color(0xFF212332);

  static const defaultPadding = 16.0;
  static final nameheader=GoogleFonts.aboreto(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white);
  static final smallsize=GoogleFonts.aboreto(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white);
  static final normalsize=GoogleFonts.aboreto(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white);
  static final semiSmallSize=GoogleFonts.aboreto(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black);
  static final mobileSemiSmallSize=GoogleFonts.aboreto(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black);
  static final semiSmallSizeBlack=GoogleFonts.aBeeZee(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white);
  static final ndc=GoogleFonts.aBeeZee(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.green[900]);


 static final entries = <ContextMenuEntry>[
    const MenuHeader(text: "Context Menu"),
    MenuItem(
      label: 'NDC',
      icon: Icons.umbrella,
      onSelected: () {
        // implement copy
      },
    ),
    MenuItem(
      label: 'NPP',
      icon: Icons.rectangle,
      onSelected: () {
        // implement paste
      },
    ),
   MenuItem(
     label: 'Floating',
     icon: Icons.paste,
     onSelected: () {
       // implement paste
     },
   ),
    const MenuDivider(),
    // MenuItem.submenu(
    //   label: 'Others',
    //   icon: Icons.edit,
    //   items: [
    //     MenuItem(
    //       label: 'Undo',
    //       value: "Undo",
    //       icon: Icons.undo,
    //       onSelected: () {
    //         // implement undo
    //       },
    //     ),
    //     MenuItem(
    //       label: 'Redo',
    //       value: 'Redo',
    //       icon: Icons.redo,
    //       onSelected: () {
    //         // implement redo
    //       },
    //     ),
    //   ],
    // ),
  ];

}
