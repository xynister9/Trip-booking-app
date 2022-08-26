import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semesterproject/pages/welcome_page.dart';
import 'package:semesterproject/widgets/app_text.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  // final _priceFocusNode = FocusNode() ;
  final TextEditingController _imageController = TextEditingController();
  final _form = GlobalKey<FormState>();
  // Product _editProduct =
  //     Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  bool _isFirst = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _imageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isFirst) {
      String? idOfPrev = ModalRoute.of(context)!.settings.arguments as String?;
      if (idOfPrev != null) {
        // _editProduct =
        //     Provider.of<Products>(context, listen: false).findById(idOfPrev);
        // _imageController.text = _editProduct.imageUrl;
      } else {}
    }
    _isFirst = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      // Provider.of<Products>(context, listen: false)
      //     .updateProduct(_editProduct.id, _editProduct)
      //     .then((value) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   Navigator.of(context).pop();
      // });
    }
  }

  String? urlValidator(value) {
    if (value == '') {
      return 'Enter Something Bro';
    }
    if (!value!.startsWith('http') && !value.startsWith('https')) {
      return 'Enter a valid image url ';
    }
    // if (!value.endsWith('.png') || !value.endsWith('.jpeg')) {
    //   return 'Enter a image valid url ';
    // }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Info'),
        actions: [
          IconButton(onPressed: _saveForm, icon: const Icon(Icons.save))
        ],
      ),
      body: _isLoading? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                // initialValue: _editProduct.title,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  // _editProduct = Product(
                  //   id: (_editProduct.id == '' ? value! : _editProduct.id),
                  //   title: value!,
                  //   description: _editProduct.description,
                  //   price: _editProduct.price,
                  //   imageUrl: _editProduct.imageUrl,
                  // );
                },
                validator: (value) {
                  if (value == '') {
                    return 'Enter Something Bro';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                // initialValue:
                    // _editProduct.price > 0 ? _editProduct.toString() : '',
                decoration: const InputDecoration(
                  labelText: 'Number of Persons',
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  // _editProduct = Product(
                  //   id: _editProduct.id,
                  //   title: _editProduct.title,
                  //   description: _editProduct.description,
                  //   price: double.parse(value!),
                  //   imageUrl: _editProduct.imageUrl,
                  // );
                },
                validator: (value) {
                  if (value == '') {
                    return 'Enter Something Bro';
                  }
                  if (double.tryParse(value!) == null) {
                    return 'Enter a valid number ';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Enter a number greater than 0 ';
                  } else {
                    return null;
                  }
                },
              ),

              TextFormField(
                // initialValue: _editProduct.description,
                decoration: const InputDecoration(
                  labelText: 'Phone Number ',
                ),
                // maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  // _editProduct = Product(
                  //   id: _editProduct.id,
                  //   title: _editProduct.title,
                  //   description: value!,
                  //   price: _editProduct.price,
                  //   imageUrl: _editProduct.imageUrl,
                  // );
                },
                validator: (value) {
                  if (value == '') {
                    return 'Enter Something Bro';
                  } else {
                    return null;
                  }
                },
              ),
              

              TextFormField(
                // initialValue: _editProduct.description,
                decoration: const InputDecoration(
                  labelText: 'Date : From  ',
                ),
                // maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  // _editProduct = Product(
                  //   id: _editProduct.id,
                  //   title: _editProduct.title,
                  //   description: value!,
                  //   price: _editProduct.price,
                  //   imageUrl: _editProduct.imageUrl,
                  // );
                },
                validator: (value) {
                  if (value == '') {
                    return 'Enter Something Bro';
                  } else {
                    return null;
                  }
                },
              ),
              
              TextFormField(
                // initialValue: _editProduct.description,
                decoration: const InputDecoration(
                  labelText: 'Date : To  ',
                ),
                // maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  // _editProduct = Product(
                  //   id: _editProduct.id,
                  //   title: _editProduct.title,
                  //   description: value!,
                  //   price: _editProduct.price,
                  //   imageUrl: _editProduct.imageUrl,
                  // );
                },
                validator: (value) {
                  if (value == '') {
                    return 'Enter Something Bro';
                  } else {
                    return null;
                  }
                },
              ),
              

              TextButton(onPressed: (){}, child: AppText(text: 'Proceed to pay', color: AppColors.mainColor, bold: true )),
            ],
          ),
        ),
      ),
    );
  }
}
