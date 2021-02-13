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

/** This is an auto generated class representing the LoanInfo type in your schema. */
@immutable
class LoanInfo extends Model {
  static const classType = const LoanInfoType();
  final String id;
  final String servicerName;
  final String loanNumber;
  final String propertyId;
  final double origLoanAmount;
  final double loanUpb;
  final TemporalDate loanUpbDate;
  final String additionalId1;
  final String addtionalId2;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const LoanInfo._internal(
      {@required this.id,
      this.servicerName,
      this.loanNumber,
      this.propertyId,
      this.origLoanAmount,
      this.loanUpb,
      this.loanUpbDate,
      this.additionalId1,
      this.addtionalId2});

  factory LoanInfo(
      {String id,
      String servicerName,
      String loanNumber,
      String propertyId,
      double origLoanAmount,
      double loanUpb,
      TemporalDate loanUpbDate,
      String additionalId1,
      String addtionalId2}) {
    return LoanInfo._internal(
        id: id == null ? UUID.getUUID() : id,
        servicerName: servicerName,
        loanNumber: loanNumber,
        propertyId: propertyId,
        origLoanAmount: origLoanAmount,
        loanUpb: loanUpb,
        loanUpbDate: loanUpbDate,
        additionalId1: additionalId1,
        addtionalId2: addtionalId2);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoanInfo &&
        id == other.id &&
        servicerName == other.servicerName &&
        loanNumber == other.loanNumber &&
        propertyId == other.propertyId &&
        origLoanAmount == other.origLoanAmount &&
        loanUpb == other.loanUpb &&
        loanUpbDate == other.loanUpbDate &&
        additionalId1 == other.additionalId1 &&
        addtionalId2 == other.addtionalId2;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("LoanInfo {");
    buffer.write("id=" + id + ", ");
    buffer.write("servicerName=" + servicerName + ", ");
    buffer.write("loanNumber=" + loanNumber + ", ");
    buffer.write("propertyId=" + propertyId + ", ");
    buffer.write("origLoanAmount=" +
        (origLoanAmount != null ? origLoanAmount.toString() : "null") +
        ", ");
    buffer.write(
        "loanUpb=" + (loanUpb != null ? loanUpb.toString() : "null") + ", ");
    buffer.write("loanUpbDate=" +
        (loanUpbDate != null ? loanUpbDate.format() : "null") +
        ", ");
    buffer.write("additionalId1=" + additionalId1 + ", ");
    buffer.write("addtionalId2=" + addtionalId2);
    buffer.write("}");

    return buffer.toString();
  }

  LoanInfo copyWith(
      {String id,
      String servicerName,
      String loanNumber,
      String propertyId,
      double origLoanAmount,
      double loanUpb,
      TemporalDate loanUpbDate,
      String additionalId1,
      String addtionalId2}) {
    return LoanInfo(
        id: id ?? this.id,
        servicerName: servicerName ?? this.servicerName,
        loanNumber: loanNumber ?? this.loanNumber,
        propertyId: propertyId ?? this.propertyId,
        origLoanAmount: origLoanAmount ?? this.origLoanAmount,
        loanUpb: loanUpb ?? this.loanUpb,
        loanUpbDate: loanUpbDate ?? this.loanUpbDate,
        additionalId1: additionalId1 ?? this.additionalId1,
        addtionalId2: addtionalId2 ?? this.addtionalId2);
  }

  LoanInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        servicerName = json['servicerName'],
        loanNumber = json['loanNumber'],
        propertyId = json['propertyId'],
        origLoanAmount = json['origLoanAmount'],
        loanUpb = json['loanUpb'],
        loanUpbDate = TemporalDate.fromString(json['loanUpbDate']),
        additionalId1 = json['additionalId1'],
        addtionalId2 = json['addtionalId2'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'servicerName': servicerName,
        'loanNumber': loanNumber,
        'propertyId': propertyId,
        'origLoanAmount': origLoanAmount,
        'loanUpb': loanUpb,
        'loanUpbDate': loanUpbDate?.format(),
        'additionalId1': additionalId1,
        'addtionalId2': addtionalId2
      };

  static final QueryField ID = QueryField(fieldName: "loanInfo.id");
  static final QueryField SERVICERNAME = QueryField(fieldName: "servicerName");
  static final QueryField LOANNUMBER = QueryField(fieldName: "loanNumber");
  static final QueryField PROPERTYID = QueryField(fieldName: "propertyId");
  static final QueryField ORIGLOANAMOUNT =
      QueryField(fieldName: "origLoanAmount");
  static final QueryField LOANUPB = QueryField(fieldName: "loanUpb");
  static final QueryField LOANUPBDATE = QueryField(fieldName: "loanUpbDate");
  static final QueryField ADDITIONALID1 =
      QueryField(fieldName: "additionalId1");
  static final QueryField ADDTIONALID2 = QueryField(fieldName: "addtionalId2");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LoanInfo";
    modelSchemaDefinition.pluralName = "LoanInfos";

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
        key: LoanInfo.SERVICERNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.LOANNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.PROPERTYID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.ORIGLOANAMOUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.LOANUPB,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.LOANUPBDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.ADDITIONALID1,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: LoanInfo.ADDTIONALID2,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class LoanInfoType extends ModelType<LoanInfo> {
  const LoanInfoType();

  @override
  LoanInfo fromJson(Map<String, dynamic> jsonData) {
    return LoanInfo.fromJson(jsonData);
  }
}
