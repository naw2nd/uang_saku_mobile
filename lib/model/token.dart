import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String type;
  final String token;
  // final int expiredIn;

  Token({this.type, this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        type: json['type'], token: json['token']);
  }

  @override
  List<Object> get props => [type,token];
}
