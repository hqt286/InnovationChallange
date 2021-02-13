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

/** This is an auto generated class representing the SecondaryPropertyType type in your schema. */
@immutable
class SecondaryPropertyType extends Model {
  static const classType = const SecondaryPropertyTypeType();
  final String id;
  final String secondaryType;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const SecondaryPropertyType._internal(
      {@required this.id, this.secondaryType});

  factory SecondaryPropertyType({String id, String secondaryType}) {
    return SecondaryPropertyType._internal(
        id: id == null ? UUID.getUUID() : id, secondaryType: secondaryType);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SecondaryPropertyType &&
        id == other.id &&
        secondaryType == other.secondaryType;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("SecondaryPropertyType {");
    buffer.write("id=" + id + ", ");
    buffer.write("secondaryType=" + secondaryType);
    buffer.write("}");

    return buffer.toString();
  }

  SecondaryPropertyType copyWith({String id, String secondaryType}) {
    return SecondaryPropertyType(
        id: id ?? this.id, secondaryType: secondaryType ?? this.secondaryType);
  }

  SecondaryPropertyType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        secondaryType = json['secondaryType'];

  Map<String, dynamic> toJson() => {'id': id, 'secondaryType': secondaryType};

  static final QueryField ID =
      QueryField(fieldName: "secondaryPropertyType.id");
  static final QueryField SECONDARYTYPE =
      QueryField(fieldName: "secondaryType");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SecondaryPropertyType";
    modelSchemaDefinition.pluralName = "SecondaryPropertyTypes";

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
        key: SecondaryPropertyType.SECONDARYTYPE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class SecondaryPropertyTypeType extends ModelType<SecondaryPropertyType> {
  const SecondaryPropertyTypeType();

  @override
  SecondaryPropertyType fromJson(Map<String, dynamic> jsonData) {
    return SecondaryPropertyType.fromJson(jsonData);
  }
}
