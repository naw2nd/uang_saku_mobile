import 'package:equatable/equatable.dart';

class Token extends Equatable {
  final String type;
  final String token;
  final int expiredIn;

  Token({this.type, this.token, this.expiredIn});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        type: json['json'], token: json['token'], expiredIn: json['expiredIn']);
  }

  @override
  List<Object> get props => [type,token,expiredIn];
}
