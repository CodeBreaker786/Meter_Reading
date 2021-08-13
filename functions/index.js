const functions = require("firebase-functions");

const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions

exports.onUserCreated = functions.firestore
    .document("/reports/{userId}")
    .onCreate(async (user, context) => {
        const document = user.data();
        const meterList = document.meters;
        meterList.forEach(async element => {
            await admin.firestore().collection('app_data').doc('supplyName').set({ list: admin.firestore.FieldValue.arrayUnion(element.supplyName) }, { merge: true });
            await admin.firestore().collection('app_data').doc('meterModel').set({ list: admin.firestore.FieldValue.arrayUnion(element.meterModel) }, { merge: true });
            await admin.firestore().collection('app_data').doc('manufacturer').set({ list: admin.firestore.FieldValue.arrayUnion(element.manufacturer) }, { merge: true });
             
        });







        // document.meters.forEach(async(meter) =>  {
        //   await admin.firestore().collection("reference").doc('refList').update({ '1': meter.supplyReference })
        // });


    });