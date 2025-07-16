// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Counter_State _$Counter_StateFromJson(Map<String, dynamic> json) =>
    Counter_State(
      count: (json['count'] as num).toInt(),
      countChangedBy: (json['countChangedBy'] as num?)?.toInt(),
    );

Map<String, dynamic> _$Counter_StateToJson(Counter_State instance) =>
    <String, dynamic>{
      'count': instance.count,
      'countChangedBy': instance.countChangedBy,
    };
