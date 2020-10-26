import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
   static const String routeName = '/editProduct';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView( //if the form is very long => use column + singleChildScrollView
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next, //To the next input


              ),
            ],
          ),
        ),
      ),
    );
  }
}
