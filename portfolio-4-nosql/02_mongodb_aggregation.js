
/*
 MIT 8103 — Portfolio 4
 ElydsPay MongoDB aggregation

 Database: elydspay_nosql_db
 Collection: customer_activity
*/

db = db.getSiblingDB("elydspay_nosql_db");

// Count the number of activities recorded for each customer.
db.customer_activity.aggregate([
  {
    $group: {
      _id: "$customer_id",
      total_activities: { $sum: 1 }
    }
  },
  {
    $sort: { _id: 1 }
  }
]);
