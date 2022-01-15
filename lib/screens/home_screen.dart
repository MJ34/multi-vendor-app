import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_vendor/widget/brand_highlight.dart';
import 'package:multi_vendor/widget/banner_widget.dart';
import 'package:multi_vendor/widget/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      // reduce app bar heigt
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Shop App', style: TextStyle(letterSpacing: 2),),
          actions: [
            IconButton(
              icon: const Icon(CupertinoIcons.cart),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: ListView(
        children: const [
          SearchWidget(),
          SizedBox(
            height: 10,
          ),
          BannerWidget(),
          BrandHighLights(),
          CategoryWidget()
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                  hintText: 'Masukkan kata kunci',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, size: 20, color: Colors.grey,)
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Icon(CupertinoIcons.rosette, size: 12, color: Colors.white,),
                  Text(' 100% Genuine', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),
              Row(
                children: const [
                  Icon(CupertinoIcons.airplane, size: 12, color: Colors.white,),
                  Text(' 4 - 7 days return', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),
              Row(
                children: const [
                  Icon(CupertinoIcons.checkmark_seal, size: 12, color: Colors.white,),
                  Text(' Trusted Brands', style: TextStyle(color: Colors.white, fontSize: 12),)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
