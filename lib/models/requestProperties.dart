import 'package:loge_moi/models/property.dart';

class ResquestProperties {
  String? message;
  List<Property>? data;

  ResquestProperties({this.message, this.data});

  ResquestProperties.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Property>[];
      json['data'].forEach((v) {
        data!.add(Property.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
