import 'package:flutter/material.dart';
import 'package:rest_api_practice/models/post.dart';
import 'package:rest_api_practice/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }
  getData() async{
    posts = await RemoteSevice().getPosts();
    if (posts !=null)
    {
      setState(() {
        isLoaded = true;
      });      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: const Text('Hi Bro..!!'),
              );
            },
            ),
        ),
    );
  }
}