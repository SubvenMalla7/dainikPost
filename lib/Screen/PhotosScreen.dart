import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:younginnovationinternship/Model/dataProvider.dart';
import 'package:younginnovationinternship/Model/photos.dart';
import 'package:younginnovationinternship/Widgets/mainUiWidget.dart';

class PhotoScreen extends StatelessWidget {
  static const routeName = "/photo";
  final int albumId;

  const PhotoScreen({Key key, this.albumId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final PhotoScreen args = ModalRoute.of(context).settings.arguments;
    final photoList = Provider.of<DataProvider>(context).photo;
    final filteredPhotoList =
        photoList.where((photo) => photo.albumId == args.albumId).toList();
    print(filteredPhotoList.length);
    return SafeArea(
      child: Scaffold(
        body: buildMainUi(
          heading: "Photo",
          context: context,
          padding: const EdgeInsets.only(left: 68.0, top: 40, bottom: 20),
          body: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image:
                                NetworkImage(filteredPhotoList[i].thumbnailUrl),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: screenSize.height * 0.10,
                      width: screenSize.height * 0.14,
                      margin: const EdgeInsets.all(2),
                    ),
                childCount: filteredPhotoList.length),
          ),
        ),
      ),
    );
  }
}
