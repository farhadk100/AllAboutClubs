import 'package:allaboutapps/Localisation/LanguageConstants.dart';
import 'package:allaboutapps/Maps/ClubsMap.dart';
import 'package:allaboutapps/Model/ClubListModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../styles.dart';

class ClubCard extends StatelessWidget {
  final Clubs club;
  const ClubCard({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(Styles.instance.padding10),
            child: Row(
              children: [
                Hero(
                  child: CachedNetworkImage(imageUrl: club.image!,
                    width: 80 / Styles.instance.pixelRatio,
                  ),
                  tag: club.id!,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(Styles.instance.padding10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(club.name!, style: Styles.instance.textStyle(fontSize: Styles.instance.veryBigFont, fontWeight: FontWeight.bold),),
                        Text(club.country!, style: Styles.instance.textStyle(fontSize: Styles.instance.verySmallFont, color: Colors.black54),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('${club.value!} ${getTranslated(context, 'value_millions')}', style: Styles.instance.textStyle(fontSize: Styles.instance.bigFont),),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black54,
            height: 0,
          ),
        ],
      ),
    );
  }
}
