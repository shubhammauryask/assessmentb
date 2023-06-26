import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'explore.dart';
import 'main.dart';
import 'network.dart';

class Chat extends StatefulWidget{
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if(index == 0){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyHomeScreen()));
        }
        else if(index == 1){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Individual()));
        }
        else if(index == 2){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Network()));
        }
        else if(index == 3){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Chat()));
        }
        else if(index == 4){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Contacts()));
        }
      });
    }
   return Scaffold(
     body: Center(
       child: Container(
         child: const Text("Work On Progress Chat"),
       ),
     ),
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Color(0xFF243763),
       items: const [
         BottomNavigationBarItem(
           icon:ImageIcon(AssetImage("images/adjust.png"),
             size: 28,
           ),
           label:'',
           backgroundColor: Color(0xFF243763),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.remove_red_eye),
           label:" ",
           backgroundColor: Color(0xFF243763),
         ),
         BottomNavigationBarItem(
           icon: ImageIcon(AssetImage("images/network.png"),
             size: 28,
           ),
           label: "",
         ),
         BottomNavigationBarItem(
           icon: ImageIcon(AssetImage("images/chat.png"),
             size: 28,
           ),
           label: "",
         ),
         BottomNavigationBarItem(
           icon: ImageIcon(AssetImage("images/contacts.png"),
             size: 28,
           ),
           label: "",
         ),
       ],
       currentIndex: _selectedIndex,
       onTap: _onItemTapped,
     ),
   );
  }
}