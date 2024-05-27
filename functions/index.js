const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.getRegionalSummary = functions.https.onCall(async (data, context) => {
  // Ensure the user is authenticated
  // if (!context.auth) {
  //   throw new functions.https.HttpsError('unauthenticated', 'Request had invalid credentials.');
  // }

  try {
    const snapshot = await admin.firestore().collection('regionalsummary').get();
    const regionalSummary = [];

    snapshot.forEach(doc => {
      regionalSummary.push({ id: doc.id, ...doc.data() });
    });

    return { regionalSummary };
  } catch (error) {
    console.error('Error fetching regionalSummary:', error);
    throw new functions.https.HttpsError('internal', 'Unable to fetch regional summary data.');
  }
});


exports.ages = functions.https.onCall(async (data, context) => {
    // Ensure the user is authenticated
    // if (!context.auth) {
    //   throw new functions.https.HttpsError('unauthenticated', 'Request had invalid credentials.');
    // }
  
    try {
      const snapshot = await admin.firestore().collection('agedis').get();
      const regionalSummary = [];
  
      snapshot.forEach(doc => {
        regionalSummary.push({ id: doc.id, ...doc.data() });
      });
  
      return { regionalSummary };
    } catch (error) {
      console.error('Error fetching ages:', error);
      throw new functions.https.HttpsError('internal', 'Unable to fetch age data.');
    }
  });

exports.search = functions.https.onCall(async (datas, context) => {
    // Ensure the user is authenticated
    // if (!context.auth) {
    //   throw new functions.https.HttpsError('unauthenticated', 'Request had invalid credentials.');
    // }
    const query=datas.q;
  
    try {
     
      const snapshot = await admin.firestore().collection('ec_data'). where('voterid', '==', query) .get();
      const regionalSummary = [];
  
      snapshot.forEach(doc => {
        const data = doc.data();
        const {date, ...filteredData } = data;
        console.log(filteredData);
        regionalSummary.push(filteredData);
      });
  
      return { regionalSummary };
    } catch (error) {
      console.error('Error fetching ages:', error);
      throw new functions.https.HttpsError('internal', 'Unable to fetch age data.');
    }
  });

  exports.psearch = functions.https.onCall(async (datas, context) => {
    // Ensure the user is authenticated
    // if (!context.auth) {
    //   throw new functions.https.HttpsError('unauthenticated', 'Request had invalid credentials.');
    // }
    const query=datas.q;
    console.log(query);
    try {
      const snapshot = await admin.firestore().collection('ec_data'). where('pscode', '==', query).get();
      const regionalSummary = [];
      snapshot.forEach(doc => {
        const data = doc.data();
        const {date, ...filteredData } = data;
        console.log(filteredData);
        regionalSummary.push(filteredData);
      });
  
      return { regionalSummary };
    } catch (error) {
      console.error('Error fetching ages:', error);
      throw new functions.https.HttpsError('internal', 'Unable to fetch age data.');
    }
  });