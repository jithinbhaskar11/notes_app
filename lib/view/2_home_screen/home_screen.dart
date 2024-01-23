
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/view/2_home_screen/spec_screen.dart';
import 'package:notes_app/view/3_drawer_items/privacy_policy.dart';
import 'package:notes_app/view/3_drawer_items/support.dart';
import 'package:notes_app/view/3_drawer_items/terms_and_conditions.dart';



class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {

  final catList=[
    'No category selected',
    'Personal',
    'Work',
    'Health',
    'Fitness',
    'Education',
    'Finances',
    'Home',
    'Social',
    'Entertainment',
    'Travel',
    'Shopping',
    'Family',
    'Hobbies',
    'Events',
    'Errands',
    'Calls/Emails',
    'Project Management',
    'Reading',
    'Spiritual',
    'Career',
  ];

  final titleController=TextEditingController();
  final descController=TextEditingController();

  var box = Hive.box<NotesModel>('noteBox');


  String? selectedVal;
  droplist(){
    selectedVal=catList[0];
  }

bool isSwitched=false;

  @override
  void initState() {
    droplist();
    getData();
    super.initState();
  }


  List<NotesModel> getData() {
    return box.values.toList();
  }
  void updateData(int index, String newTitle, String newDescription,
      String newCategory,) {
    final dataToUpdate = box.getAt(index);
    if (dataToUpdate != null) {
      dataToUpdate.title = newTitle;
      dataToUpdate.description = newDescription;
      dataToUpdate.category= newCategory;
      box.putAt(index, dataToUpdate);

    }
  }
  void deleteData(int index) {
    box.deleteAt(index);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('SK',style: TextStyle(color: Colors.white),),
            Text('INK',style: TextStyle(color: Colors.blue),)
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(dataList: getData()),
              );

            },
          ),
        ],
        backgroundColor: Colors.purple,

        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body:
      ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: box.listenable(),
        builder: (context, box,_) {
          List<NotesModel> dataList = box.values.toList();
          return Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          dataList.isEmpty? Center(
            child: Text(
              'Add Your Notes',style: TextStyle(color: Colors.blue[100],fontWeight: FontWeight.bold,fontSize: 30),
            ),
          ):
          ListView.separated(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
          return Slidable(
          startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
          SlidableAction(
          onPressed: (context) {
            titleController.text=dataList[index].title;
            descController.text=dataList[index].description;
            showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (context) {
              return Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 100
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                            labelStyle: TextStyle(color: Colors.purple),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          )
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: descController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                          labelStyle: TextStyle(color: Colors.purple),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                        ),
                      ),
                      SizedBox(height: 10,),

                      DropdownButtonFormField(
                        value: selectedVal,
                        items: catList.map(
                                (e){
                              return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.purple),),value: e,);
                            }
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedVal=value;
                          });
                        },
                        icon: Icon(Icons.arrow_drop_down,color: Colors.purple,),
                        dropdownColor: Colors.purple[50],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                            labelText: 'Select Category',
                            labelStyle: TextStyle(color: Colors.purple),
                            prefixIcon: Icon(Icons.category_rounded,color: Colors.purple,)
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(onPressed: (){
                            if(titleController.text!=''||descController.text!=''){
                              updateData(index, titleController.text, descController.text, selectedVal.toString());
                              titleController.clear();
                              descController.clear();
                              Get.back();
                              Get.snackbar('Updated successfully', '',colorText: Colors.white);
                            }else{
                              Get.snackbar('Please fill all feilds', '',colorText: Colors.red);
                            }
                          },
                            child: Text('Update'),color: Colors.purple,),
                          SizedBox(width: 10,),
                          MaterialButton(onPressed: (){},child: Text('Cancel'),color: Colors.purple[100],),

                        ],
                      )
                    ],
                  ),
                ),
              );
            },);
          },
          backgroundColor: Colors.amber,
          icon: Icons.edit,
          ),
          ],
          ),
          endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
          onPressed: (context){
            Get.defaultDialog(
              title: 'Delete?',
               content: Text('Are you sure, you want to delete the note?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      Get.back();
                    }, child: Text('Cancel')),
                    TextButton(onPressed: (){
                      deleteData(index);
                      Get.back();
                      Get.snackbar('Deleted successfully', '',colorText: Colors.white);
                    }, child: Text('Delete',style: TextStyle(color: Colors.red),)),
                  ],
                )
              ]
            );
          },
          backgroundColor: Colors.red,
          icon: Icons.delete,
          )],),
          child: Card(
          child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          '${dataList[index].title}',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
          ),
          SizedBox(
          height: 10,
          ),
          Text('${dataList[index].description}',style: TextStyle(color: Colors.black),),
          SizedBox(
          height: 10,
          ),
          Text('${dataList[index].category}',style: TextStyle(color: Colors.black),)
          ],
          ),
          ),
          ),
          );
          },
          separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
          height: 20,
          );
          },
          )
          ,
          );
        }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          context: context, builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 100),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      labelStyle: TextStyle(color: Colors.purple),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    )
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: descController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.purple),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                    ),
                  ),
                  SizedBox(height: 10,),

                  DropdownButtonFormField(
                      value: selectedVal,
                      items: catList.map(
                              (e){
                            return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.purple),),value: e,);
                          }
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedVal=value;
                        });
                      },
                    icon: Icon(Icons.arrow_drop_down,color: Colors.purple,),
                    dropdownColor: Colors.purple[50],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      labelText: 'Select Category',
                      labelStyle: TextStyle(color: Colors.purple),
                      prefixIcon: Icon(Icons.category_rounded,color: Colors.purple,)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(onPressed: (){
                        if(titleController.text!=''&&descController.text!=''){
                          box.add(NotesModel(title: titleController.text, description: descController.text, category: selectedVal.toString()));
                          titleController.clear();
                          descController.clear();
                          selectedVal='No category selected';
                          Get.back();
                          Get.snackbar('Saved successfully', 'swipe left to DELETE and swipe right to EDIT',colorText: Colors.white);
                        }
                        else{
                          Get.snackbar('Please fil all feilds', '',colorText: Colors.red);
                        }
                      },
                        child: Text('Save'),color: Colors.purple,),
                      SizedBox(width: 10,),
                      MaterialButton(onPressed: (){
                        Get.back();
                      },child: Text('Cancel'),color: Colors.purple[100],),

                    ],
                  )
                ],
              ),
            ),
          );
        },);
      },child: Icon(Icons.add),backgroundColor: Colors.purple[900],),

      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Container(
                width: double.infinity,
                height: 200,
                child: Icon(Icons.speaker_notes,size: 200,color: Colors.greenAccent,),
              ),
              Divider(height: 10,),

              Expanded(child: ListView(
                children: [
                  ListTile(
                    onTap: (){
                      Get.to(TermsAndConditions());
                    },
                    leading: Icon(Icons.newspaper,color: Colors.purple,),
                    title: Text('Terms and Conditions',style: TextStyle(color: Colors.purple),),
                  ),
                  Divider(height: 10,),
                  ListTile(
                    onTap: (){
                      Get.to(Support_Screen());
                    },
                    leading: Icon(Icons.contact_support,color: Colors.purple,),
                    title: Text('Support',style: TextStyle(color: Colors.purple),),
                  ),
                  Divider(height: 10,),
                  ListTile(
                    onTap: (){
                      Get.to(PrivacyPolicy());
                    },
                    leading: Icon(Icons.privacy_tip,color: Colors.purple,),
                    title: Text('Privacy policy',style: TextStyle(color: Colors.purple),),
                  ),
                  Divider(height: 10,),
                  ListTile(
                    leading: Icon(Icons.dark_mode,color: Colors.purple,),
                      title: Text('Dark/Light mode',style: TextStyle(color: Colors.purple),),
                    trailing: Switch(value: isSwitched,
                        onChanged: (value){
                      setState(() {
                        // Get.changeTheme(ThemeData.dark());
                        isSwitched=value;
                        if (value) {
                          Get.changeTheme(ThemeData.dark());
                        } else {
                          Get.changeTheme(ThemeData.light());
                        }
                      });
                        }),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
class CustomSearchDelegate extends SearchDelegate<String> {
  final List<NotesModel> dataList;

  CustomSearchDelegate({required this.dataList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Handle specific card display based on the search query
    return buildCard(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions based on the search query
    final suggestionList = dataList
        .where((note) =>
    note.title.toLowerCase().contains(query.toLowerCase()) ||
        note.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion.title),
          subtitle: Text(suggestion.description),
          onTap: () {
            // Navigate to a new screen and display the specific card details
            Get.to(SpecificCardScreen(specificCard: suggestion));
          },
        );
      },
    );
  }

  Widget buildCard(String title) {
    // Build and return the specific card based on the selected suggestion
    final specificCard = dataList.firstWhere(
          (note) => note.title.toLowerCase() == title.toLowerCase(),
      orElse: () => NotesModel(title: '', description: '', category: ''),
    );

    return Card(
      // Customize your card UI based on specificCard
      child: ListTile(
        title: Text(specificCard.title),
        subtitle: Text(specificCard.description),
      ),
    );
  }
}


