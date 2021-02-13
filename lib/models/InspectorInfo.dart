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

/** This is an auto generated class representing the InspectorInfo type in your schema. */
@immutable
class InspectorInfo extends Model {
  static const classType = const InspectorInfoType();
  final String id;
  final String companyName;
  final String companyPhone;
  final String inspectorName;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const InspectorInfo._internal(
      {@required this.id,
      this.companyName,
      this.companyPhone,
      this.inspectorName});

  factory InspectorInfo(
      {String id,
      String companyName,
      String companyPhone,
      String inspectorName}) {
    return InspectorInfo._internal(
        id: id == null ? UUID.getUUID() : id,
        companyName: companyName,
        companyPhone: companyPhone,
        inspectorName: inspectorName);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectorInfo &&
        id == other.id &&
        companyName == other.companyName &&
        companyPhone == other.companyPhone &&
        inspectorName == other.inspectorName;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("InspectorInfo {");
    buffer.write("id=" + id + ", ");
    buffer.write("companyName=" + companyName + ", ");
    buffer.write("companyPhone=" + companyPhone + ", ");
    buffer.write("inspectorName=" + inspectorName);
    buffer.write("}");

    return buffer.toString();
  }

  InspectorInfo copyWith(
      {String id,
      String companyName,
      String companyPhone,
      String inspectorName}) {
    return InspectorInfo(
        id: id ?? this.id,
        companyName: companyName ?? this.companyName,
        companyPhone: companyPhone ?? this.companyPhone,
        inspectorName: inspectorName ?? this.inspectorName);
  }

  InspectorInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        companyName = json['companyName'],
        companyPhone = json['companyPhone'],
        inspectorName = json['inspectorName'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'companyName': companyName,
        'companyPhone': companyPhone,
        'inspectorName': inspectorName
      };

  static final QueryField ID = QueryField(fieldName: "inspectorInfo.id");
  static final QueryField COMPANYNAME = QueryField(fieldName: "companyName");
  static final QueryField COMPANYPHONE = QueryField(fieldName: "companyPhone");
  static final QueryField INSPECTORNAME =
      QueryField(fieldName: "inspectorName");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InspectorInfo";
    modelSchemaDefinition.pluralName = "InspectorInfos";

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
        key: InspectorInfo.COMPANYNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectorInfo.COMPANYPHONE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectorInfo.INSPECTORNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class InspectorInfoType extends ModelType<InspectorInfo> {
  const InspectorInfoType();

  @override
  InspectorInfo fromJson(Map<String, dynamic> jsonData) {
    return InspectorInfo.fromJson(jsonData);
  }
}
