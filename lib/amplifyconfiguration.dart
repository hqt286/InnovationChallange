const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-east-1:00ffb823-9e65-45b3-b0de-1645d95d0417",
                            "Region": "us-east-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-east-1_LC76lo99G",
                        "AppClientId": "77g7681otphaqq90cv0ueq18qa",
                        "AppClientSecret": "1a3jo1333tna15bhc1nqvsfopf7vdsr1sp0at01i3qp5bfenmrlt",
                        "Region": "us-east-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "inspectionappa6208cea4b334df684b5ba4d7c77800a223039-dev",
                        "Region": "us-east-1"
                    }
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "inspectionappa6208cea4b334df684b5ba4d7c77800a223039-dev",
                "region": "us-east-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';