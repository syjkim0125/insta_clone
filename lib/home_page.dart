import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Instagram에 오신 것을 환영합니다.',
                style: TextStyle(fontSize: 24.0),
              ),
              Padding(padding: EdgeInsets.all(8.0)),
              Text('사진과 동영상을 보려면 팔로우하세요'),
              Padding(padding: EdgeInsets.all(8.0)),
              SizedBox(
                  width: 260.0,
                  child: Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.all(4.0)),
                            SizedBox(
                              width: 80.0,
                              height: 80.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(user.photoUrl),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(8.0)),
                            Text(user.email,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(user.displayName),
                            Padding(padding: EdgeInsets.all(8.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network(
                                      'https://w.namu.la/s/4096979c867712ca5ccc2fc212bb71a6e2d81835025e3fca62341fe16357dc2086b66fc3247fe8eeecc1abb85097e7273a32085ec1d0ad1c5bc5c4a044a6742e6fd78b89aa539e32f95ec8b552a9c162dd859a32884686389f977b7da631bab8',
                                      fit: BoxFit.cover),
                                ),
                                Padding(padding: EdgeInsets.all(8.0)),
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network(
                                      'https://w.namu.la/s/4096979c867712ca5ccc2fc212bb71a6e2d81835025e3fca62341fe16357dc2086b66fc3247fe8eeecc1abb85097e7273a32085ec1d0ad1c5bc5c4a044a6742e6fd78b89aa539e32f95ec8b552a9c162dd859a32884686389f977b7da631bab8',
                                      fit: BoxFit.cover),
                                ),
                                Padding(padding: EdgeInsets.all(8.0)),
                                SizedBox(
                                  width: 70.0,
                                  height: 70.0,
                                  child: Image.network(
                                      'https://w.namu.la/s/4096979c867712ca5ccc2fc212bb71a6e2d81835025e3fca62341fe16357dc2086b66fc3247fe8eeecc1abb85097e7273a32085ec1d0ad1c5bc5c4a044a6742e6fd78b89aa539e32f95ec8b552a9c162dd859a32884686389f977b7da631bab8',
                                      fit: BoxFit.cover),
                                )
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(4.0)),
                            Text('Facebook 친구'),
                            Padding(padding: EdgeInsets.all(4.0)),
                            RaisedButton(
                              child: Text('팔로우'),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                            Padding(padding: EdgeInsets.all(4.0)),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      )),
    );
  }
}
