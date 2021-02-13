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

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the InspectionOrder type in your schema. */
@immutable
class InspectionOrder extends Model {
  static const classType = const InspectionOrderType();
  final String id;
  final InspectionStatus status;
  final String requestedBy;
  final String lastModifiedBy;
  final TemporalDateTime lastUpdated;
  final InspectorInfo InspectorInfo;
  final PropertyInfo PropertyInfo;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const InspectionOrder._internal(
      {@required this.id,
      this.status,
      this.requestedBy,
      this.lastModifiedBy,
      this.lastUpdated,
      this.InspectorInfo,
      this.PropertyInfo});

  factory InspectionOrder(
      {String id,
      InspectionStatus status,
      String requestedBy,
      String lastModifiedBy,
      TemporalDateTime lastUpdated,
      InspectorInfo InspectorInfo,
      PropertyInfo PropertyInfo}) {
    return InspectionOrder._internal(
        id: id == null ? UUID.getUUID() : id,
        status: status,
        requestedBy: requestedBy,
        lastModifiedBy: lastModifiedBy,
        lastUpdated: lastUpdated,
        InspectorInfo: InspectorInfo,
        PropertyInfo: PropertyInfo);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectionOrder &&
        id == other.id &&
        status == other.status &&
        requestedBy == other.requestedBy &&
        lastModifiedBy == other.lastModifiedBy &&
        lastUpdated == other.lastUpdated &&
        InspectorInfo == other.InspectorInfo &&
        PropertyInfo == other.PropertyInfo;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("InspectionOrder {");
    buffer.write("id=" + id + ", ");
    buffer.write("status=" + enumToString(status) + ", ");
    buffer.write("requestedBy=" + requestedBy + ", ");
    buffer.write("lastModifiedBy=" + lastModifiedBy + ", ");
    buffer.write("lastUpdated=" +
        (lastUpdated != null ? lastUpdated.format() : "null") +
        ", ");
    buffer.write("InspectorInfo=" +
        (InspectorInfo != null ? InspectorInfo.toString() : "null") +
        ", ");
    buffer.write("PropertyInfo=" +
        (PropertyInfo != null ? PropertyInfo.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  InspectionOrder copyWith(
      {String id,
      InspectionStatus status,
      String requestedBy,
      String lastModifiedBy,
      TemporalDateTime lastUpdated,
      InspectorInfo InspectorInfo,
      PropertyInfo PropertyInfo}) {
    return InspectionOrder(
        id: id ?? this.id,
        status: status ?? this.status,
        requestedBy: requestedBy ?? this.requestedBy,
        lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        InspectorInfo: InspectorInfo ?? this.InspectorInfo,
        PropertyInfo: PropertyInfo ?? this.PropertyInfo);
  }

  InspectionOrder.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        status = enumFromString<InspectionStatus>(
            json['status'], InspectionStatus.values),
        requestedBy = json['requestedBy'],
        lastModifiedBy = json['lastModifiedBy'],
        lastUpdated = TemporalDateTime.fromString(json['lastUpdated']),
        InspectorInfo = json['InspectorInfo'] != null
            ? InspectorInfo.fromJson(
                new Map<String, dynamic>.from(json['InspectorInfo']))
            : null,
        PropertyInfo = json['PropertyInfo'] != null
            ? PropertyInfo.fromJson(
                new Map<String, dynamic>.from(json['PropertyInfo']))
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': enumToString(status),
        'requestedBy': requestedBy,
        'lastModifiedBy': lastModifiedBy,
        'lastUpdated': lastUpdated?.format(),
        'InspectorInfo': InspectorInfo?.toJson(),
        'PropertyInfo': PropertyInfo?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "inspectionOrder.id");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField REQUESTEDBY = QueryField(fieldName: "requestedBy");
  static final QueryField LASTMODIFIEDBY =
      QueryField(fieldName: "lastModifiedBy");
  static final QueryField LASTUPDATED = QueryField(fieldName: "lastUpdated");
  static final QueryField INSPECTORINFO = QueryField(
      fieldName: "InspectorInfo",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (InspectorInfo).toString()));
  static final QueryField PROPERTYINFO = QueryField(
      fieldName: "PropertyInfo",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (PropertyInfo).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InspectionOrder";
    modelSchemaDefinition.pluralName = "InspectionOrders";

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
        key: InspectionOrder.STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionOrder.REQUESTEDBY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionOrder.LASTMODIFIEDBY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionOrder.LASTUPDATED,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: InspectionOrder.INSPECTORINFO,
        isRequired: false,
        targetName: "inspectionOrderInspectorInfoId",
        ofModelName: (InspectorInfo).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: InspectionOrder.PROPERTYINFO,
        isRequired: false,
        targetName: "inspectionOrderPropertyInfoId",
        ofModelName: (PropertyInfo).toString()));
  });
}

class InspectionOrderType extends ModelType<InspectionOrder> {
  const InspectionOrderType();

  @override
  InspectionOrder fromJson(Map<String, dynamic> jsonData) {
    return InspectionOrder.fromJson(jsonData);
  }
}
