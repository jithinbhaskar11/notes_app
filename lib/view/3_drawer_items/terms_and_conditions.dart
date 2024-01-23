import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Terms and Conditions', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Acceptance of Terms',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              Text(
                'By accessing or using the Skink mobile application, you agree to comply with and be bound by these terms and conditions. If you do not agree with any part of these terms, please do not use the App.',
                style: TextStyle(fontSize: 16,color: Colors.black),
              ),
              Divider(height: 30,),
              Text('2.Use of the app',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. The App allows you to create, store, and manage notes. You are solely responsible for the content you create and store using the App \n'
                'b. You agree not to use the App to create, store, or transmit any content that is unlawful, harmful, threatening, abusive, harassing, defamatory, vulgar, obscene, or otherwise objectionable.',style: TextStyle(color: Colors.black),),
              Divider(height: 30,),
              Text('3.Privacy',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. Skink respects your privacy. Please refer to our Privacy Policy for information on how we collect, use, and disclose personal information.',style: TextStyle(color: Colors.black),),
              Divider(height: 30,),
              Text('4.Intellectual property',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. The App and its original content, features, and functionality are owned by Skink and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws.',style: TextStyle(color: Colors.black),),
              Divider(height: 30),
              Text('5.Disclaimer of warrenty',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. The App is provided "as is" without warranties of any kind, either express or implied \n'
                  'b. Skink does not warrant that the App will be error-free or uninterrupted, or that defects will be corrected.',style: TextStyle(color: Colors.black) ,),
              Divider(height: 30,),
              Text('7.Limitation of Liability',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. In no event shall Skink be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.',style: TextStyle(color: Colors.black),),
              Divider(height: 30,),
              Text('8.Changes to Terms',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. Skink reserves the right to modify or replace these terms at any time. Your continued use of the App after any changes constitute acceptance of the new terms.',style: TextStyle(color: Colors.black),),
              Divider(height: 30,),
              Text('9.Governing Law',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),),
              Text('a. These terms and conditions are governed by and construed in accordance with the laws of India.',style: TextStyle(color: Colors.black),)



            ],
          ),
        ),
      ),
    );
  }
}
