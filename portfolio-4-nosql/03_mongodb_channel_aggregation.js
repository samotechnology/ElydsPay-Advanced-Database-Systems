
/*
 MIT 8103 — Portfolio 4
 ElydsPay: Count customer activities by channel
*/

db = db.getSiblingDB("elydspay_nosql_db");

db.customer_activity.aggregate([
  {
    $group: {
      _id: "$channel",
      total_activities: { $sum: 1 }
    }
  },
  {
    $sort: {
      total_activities: -1,
      _id: 1
    }
  }
]);
