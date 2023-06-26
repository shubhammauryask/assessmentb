import 'package:assessmentb/explore.dart';
import 'package:assessmentb/model/category_model.dart';
import 'package:assessmentb/network.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'contact.dart';

void main() {
  runApp(Assessment());
}

class Assessment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: "Refine Screen",
       debugShowCheckedModeBanner: false,
    theme:ThemeData(
     primarySwatch: Colors.blue
    ) ,
       home: MyHomeScreen(),
     );
  }
}

class MyHomeScreen extends StatefulWidget{
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
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

    var list = [
      ListCategory(image: Image.asset("images/individul.png",width: 40,height: 40,color: Colors.white), title: "Individual", description: "join and build real time community"),
      ListCategory(image: Image.asset("images/professional.png",width: 40,height: 40,color: Colors.white), title: "Professional", description: "World's largest real time Services community"),
      ListCategory(image: Image.asset("images/merchant.png",width: 40,height: 40,color: Colors.white), title: "Merchant", description: "World's largest real time merchant's community"),

    ];

   return Scaffold(
     body: Container(
       width:double.infinity,
      height:double.infinity,
       decoration: BoxDecoration(
         image: DecorationImage(image: AssetImage("images/background1.jpg"),
         fit: BoxFit.cover),
       ),


       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(130.0),
             child: Text("Join As",style: TextStyle(
               fontSize: 30,
               color: Color(0xFF243763),
               fontWeight: FontWeight.w800
             ),),
           ),

           Container(
             height: 300,
             child: ListView.builder(
               itemCount: list.length,
               itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    if(index == 0){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Individual()));
                    }
                    else if(index == 1){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Professional()));
                    }
                    else if(index == 2){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Merchant()));
                    }

                  },
                  child: Card(
                  elevation: 20,
                  shadowColor: Colors.green.shade900,
                  child: ListTile(
                   leading: CircleAvatar(child: list[index].image,radius: 35,backgroundColor:Color(0xFF243763)),
                   title: Text(list[index].title,style: TextStyle(
                   fontSize: 15,
                   color: Color(0xFF243763),
                   fontWeight: FontWeight.w800
                   ),),
                   subtitle: Text(list[index].description),
                  ),
                ),
              ),
                 );
             },
          ),
           ),
         ]
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
           label:'',
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