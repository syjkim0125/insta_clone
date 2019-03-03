import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://w.namu.la/s/4096979c867712ca5ccc2fc212bb71a6e2d81835025e3fca62341fe16357dc2086b66fc3247fe8eeecc1abb85097e7273a32085ec1d0ad1c5bc5c4a044a6742e6fd78b89aa539e32f95ec8b552a9c162dd859a32884686389f977b7da631bab8'),
                    ),
                  ),
                  Container(
                      width: 80.0,
                      height: 80.0,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 28.0,
                            height: 28.0,
                            child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: FloatingActionButton(
                                onPressed: null,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add)),
                          ),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Text(
                '이름',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              )
            ],
          ),
          Text('0\n게시물',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
          Text('0\n팔로워',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
          Text('0\n팔로잉',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }
}
