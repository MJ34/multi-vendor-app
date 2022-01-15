import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:multi_vendor/firebase_services.dart';
import 'package:multi_vendor/widget/banner_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BrandHighLights extends StatefulWidget {
  const BrandHighLights({Key? key}) : super(key: key);

  @override
  State<BrandHighLights> createState() => _BrandHighLightsState();
}

class _BrandHighLightsState extends State<BrandHighLights> {
  double _scrollPosition = 0;
  final FirebaseServices _services = FirebaseServices();
  final List _brandAds = [];

  @override
  void initState() {
    getBrandAd();
    super.initState();
  }

  getBrandAd() {
    return _services.brandAd.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          _brandAds.add(doc);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Brand HighLights',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 20),
              ),
            ),
          ),
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: PageView.builder(
              itemCount: _brandAds.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                height: 100,
                                color: Colors.deepOrange,
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: _brandAds[index]['youtube'],
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: true,
                                      mute: true,
                                      loop: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    height: 50,
                                    color: Colors.red,
                                    child: CachedNetworkImage(
                                      imageUrl: _brandAds[index]['image3'],
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => GFShimmer(
                                          child: Container(
                                        height: 50,
                                        color: Colors.grey.shade300,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    height: 50,
                                    color: Colors.red,
                                    child: CachedNetworkImage(
                                      imageUrl: _brandAds[index]['image2'],
                                      fit: BoxFit.fill,
                                      placeholder: (context, url) => GFShimmer(
                                          child: Container(
                                        height: 50,
                                        color: Colors.grey.shade300,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              height: 160,
                              color: Colors.blue,
                              child: CachedNetworkImage(
                                imageUrl: _brandAds[index]['image1'],
                                fit: BoxFit.fill,
                                placeholder: (context, url) => GFShimmer(
                                    child: Container(
                                  height: 50,
                                  color: Colors.grey.shade300,
                                )),
                              ),
                            ),
                          ),
                        ))
                  ],
                );
              },
              onPageChanged: (val) {
                setState(() {
                  _scrollPosition = val.toDouble();
                });
              },
            ),
          ),
          _brandAds.isEmpty
              ? Container()
              : DotsIndicatorWidget(
                  scrollPosition: _scrollPosition,
                  itemList: _brandAds,
                )
        ],
      ),
    );
  }
}
