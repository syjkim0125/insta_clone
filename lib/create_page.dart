import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEdtingController = TextEditingController();

  File _image;

  @override
  void dispose() {
    textEdtingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            final firebaseStorageRef = FirebaseStorage.instance
                .ref()
                .child('post')
                .child('${DateTime.now()}.png');

            final task = firebaseStorageRef.putFile(
                _image, StorageMetadata(contentType: 'image/png'));

            task.onComplete.then((value) {
              var downloadUrl = value.ref.getDownloadURL();

              downloadUrl.then((uri) {
                var doc = Firestore.instance.collection('post').document();
                doc.setData({
                  'id': doc.documentID,
                  'photoUrl': uri.toString(),
                  'contents': textEdtingController.text,
                  'email': widget.user.email,
                  'displayName': widget.user.displayName,
                  'userphotoUrl': widget.user.photoUrl
                }).then((onValue) {
                  Navigator.pop(context);
                });
              });
            });
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        _image == null ? Text('No Image') : Image.file(_image),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
          controller: textEdtingController,
        )
      ],
    ));
  }

  Future _getImage() async {
    File image = await ImagePicker.pickImage(
        source:
            ImageSource.gallery); // Future는 미래에 파일이 될 것 이라는 뜻. 비동기 방식으로 동작함.

    setState(() {
      _image = image;
    });
  }
}
