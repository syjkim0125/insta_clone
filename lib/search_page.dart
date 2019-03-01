import 'package:flutter/material.dart';
import 'package:insta_clone/create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
          },
          child: Icon(Icons.create),
          backgroundColor: Colors.blue),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
        'https://w.namu.la/s/4096979c867712ca5ccc2fc212bb71a6e2d81835025e3fca62341fe16357dc2086b66fc3247fe8eeecc1abb85097e7273a32085ec1d0ad1c5bc5c4a044a6742e6fd78b89aa539e32f95ec8b552a9c162dd859a32884686389f977b7da631bab8',
        fit: BoxFit.cover);
  }
}
