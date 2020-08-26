import 'package:flutter/material.dart';
import 'package:younginnovationinternship/Model/albums.dart';
import 'package:younginnovationinternship/Model/photos.dart';
import 'package:younginnovationinternship/Model/post.dart';
import 'package:younginnovationinternship/Model/users.dart';

class DataProvider with ChangeNotifier {
  //creating array for data
  List<UsersInfo> _userInfo = [];

  List<UsersInfo> get userInfo {
    return [..._userInfo];
  }

  List<UserLocation> _userLocation = [];

  List<UserLocation> get userLocation {
    return [..._userLocation];
  }

  List<UserAddress> _userAddress = [];

  List<UserAddress> get userAddress {
    return [..._userAddress];
  }

  List<UserCompany> _userCompany = [];

  List<UserCompany> get userCompany {
    return [..._userCompany];
  }

  List<PostDetails> _postDetails = [];

  List<PostDetails> get postDetails {
    return [..._postDetails];
  }

  List<PostComments> _postComments = [];

  List<PostComments> get postComments {
    return [..._postComments];
  }

  List<Albums> _album = [];

  List<Albums> get album {
    return [..._album];
  }

  List<Photo> _photo = [];

  List<Photo> get photo {
    return [..._photo];
  }
}
