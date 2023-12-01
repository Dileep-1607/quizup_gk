
import 'dart:io';

class AdsHelper {

  static String homePageBanner(){
    if(Platform.isAndroid){
      return "ca-app-pub-6396921631409181/4628260740";
    }
    else{
      return "";
    }
  }

  static String detailPageBanner(){
    if(Platform.isAndroid){
      return "";
    }
    else{
      return "";
    }
  }

  static String fullPageAd(){
    if(Platform.isAndroid){
      return "";
    }
    else{
      return "";
    }
  }

}