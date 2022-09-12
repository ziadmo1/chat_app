import 'package:chat_now/base/base_viewModel.dart';
import 'package:chat_now/models/category_model.dart';
import 'package:chat_now/screens/add_room_screen/add_room_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'room';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseState<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {

  List<CategoryModel> categoryList = CategoryModel.categoryData();

  late CategoryModel categoryModel;

  @override
  AddRoomViewModel initViewModel() {
    return viewModel = AddRoomViewModel();
  }

  @override
  void initState() {
    super.initState();
    categoryModel = categoryList[0];
  }

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/background.png'))),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Add Room'),
            ),
            body: Card(
              elevation: 12,
              color: Colors.white,
              margin: EdgeInsets.all(36),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Create New Room',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Image.asset('assets/images/room_logo.png'),
                        TextFormField(
                          controller: nameController,
                          validator: (text){
                            if(text!.trim().isEmpty || text == null){
                              return 'Room Name must not be empty';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Enter Room Name',
                          ),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              border: Border.fromBorderSide(
                                  BorderSide(width: 1.5, color: Colors.grey))),
                          child: DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            underline: SizedBox(),
                            value: categoryModel,
                            items: categoryList.map((cat) {
                              return DropdownMenuItem<CategoryModel>(
                                value: cat,
                                child: Text(cat.name),
                              );
                            }).toList(),
                            onChanged: (item) {
                              if (item == null) return;
                              categoryModel = item as CategoryModel;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: descController,
                          validator: (text){
                            if(text!.trim().isEmpty || text == null){
                              return 'Room Description must not be empty';
                            }
                            return null;
                          },
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                          maxLines: 3,
                          minLines: 1,
                          decoration: InputDecoration(
                            labelText: 'Enter Room Description',
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                backgroundColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor)),
                            onPressed: () {
                              createRoom();
                            },
                            child: Text(
                              'Create Room',
                              style: Theme.of(context).textTheme.displayMedium,
                            )),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  createRoom(){
    if(formKey.currentState!.validate()){

      viewModel.newRoom(nameController.text,descController.text,categoryModel.id);
    }
  }

  @override
  void navigatorPop() {
    Navigator.pop(context);
  }
}
