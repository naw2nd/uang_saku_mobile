import 'package:equatable/equatable.dart';

class SingleResponse<T> extends Equatable {
  final bool success;
  final String message;
  T data;

  SingleResponse({this.success, this.message, this.data});

  factory SingleResponse.fromJson(Map<String, dynamic> json) {
    return SingleResponse(
        success: json['success'], message: json['message'], data: json['data']);
  }

  @override
  List<Object> get props => [success, message, data];
}
