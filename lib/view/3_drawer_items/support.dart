import 'package:flutter/material.dart';

class Support_Screen extends StatelessWidget {
  const Support_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Support',style: TextStyle(fontWeight: FontWeight.bold,),),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          height: 200,
          decoration: BoxDecoration(
              color: Colors.purple[50],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail,color: Colors.purple,),
              SizedBox(height: 30,),
              Text('Contact Information',style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black ),),
              Text('jithinbhskar11@gmail.com',style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
      ),
    );
  }
}
