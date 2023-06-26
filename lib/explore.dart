
import 'package:assessmentb/main.dart';
import 'package:assessmentb/contact.dart';
import 'package:assessmentb/network.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class Individual extends StatefulWidget{
  @override
  State<Individual> createState() => _IndividualState();
}

class _IndividualState extends State<Individual> {

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

  var _selectedValue = 0;

  Widget customRadio(String name, int index){
    return TextButton(
        onPressed: (){setState(() {
          _selectedValue = index;

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

        });},
        child: _selectedValue==index ? Text(name, style: TextStyle(color: Colors.white),) : Text(name, style: TextStyle(color: Colors.grey),));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.notes),
            onPressed: () {},
          ),
          backgroundColor: Color(0xFF243763), // Customize the background color of the app bar
          title: Column(
            children: [
              Text("Expore"),
              SizedBox(height: 5,),// Add some spacing between the icon and title
              Row(
                children: [
                  Icon(Icons.location_on_rounded,size: 15,),
                  Text("San Francisco,California",style: TextStyle(
                    fontSize: 15,
                  ),)
                ],
              ),
              Row(
                children: [

                ],
              )// Custom title widget
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {
                // Handle the overflow menu button press
              },
            ),
          ],
        ),
      ),

        body: Column(
          children : [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
              color: Color(0xFF243763),
              height: 50,
              child: Row(
                children: [
                  customRadio('INDIVIDUAL', 0),
                  Spacer(),
                  customRadio('PROFESSIONAL', 1),
                  Spacer(),
                  customRadio('MERCHANT', 2),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/background1.jpg"),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                    child:TextField(
                                      onChanged: (value) {
                                        // Handle the search query
                                        // Place your code here to perform search operations based on the entered value
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'Search',
                                        prefixIcon: Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                        ),
                                      ),
                                    ),
                              ),
                               SizedBox(width: 10,),
                               Icon(
                                Icons.manage_search_rounded,
                                color: Colors.black, // Color of the icon
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                    ),
                 customCard("images/shubham.png", "Shubham Maurya","San Francisco,within 1km","Friendship | Coffee | Hangout","Hi Community Iam open to new connection","+ INVITE"),
                  customCard("images/photo.jpg", "Chandan Gupta","San Francisco,within 1km","Coffee| Movies|Hangout","Going to Berkley,would love to share a ride with someone like minded.","+ INVITE"),
                  customCard("images/photo2.jpg","Santosh Maurya","San Francisco,within 1km","Friendship | Coffee | Hangout","Hi Community Iam open to new connection","+ INVITE"),
                  customCard("images/photo.jpg", "Chandan Gupta","San Francisco,within 1km","Coffee| Movies|Hangout","Going to Berkley,would love to share a ride with someone like minded.","+ INVITE"),
                ],
              ),
          ),
      ),
            ),
        ]),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF243763),
        items:[
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
            activeIcon:Image.asset("images/adjust.png",color: Colors.indigo.shade300,width: 30,height: 30,) ,
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
            activeIcon: Image.asset("images/contacts.png", color: Colors.indigo.shade300,)
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget customAppBar(){
    return Container(

    );
  }
}

Widget customCard(String image , String title1,String title2, String subtitle1,String subtitle2,
String invite){
  return Card(
    margin: EdgeInsets.all(15),
    child: Column(
      children :[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
          children: [
            ClipRRect(
                child: Image.asset(image,height: 100,width: 80, fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(10),
            ),
            Align(
              alignment: Alignment.center
              ,
              child: Column(
                children: [
                  Text(title1,style:TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize:20,
                  ),),
                  Text(title2,style: TextStyle(
                      fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    width: 150,
                    child: LinearProgressIndicator(
                      value: 0.75,
                      minHeight: 10,
                      color: Color(0xFF243763),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.topRight,
                child: OutlinedButton(onPressed:(null),
                  child:Text(invite) ,),
              ),
            ),
          ],),
        ),
        Text(subtitle1),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(subtitle2),
        ),
    ]),

  );
}

class Professional extends StatefulWidget{
  @override
  State<Professional> createState() => _ProfessionalState();
}

class _ProfessionalState extends State<Professional> {
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
    var _selectedValue = 1;

    Widget customRadio(String name, int index){
      return TextButton(
          onPressed: (){setState(() {
            _selectedValue = index;

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

          });},
          child: _selectedValue==index ? Text(name, style: TextStyle(color: Colors.white),) : Text(name, style: TextStyle(color: Colors.grey),));
    }

   return Scaffold(
     appBar: AppBar(
       leading: Icon(Icons.notes),
       backgroundColor: Color(0xFF243763), // Customize the background color of the app bar
       title: Column(
         children: [
           Text("Expore"),
           SizedBox(height: 5,),// Add some spacing between the icon and title
           Row(
             children: [
               Icon(Icons.location_on_rounded,size: 15,),
               Text("San Francisco,California",style: TextStyle(
                 fontSize: 15,
               ),)
             ],
           ), // Custom title widget
         ],
       ),
       actions: [
         IconButton(
           icon: Icon(Icons.notifications_outlined),
           onPressed: () {
             // Handle the overflow menu button press
           },
         ),
       ],
     ),
     body: Column(
           children : [
       Container(
       padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
       color: Color(0xFF243763),
       height: 50,
       child: Row(
         children: [
           customRadio('INDIVIDUAL', 0),
           Spacer(),
           customRadio('PROFESSIONAL', 1),
           Spacer(),
           customRadio('MERCHANT', 2),
         ],
       ),
   ),

         Expanded(
         child: SingleChildScrollView(
           child: Container(
           decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("images/background1.jpg"),
             fit: BoxFit.cover
   ),
    ),
    child: Column(
    children: [
    Padding(
    padding:  EdgeInsets.all(15.0),
    child: Container(
    margin: EdgeInsets.only(top: 10.0),
    child: Row(
    children: [
    Expanded(
    child:TextField(
    onChanged: (value) {
    // Handle the search query
    // Place your code here to perform search operations based on the entered value
    },

    decoration: const InputDecoration(
    hintText: 'Search',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),

    ),
    ),
    ),
    ),
    SizedBox(width: 10,),
    Icon(
    Icons.manage_search_rounded,
    color: Colors.black, // Color of the icon
    size: 40,
    ),
    ],
    ),
    ),
    ),
            customCard("images/photo3.jpg", "Shubham Maurya","San Francisco,within 1km","Friendship|Coffee| Hangout","Hi Community Iam open to new connection.","+ INVITE"),
            customCard("images/photo.jpg", "Chandan Gupta","San Francisco,within 1km","Coffee| Movies|Hangout","Going to Berkley,would love to share a ride with someone like minded.","+ INVITE"),
            customCard("images/photo2.jpg", "Santosh Maurya","San Francisco,within 1km","Friendship | Coffee | Hangout","Hi Community Iam open to new connection.","+ INVITE"),
          customCard("images/photo.jpg", "Chandan Gupta","San Francisco,within 1km","Coffee| Movies|Hangout","Going to Berkley,would love to share a ride with someone like minded.","+ INVITE"),
    ],
    ),
    ),
         ),
       ),
    ]),
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

class Merchant extends StatefulWidget{
  @override
  State<Merchant> createState() => _MerchantState();
}

class _MerchantState extends State<Merchant> {
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

    var _selectedValue = 2;

    Widget customRadio(String name, int index){
      return TextButton(
          onPressed: (){setState(() {
            _selectedValue = index;

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

          });},
          child: _selectedValue==index ? Text(name, style: TextStyle(color: Colors.white),) : Text(name, style: TextStyle(color: Colors.grey),));
    }



    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notes),
        backgroundColor: Color(0xFF243763), // Customize the background color of the app bar
        title: Column(
          children: [
            Text("Expore"),
            SizedBox(height: 5,),// Add some spacing between the icon and title
            Row(
              children: [
                Icon(Icons.location_on_rounded,size: 15,),
                Text("San Francisco,California",style: TextStyle(
                  fontSize: 15,
                ),)
              ],
            ), // Custom title widget
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {
              // Handle the overflow menu button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            color:Color(0xFF243763),
            height: 50,
            child: Row(
              children: [
                customRadio('INDIVIDUAL', 0),
                Spacer(),
                customRadio('PROFESSIONAL', 1),
                Spacer(),
                customRadio('MERCHANT', 2),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/background1.jpg"),
                      fit: BoxFit.cover
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(15.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child:TextField(
                                onChanged: (value) {
                                  // Handle the search query
                                  // Place your code here to perform search operations based on the entered value
                                },

                                decoration: const InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              Icons.manage_search_rounded,
                              color: Colors.black, // Color of the icon
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    customCard("images/photo2.jpg", "Santosh Maurya","San Francisco,within 1km","Friendship | Coffee | Hangout","Hi Community Iam open to new connection","+ INVITE"),
                    customCard("images/photo.jpg", "Chandan Gupta","San Francisco,within 1km","Coffee| Movies|Hangout","Going to Berkley,would love to share a ride with someone like minded.","+ INVITE"),
                    customCard("images/photo4.jpg", "Michael Murphy","San Francisco,within 1km","Friendship | Coffee | Hangout","Hi Community Iam open to new connection","+ INVITE"),
                    customCard("images/shubham.png", "Shubham Maurya","San Francisco,within 1km","Coffee| Movies|Hangout","Going to Berkley,would love to share a ride with someone like minded.","+ INVITE"),
                  ],
                ),
              ),
            ),
          ),
        ],
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

