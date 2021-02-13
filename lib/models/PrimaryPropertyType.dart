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

/** This is an auto generated class representing the PrimaryPropertyType type in your schema. */
@immutable
class PrimaryPropertyType extends Model {
  static const classType = const PrimaryPropertyTypeType();
  final String id;
  final String type;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const PrimaryPropertyType._internal({@required this.id, this.type});

  factory PrimaryPropertyType({String id, String type}) {
    return PrimaryPropertyType._internal(
        id: id == null ? UUID.getUUID() : id, type: type);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrimaryPropertyType && id == other.id && type == other.type;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PrimaryPropertyType {");
    buffer.write("id=" + id + ", ");
    buffer.write("type=" + type);
    buffer.write("}");

    return buffer.toString();
  }

  PrimaryPropertyType copyWith({String id, String type}) {
    return PrimaryPropertyType(id: id ?? this.id, type: type ?? this.type);
  }

  PrimaryPropertyType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'];

  Map<String, dynamic> toJson() => {'id': id, 'type': type};

  static final QueryField ID = QueryField(fieldName: "primaryPropertyType.id");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PrimaryPropertyType";
    modelSchemaDefinition.pluralName = "PrimaryPropertyTypes";

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
        key: PrimaryPropertyType.TYPE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class PrimaryPropertyTypeType extends ModelType<PrimaryPropertyType> {
  const PrimaryPropertyTypeType();

  @override
  PrimaryPropertyType fromJson(Map<String, dynamic> jsonData) {
    return PrimaryPropertyType.fromJson(jsonData);
  }
}
