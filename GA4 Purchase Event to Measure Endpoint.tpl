___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "StoryStream Conversion Metrics",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "StoryID",
    "displayName": "Story ID",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const copyFromDataLayer = require('copyFromDataLayer');
const sendPixel = require('sendPixel');

const purchased_items = copyFromDataLayer('eventModel.items');

const ga4PurchaseEvent = copyFromDataLayer('eventModel');

const value = ga4PurchaseEvent.value;
const transactionId = ga4PurchaseEvent.transaction_id;
let storyID = data.StoryID;

if (!storyID) {
    log("Warning: StoryID is undefined or empty");
    storyID = 'unknown';
} else {
    if (typeof storyID.join === 'function') {
        storyID = storyID.join(',');
    } else {
        storyID = storyID.trim();
    }
}

// Construct ME URL
const url = 'https://dn666andut2j1.cloudfront.net/measure_endpoint.gif?e=trns&s=' + storyID + '&ed2=' + value + '&ed3=' + transactionId;

sendPixel(url);

// Call data.gtmOnSuccess when the tag is finished
data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_pixel",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "any"
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

scenarios: []


___NOTES___

Created on 29/10/2024, 16:36:53


