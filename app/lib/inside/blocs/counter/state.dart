import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

@JsonSerializable()
class Counter_State extends Equatable {
  const Counter_State({required this.count});

  final int count;

  Counter_State copyWith({int? count}) {
    return Counter_State(count: count ?? this.count);
  }

  @override
  List<Object?> get props => [count];

  // coverage:ignore-start
  factory Counter_State.fromJson(Map<String, dynamic> json) =>
      _$Counter_StateFromJson(json);

  Map<String, dynamic> toJson() => _$Counter_StateToJson(this);
  // coverage:ignore-end
}
