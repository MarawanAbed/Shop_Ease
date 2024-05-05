import 'package:json_annotation/json_annotation.dart';
part 'payment_intents.g.dart';
@JsonSerializable()
class PaymentIntents
{
  @JsonKey(name:'client_secret')
  final String clientSecret;


  PaymentIntents({required this.clientSecret});


  factory PaymentIntents.fromJson(Map<String, dynamic> json) => _$PaymentIntentsFromJson(json);


  Map<String, dynamic> toJson() => _$PaymentIntentsToJson(this);
}