
import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future remoteConfig() async{
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
    await remoteConfig.fetchAndActivate();
    //print(remoteConfig.getString("current_affairs"));
  currentAffairs = jsonDecode(remoteConfig.getString("current_affairs"));
  singleCategories = jsonDecode(remoteConfig.getString("single_categories"));
  multipleCategories = jsonDecode(remoteConfig.getString("multiple_categories"));
  exams = jsonDecode(remoteConfig.getString("exams"));
  configKeys = jsonDecode(remoteConfig.getString("keys"));

}

List<dynamic> currentAffairs = [];
List<dynamic> singleCategories = [];
Map<String, dynamic> multipleCategories = {};
Map<String, dynamic> exams = {};
Map<String, dynamic> configKeys = {};
