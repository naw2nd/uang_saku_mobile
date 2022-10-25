import 'package:equatable/equatable.dart';

import 'models.dart';

class MultiResponse<T> extends Equatable {
  final bool success;
  final String message;
  final Properties properties;
  final List<T> data;

  MultiResponse({this.success, this.message, this.data, this.properties});

  factory MultiResponse.fromJson(Map<String, dynamic> json) {
    return MultiResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'],
        properties: json['properties']); //properties masih belum digunakan
  }

  @override
  List<Object> get props => [success, message, data];
}
