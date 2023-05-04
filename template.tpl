___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "OddBytes Pixel Conversion Tracking",
  "categories": ["CONVERSIONS", "ANALYTICS", "UTILITY"],
  "brand": {
    "id": "brand_dummy",
    "displayName": "HTML Pixel Template"
  },
  "description": "Tracking template for registering conversion in the OddBytes Platform.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "trackingID",
    "displayName": "Platform Tracking ID",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "help": "Please check tracking manager for your tracking ID"
  },
  {
    "type": "TEXT",
    "name": "commission",
    "displayName": "Commission",
    "simpleValueType": true,
    "canBeEmptyString": true,
    "defaultValue": 0
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const query = require('queryPermission');
const injectScript = require('injectScript');
if (data.trackingID != '') {
  	let commission = 0;
  	if (data.commission != '')
      commission = data.commission;
	const url = 'https://www.conversionpx.com/?id=' + data.trackingID + '&fetch=0&value=' + commission;
    if (query('inject_script', url)) {
      injectScript(url,  data.gtmOnSuccess, data.gtmOnFailure);
    }
    data.gtmOnSuccess();
}

data.gtmOnFailure();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.conversionpx.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      // Mocked field values
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 5/19/2022, 2:35:24 PM


