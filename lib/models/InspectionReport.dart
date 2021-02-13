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

/** This is an auto generated class representing the InspectionReport type in your schema. */
@immutable
class InspectionReport extends Model {
  static const classType = const InspectionReportType();
  final String id;
  final String servicerInspectionId;
  final TemporalDateTime inspectionDateTime;
  final String status;
  final RatingScale ratingScale;
  final int overAllRating;
  final String instructions;
  final String generalComments;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const InspectionReport._internal(
      {@required this.id,
      this.servicerInspectionId,
      this.inspectionDateTime,
      this.status,
      this.ratingScale,
      this.overAllRating,
      this.instructions,
      this.generalComments});

  factory InspectionReport(
      {String id,
      String servicerInspectionId,
      TemporalDateTime inspectionDateTime,
      String status,
      RatingScale ratingScale,
      int overAllRating,
      String instructions,
      String generalComments}) {
    return InspectionReport._internal(
        id: id == null ? UUID.getUUID() : id,
        servicerInspectionId: servicerInspectionId,
        inspectionDateTime: inspectionDateTime,
        status: status,
        ratingScale: ratingScale,
        overAllRating: overAllRating,
        instructions: instructions,
        generalComments: generalComments);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectionReport &&
        id == other.id &&
        servicerInspectionId == other.servicerInspectionId &&
        inspectionDateTime == other.inspectionDateTime &&
        status == other.status &&
        ratingScale == other.ratingScale &&
        overAllRating == other.overAllRating &&
        instructions == other.instructions &&
        generalComments == other.generalComments;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("InspectionReport {");
    buffer.write("id=" + id + ", ");
    buffer.write("servicerInspectionId=" + servicerInspectionId + ", ");
    buffer.write("inspectionDateTime=" +
        (inspectionDateTime != null ? inspectionDateTime.format() : "null") +
        ", ");
    buffer.write("status=" + status + ", ");
    buffer.write("ratingScale=" + enumToString(ratingScale) + ", ");
    buffer.write("overAllRating=" +
        (overAllRating != null ? overAllRating.toString() : "null") +
        ", ");
    buffer.write("instructions=" + instructions + ", ");
    buffer.write("generalComments=" + generalComments);
    buffer.write("}");

    return buffer.toString();
  }

  InspectionReport copyWith(
      {String id,
      String servicerInspectionId,
      TemporalDateTime inspectionDateTime,
      String status,
      RatingScale ratingScale,
      int overAllRating,
      String instructions,
      String generalComments}) {
    return InspectionReport(
        id: id ?? this.id,
        servicerInspectionId: servicerInspectionId ?? this.servicerInspectionId,
        inspectionDateTime: inspectionDateTime ?? this.inspectionDateTime,
        status: status ?? this.status,
        ratingScale: ratingScale ?? this.ratingScale,
        overAllRating: overAllRating ?? this.overAllRating,
        instructions: instructions ?? this.instructions,
        generalComments: generalComments ?? this.generalComments);
  }

  InspectionReport.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        servicerInspectionId = json['servicerInspectionId'],
        inspectionDateTime =
            TemporalDateTime.fromString(json['inspectionDateTime']),
        status = json['status'],
        ratingScale = enumFromString<RatingScale>(
            json['ratingScale'], RatingScale.values),
        overAllRating = json['overAllRating'],
        instructions = json['instructions'],
        generalComments = json['generalComments'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'servicerInspectionId': servicerInspectionId,
        'inspectionDateTime': inspectionDateTime?.format(),
        'status': status,
        'ratingScale': enumToString(ratingScale),
        'overAllRating': overAllRating,
        'instructions': instructions,
        'generalComments': generalComments
      };

  static final QueryField ID = QueryField(fieldName: "inspectionReport.id");
  static final QueryField SERVICERINSPECTIONID =
      QueryField(fieldName: "servicerInspectionId");
  static final QueryField INSPECTIONDATETIME =
      QueryField(fieldName: "inspectionDateTime");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField RATINGSCALE = QueryField(fieldName: "ratingScale");
  static final QueryField OVERALLRATING =
      QueryField(fieldName: "overAllRating");
  static final QueryField INSTRUCTIONS = QueryField(fieldName: "instructions");
  static final QueryField GENERALCOMMENTS =
      QueryField(fieldName: "generalComments");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InspectionReport";
    modelSchemaDefinition.pluralName = "InspectionReports";

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
        key: InspectionReport.SERVICERINSPECTIONID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionReport.INSPECTIONDATETIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionReport.STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionReport.RATINGSCALE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionReport.OVERALLRATING,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionReport.INSTRUCTIONS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionReport.GENERALCOMMENTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class InspectionReportType extends ModelType<InspectionReport> {
  const InspectionReportType();

  @override
  InspectionReport fromJson(Map<String, dynamic> jsonData) {
    return InspectionReport.fromJson(jsonData);
  }
}
