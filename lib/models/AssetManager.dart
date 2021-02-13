/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the AssetManager type in your schema. */
@immutable
class AssetManager extends Model {
  static const classType = const AssetManagerType();
  final String id;
  final String name;
  final String phone;
  final String email;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const AssetManager._internal(
      {@required this.id, this.name, this.phone, this.email});

  factory AssetManager({String id, String name, String phone, String email}) {
    return AssetManager._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        phone: phone,
        email: email);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssetManager &&
        id == other.id &&
        name == other.name &&
        phone == other.phone &&
        email == other.email;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("AssetManager {");
    buffer.write("id=" + id + ", ");
    buffer.write("name=" + name + ", ");
    buffer.write("phone=" + phone + ", ");
    buffer.write("email=" + email);
    buffer.write("}");

    return buffer.toString();
  }

  AssetManager copyWith({String id, String name, String phone, String email}) {
    return AssetManager(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email);
  }

  AssetManager.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phone = json['phone'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'phone': phone, 'email': email};

  static final QueryField ID = QueryField(fieldName: "assetManager.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PHONE = QueryField(fieldName: "phone");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "AssetManager";
    modelSchemaDefinition.pluralName = "AssetManagers";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: AssetManager.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: AssetManager.PHONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: AssetManager.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class AssetManagerType extends ModelType<AssetManager> {
  const AssetManagerType();

  @override
  AssetManager fromJson(Map<String, dynamic> jsonData) {
    return AssetManager.fromJson(jsonData);
  }
}
