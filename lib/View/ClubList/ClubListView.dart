import 'package:allaboutapps/Localisation/LanguageConstants.dart';
import 'package:allaboutapps/Model/ClubListModel.dart';
import 'package:allaboutapps/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ErrorScreenView.dart';
import 'ClubCard.dart';

class ClubListView extends StatelessWidget {
  const ClubListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ClubListModel>(
      builder: (context, model, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(
              getTranslated(context, 'app_name'), style: Styles.instance.textStyle(color: Colors.white, fontSize: Styles.instance.mediumFont),),
            actions: [
              IconButton(onPressed: () => model.sortClub(), icon: Icon(Icons.filter_list),)
            ],
          ),
          body: Builder(
            builder: (context){
              if (model.getLoadingState() == 'success')
                return _itemsView(model);
              else if (model.getLoadingState() == 'loading')
                return Center(child: CircularProgressIndicator());
              else
                return ErrorScreen(callBack: model.refresh);
            },
          ),
        );
      },
    );
  }

  _itemsView(ClubListModel model){
    return ListView.builder(
      itemCount: model.getClassCount(),
      itemBuilder: (context, index){
        return InkWell(
            onTap: () => model.openClubDetails(index),
            splashColor: Colors.green,
            child: ClubCard(club: model.getMyClubsMap().clubs![index])
        );
      },
    );
  }
}
