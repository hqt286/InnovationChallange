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

/** This is an auto generated class representing the InspectionPicture type in your schema. */
@immutable
class InspectionPicture extends Model {
  static const classType = const InspectionPictureType();
  final String id;
  final String photoId;
  final String comments;
  final String assessmentID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const InspectionPicture._internal(
      {@required this.id,
      this.photoId,
      this.comments,
      @required this.assessmentID});

  factory InspectionPicture(
      {String id,
      String photoId,
      String comments,
      @required String assessmentID}) {
    return InspectionPicture._internal(
        id: id == null ? UUID.getUUID() : id,
        photoId: photoId,
        comments: comments,
        assessmentID: assessmentID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InspectionPicture &&
        id == other.id &&
        photoId == other.photoId &&
        comments == other.comments &&
        assessmentID == other.assessmentID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("InspectionPicture {");
    buffer.write("id=" + id + ", ");
    buffer.write("photoId=" + photoId + ", ");
    buffer.write("comments=" + comments + ", ");
    buffer.write("assessmentID=" + assessmentID);
    buffer.write("}");

    return buffer.toString();
  }

  InspectionPicture copyWith(
      {String id, String photoId, String comments, String assessmentID}) {
    return InspectionPicture(
        id: id ?? this.id,
        photoId: photoId ?? this.photoId,
        comments: comments ?? this.comments,
        assessmentID: assessmentID ?? this.assessmentID);
  }

  InspectionPicture.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        photoId = json['photoId'],
        comments = json['comments'],
        assessmentID = json['assessmentID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'photoId': photoId,
        'comments': comments,
        'assessmentID': assessmentID
      };

  static final QueryField ID = QueryField(fieldName: "inspectionPicture.id");
  static final QueryField PHOTOID = QueryField(fieldName: "photoId");
  static final QueryField COMMENTS = QueryField(fieldName: "comments");
  static final QueryField ASSESSMENTID = QueryField(fieldName: "assessmentID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InspectionPicture";
    modelSchemaDefinition.pluralName = "InspectionPictures";

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
        key: InspectionPicture.PHOTOID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionPicture.COMMENTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: InspectionPicture.ASSESSMENTID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class InspectionPictureType extends ModelType<InspectionPicture> {
  const InspectionPictureType();

  @override
  InspectionPicture fromJson(Map<String, dynamic> jsonData) {
    return InspectionPicture.fromJson(jsonData);
  }
}
