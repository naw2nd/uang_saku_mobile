
import 'package:equatable/equatable.dart';

class MultiResponse<T> extends Equatable {
  final bool success;
  final String message;
  //final Properties properties;
  final List<T> data;

  MultiResponse({this.success, this.message, this.data});

  factory MultiResponse.fromJson(Map<String, dynamic> json) {
    return MultiResponse(
        success: json['success'], message: json['message'], data: json['data']);
  }

  @override
  List<Object> get props => [success,message,data];
}