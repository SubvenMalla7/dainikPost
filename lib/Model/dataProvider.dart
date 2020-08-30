import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:younginnovationinternship/Model/photos.dart';

import 'albums.dart';

import 'post.dart';
import 'users.dart';

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

  List<Albums> _album = [];

  List<Albums> get album {
    return [..._album];
  }

  List<Photo> _photo = [];

  List<Photo> get photo {
    return [..._photo];
  }

  List<PostDetails> _postDetails = [];
  List<PostDetails> get postDetails {
    return [..._postDetails];
  }

  List<PostComments> _postComments = [];

  List<PostComments> get postComments {
    return [..._postComments];
  }

  url(String link) =>
      "https://jsonplaceholder.typicode.com/$link"; //universal link

  postDetail() {}

  Future<void> userDataFetch() async {
    try {
      final respose = await http.get(url("users/"));
      final extractedData = json.decode(respose.body);
      final List<UsersInfo> loadedUserInfo = [];
      final List<UserAddress> loadedUserAddress = [];
      final List<UserLocation> loadedUserLocation = [];
      final List<UserCompany> loadedUserCompany = [];

      extractedData.forEach((data) {
        // print(data["address"]["street"]);
        loadedUserInfo.add(UsersInfo(
          id: data["id"],
          name: data["name"],
          email: data["email"],
          username: data["username"],
          phone: data["phone"],
          website: data["website"],
        ));
      });
      extractedData.forEach((data) {
        loadedUserAddress.add(UserAddress(
          street: data["address"]["street"],
          suite: data["address"]["suite"],
          city: data["address"]["city"],
          zipcode: data["address"]["zipcode"],
        ));
      });
      extractedData.forEach((data) {
        loadedUserCompany.add(UserCompany(
          name: data["company"]["name"],
          catchPhrase: data["company"]["catchPhrase"],
          bs: data["company"]["bs"],
        ));
      });

      extractedData.forEach((data) {
        loadedUserLocation.add(UserLocation(
            lat: data["address"]["geo"]["lat"],
            lng: data["address"]["geo"]["lng"]));
      });

      _userInfo = loadedUserInfo;
      _userAddress = loadedUserAddress;
      _userCompany = loadedUserCompany;
      _userLocation = loadedUserLocation;

      print(_userInfo[0].id);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future postDetailData() async {
    print("object");
    final List<PostDetails> loadedPostDetails = []; //
    for (int i = 0; i < _userInfo.length; i++) {
      var userId = _userInfo[i].id;

      final response = await http.get(url("users/$userId/posts"));
      final extractedData = json.decode(response.body);
      extractedData.forEach((data) {
        // print(data["id"]);
        loadedPostDetails.add(PostDetails(
            id: data["id"],
            userId: data["userId"],
            title: data["title"],
            body: data["body"]));
      });
    }
    _postDetails = loadedPostDetails;
    print("object");
    print(_postDetails[9].id);
    notifyListeners();
  }

  Future postCommentsData() async {
    print("comments");
    final List<PostComments> loadedPostComments = []; //
    for (int i = 0; i < _postDetails.length; i++) {
      var postDetailId = _postDetails[i].id;

      final response = await http.get(url("posts/$postDetailId/comments"));
      final extractedData = json.decode(response.body);
      extractedData.forEach((data) {
        loadedPostComments.add(PostComments(
          id: data["id"],
          postId: data["postId"],
          name: data["name"],
          email: data["email"],
          body: data["body"],
        ));
      });
    }
    _postComments = loadedPostComments;
    print("comments");
    print(_postComments[9].id);
    notifyListeners();
  }

  Future albumData() async {
    print("album");
    final List<Albums> loadedAlbums = []; //
    for (int i = 0; i < _userInfo.length; i++) {
      var userId = _postDetails[i].id;

      final response = await http.get(url("users/$userId/albums"));
      final extractedData = json.decode(response.body);
      extractedData.forEach((data) {
        loadedAlbums.add(Albums(
          id: data["id"],
        ));
      });
    }
    _album = loadedAlbums;
    print(_album[9].id);
    notifyListeners();
  }

  Future photoData() async {
    print("album");
    final List<Photo> loadedPhoto = []; //
    for (int i = 0; i < _album.length; i++) {
      var albumId = _album[i].id;

      final response = await http.get(url("albums/$albumId/photos"));
      final extractedData = json.decode(response.body);
      extractedData.forEach((data) {
        loadedPhoto.add(Photo(
          id: data["id"],
        ));
      });
    }
    _photo = loadedPhoto;
    print(_photo[9].id);
    notifyListeners();
  }
}
