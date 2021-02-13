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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Assessment type in your schema. */
@immutable
class Assessment extends Model {
  static const classType = const AssessmentType();
  final String id;
  final AssessmentType assessmentType;
  final int rating;
  final String trend;
  final String comments;
  final AssessmentStatus status;
  final List<InspectionPicture> InspectionPictures;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Assessment._internal(
      {@required this.id,
      this.assessmentType,
      this.rating,
      this.trend,
      this.comments,
      this.status,
      this.InspectionPictures});

  factory Assessment(
      {String id,
      AssessmentType assessmentType,
      int rating,
      String trend,
      String comments,
      AssessmentStatus status,
      List<InspectionPicture> InspectionPictures}) {
    return Assessment._internal(
        id: id == null ? UUID.getUUID() : id,
        assessmentType: assessmentType,
        rating: rating,
        trend: trend,
        comments: comments,
        status: status,
        InspectionPictures: InspectionPictures != null
            ? List.unmodifiable(InspectionPictures)
            : InspectionPictures);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Assessment &&
        id == other.id &&
        assessmentType == other.assessmentType &&
        rating == other.rating &&
        trend == other.trend &&
        comments == other.comments &&
        status == other.status &&
        DeepCollectionEquality()
            .equals(InspectionPictures, other.InspectionPictures);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Assessment {");
    buffer.write("id=" + id + ", ");
    buffer.write("assessmentType=" + enumToString(assessmentType) + ", ");
    buffer.write(
        "rating=" + (rating != null ? rating.toString() : "null") + ", ");
    buffer.write("trend=" + trend + ", ");
    buffer.write("comments=" + comments + ", ");
    buffer.write("status=" + enumToString(status));
    buffer.write("}");

    return buffer.toString();
  }

  Assessment copyWith(
      {String id,
      AssessmentType assessmentType,
      int rating,
      String trend,
      String comments,
      AssessmentStatus status,
      List<InspectionPicture> InspectionPictures}) {
    return Assessment(
        id: id ?? this.id,
        assessmentType: assessmentType ?? this.assessmentType,
        rating: rating ?? this.rating,
        trend: trend ?? this.trend,
        comments: comments ?? this.comments,
        status: status ?? this.status,
        InspectionPictures: InspectionPictures ?? this.InspectionPictures);
  }

  Assessment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        assessmentType = enumFromString<AssessmentType>(
            json['assessmentType'], AssessmentType.values),
        rating = json['rating'],
        trend = json['trend'],
        comments = json['comments'],
        status = enumFromString<AssessmentStatus>(
            json['status'], AssessmentStatus.values),
        InspectionPictures = json['InspectionPictures'] is List
            ? (json['InspectionPictures'] as List)
                .map((e) => InspectionPicture.fromJson(
                    new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'assessmentType': enumToString(assessmentType),
        'rating': rating,
        'trend': trend,
        'comments': comments,
        'status': enumToString(status),
        'InspectionPictures':
            InspectionPictures?.map((e) => e?.toJson()).toList()
      };

  static final QueryField ID = QueryField(fieldName: "assessment.id");
  static final QueryField ASSESSMENTTYPE =
      QueryField(fieldName: "assessmentType");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField TREND = QueryField(fieldName: "trend");
  static final QueryField COMMENTS = QueryField(fieldName: "comments");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField INSPECTIONPICTURES = QueryField(
      fieldName: "InspectionPictures",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (InspectionPicture).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Assessment";
    modelSchemaDefinition.pluralName = "Assessments";

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
        key: Assessment.ASSESSMENTTYPE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Assessment.RATING,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Assessment.TREND,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Assessment.COMMENTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Assessment.STATUS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Assessment.INSPECTIONPICTURES,
        isRequired: false,
        ofModelName: (InspectionPicture).toString(),
        associatedKey: InspectionPicture.ASSESSMENTID));
  });
}

class AssessmentType extends ModelType<Assessment> {
  const AssessmentType();

  @override
  Assessment fromJson(Map<String, dynamic> jsonData) {
    return Assessment.fromJson(jsonData);
  }
}
