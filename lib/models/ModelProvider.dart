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
import 'Assessment.dart';
import 'AssetManager.dart';
import 'InspectionOrder.dart';
import 'InspectionPicture.dart';
import 'InspectionReport.dart';
import 'InspectorInfo.dart';
import 'LoanInfo.dart';
import 'PrimaryPropertyType.dart';
import 'PropertyInfo.dart';
import 'SecondaryPropertyType.dart';

export 'Assessment.dart';
export 'AssessmentStatus.dart';
export 'AssessmentType.dart';
export 'AssetManager.dart';
export 'InspectionOrder.dart';
export 'InspectionPicture.dart';
export 'InspectionReport.dart';
export 'InspectionStatus.dart';
export 'InspectorInfo.dart';
export 'LoanInfo.dart';
export 'PrimaryPropertyType.dart';
export 'PropertyInfo.dart';
export 'RatingScale.dart';
export 'SecondaryPropertyType.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "acf5622bcf7b8395867edc24191beb43";
  @override
  List<ModelSchema> modelSchemas = [
    Assessment.schema,
    AssetManager.schema,
    InspectionOrder.schema,
    InspectionPicture.schema,
    InspectionReport.schema,
    InspectorInfo.schema,
    LoanInfo.schema,
    PrimaryPropertyType.schema,
    PropertyInfo.schema,
    SecondaryPropertyType.schema
  ];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;

  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case "Assessment":
        {
          return Assessment.classType;
        }
        break;
      case "AssetManager":
        {
          return AssetManager.classType;
        }
        break;
      case "InspectionOrder":
        {
          return InspectionOrder.classType;
        }
        break;
      case "InspectionPicture":
        {
          return InspectionPicture.classType;
        }
        break;
      case "InspectionReport":
        {
          return InspectionReport.classType;
        }
        break;
      case "InspectorInfo":
        {
          return InspectorInfo.classType;
        }
        break;
      case "LoanInfo":
        {
          return LoanInfo.classType;
        }
        break;
      case "PrimaryPropertyType":
        {
          return PrimaryPropertyType.classType;
        }
        break;
      case "PropertyInfo":
        {
          return PropertyInfo.classType;
        }
        break;
      case "SecondaryPropertyType":
        {
          return SecondaryPropertyType.classType;
        }
        break;
      default:
        {
          throw Exception(
              "Failed to find model in model provider for model name: " +
                  modelName);
        }
    }
  }
}
