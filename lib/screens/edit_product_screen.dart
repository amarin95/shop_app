import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
   static const String routeName = '/editProduct';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
 
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
                textInputAction: TextInputAction.next, //To the next input icon
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode); //TO FOCUS NODE
                } ,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next, //To the next input icon
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
