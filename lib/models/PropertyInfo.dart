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

/** This is an auto generated class representing the PropertyInfo type in your schema. */
@immutable
class PropertyInfo extends Model {
  static const classType = const PropertyInfoType();
  final String id;
  final String name;
  final String address1;
  final String address2;
  final String state;
  final String zip;
  final String country;
  final int numOfFloors;
  final int yearBuilt;
  final double annualOccupancy;
  final int numOfBuildings;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const PropertyInfo._internal(
      {@required this.id,
      this.name,
      this.address1,
      this.address2,
      this.state,
      this.zip,
      this.country,
      this.numOfFloors,
      this.yearBuilt,
      this.annualOccupancy,
      this.numOfBuildings});

  factory PropertyInfo(
      {String id,
      String name,
      String address1,
      String address2,
      String state,
      String zip,
      String country,
      int numOfFloors,
      int yearBuilt,
      double annualOccupancy,
      int numOfBuildings}) {
    return PropertyInfo._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        address1: address1,
        address2: address2,
        state: state,
        zip: zip,
        country: country,
        numOfFloors: numOfFloors,
        yearBuilt: yearBuilt,
        annualOccupancy: annualOccupancy,
        numOfBuildings: numOfBuildings);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PropertyInfo &&
        id == other.id &&
        name == other.name &&
        address1 == other.address1 &&
        address2 == other.address2 &&
        state == other.state &&
        zip == other.zip &&
        country == other.country &&
        numOfFloors == other.numOfFloors &&
        yearBuilt == other.yearBuilt &&
        annualOccupancy == other.annualOccupancy &&
        numOfBuildings == other.numOfBuildings;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("PropertyInfo {");
    buffer.write("id=" + id + ", ");
    buffer.write("name=" + name + ", ");
    buffer.write("address1=" + address1 + ", ");
    buffer.write("address2=" + address2 + ", ");
    buffer.write("state=" + state + ", ");
    buffer.write("zip=" + zip + ", ");
    buffer.write("country=" + country + ", ");
    buffer.write("numOfFloors=" +
        (numOfFloors != null ? numOfFloors.toString() : "null") +
        ", ");
    buffer.write("yearBuilt=" +
        (yearBuilt != null ? yearBuilt.toString() : "null") +
        ", ");
    buffer.write("annualOccupancy=" +
        (annualOccupancy != null ? annualOccupancy.toString() : "null") +
        ", ");
    buffer.write("numOfBuildings=" +
        (numOfBuildings != null ? numOfBuildings.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  PropertyInfo copyWith(
      {String id,
      String name,
      String address1,
      String address2,
      String state,
      String zip,
      String country,
      int numOfFloors,
      int yearBuilt,
      double annualOccupancy,
      int numOfBuildings}) {
    return PropertyInfo(
        id: id ?? this.id,
        name: name ?? this.name,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        state: state ?? this.state,
        zip: zip ?? this.zip,
        country: country ?? this.country,
        numOfFloors: numOfFloors ?? this.numOfFloors,
        yearBuilt: yearBuilt ?? this.yearBuilt,
        annualOccupancy: annualOccupancy ?? this.annualOccupancy,
        numOfBuildings: numOfBuildings ?? this.numOfBuildings);
  }

  PropertyInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address1 = json['address1'],
        address2 = json['address2'],
        state = json['state'],
        zip = json['zip'],
        country = json['country'],
        numOfFloors = json['numOfFloors'],
        yearBuilt = json['yearBuilt'],
        annualOccupancy = json['annualOccupancy'],
        numOfBuildings = json['numOfBuildings'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address1': address1,
        'address2': address2,
        'state': state,
        'zip': zip,
        'country': country,
        'numOfFloors': numOfFloors,
        'yearBuilt': yearBuilt,
        'annualOccupancy': annualOccupancy,
        'numOfBuildings': numOfBuildings
      };

  static final QueryField ID = QueryField(fieldName: "propertyInfo.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ADDRESS1 = QueryField(fieldName: "address1");
  static final QueryField ADDRESS2 = QueryField(fieldName: "address2");
  static final QueryField STATE = QueryField(fieldName: "state");
  static final QueryField ZIP = QueryField(fieldName: "zip");
  static final QueryField COUNTRY = QueryField(fieldName: "country");
  static final QueryField NUMOFFLOORS = QueryField(fieldName: "numOfFloors");
  static final QueryField YEARBUILT = QueryField(fieldName: "yearBuilt");
  static final QueryField ANNUALOCCUPANCY =
      QueryField(fieldName: "annualOccupancy");
  static final QueryField NUMOFBUILDINGS =
      QueryField(fieldName: "numOfBuildings");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "PropertyInfo";
    modelSchemaDefinition.pluralName = "PropertyInfos";

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
        key: PropertyInfo.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.ADDRESS1,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.ADDRESS2,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.STATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.ZIP,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.COUNTRY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.NUMOFFLOORS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.YEARBUILT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.ANNUALOCCUPANCY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: PropertyInfo.NUMOFBUILDINGS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));
  });
}

class PropertyInfoType extends ModelType<PropertyInfo> {
  const PropertyInfoType();

  @override
  PropertyInfo fromJson(Map<String, dynamic> jsonData) {
    return PropertyInfo.fromJson(jsonData);
  }
}
