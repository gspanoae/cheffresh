library user;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  factory User([Function(UserBuilder b) updates]) = _$User;

  User._();

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'date_created')
  String get dateCreated;

  @nullable
  String get image;

  @nullable
  String get phone;

  @nullable
  String get address;

  @nullable
  GeoPoint get location;

  @nullable
  BuiltList<String> get reservations;

  @nullable
  BuiltList<String> get reservations_created;

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  static User fromJson(String jsonString) {
    return serializers.deserializeWith(
        User.serializer, json.decode(jsonString));
  }

  static Serializer<User> get serializer => _$userSerializer;
}