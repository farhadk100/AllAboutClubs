import 'package:allaboutapps/Localisation/LanguageConstants.dart';
import 'package:allaboutapps/Maps/ClubsMap.dart';
import 'package:allaboutapps/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClubDetailView extends StatelessWidget {
  final Clubs club;
  const ClubDetailView({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          club.name!, style: Styles.instance.textStyle(color: Colors.white, fontSize: Styles.instance.mediumFont),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230 / Styles.instance.pixelRatio,
            width: double.maxFinite,
            color: Colors.grey.shade900,
            child: Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: club.id!,
                    child: CachedNetworkImage(imageUrl: club.image!,
                      width: 120 / Styles.instance.pixelRatio,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Styles.instance.padding10),
                      child: Text(
                        club.country!, style: Styles.instance.textStyle(color: Colors.white, fontSize: Styles.instance.veryBigFont),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(Styles.instance.padding10),
            child: Text(getTranslated(context, 'club_detail', placeHolders: {'name': club.name!, 'country': club.country!, 'value': club.value!.toString()}), style: Styles.instance.textStyle(),),
          )
        ],
      )
    );
  }
}
