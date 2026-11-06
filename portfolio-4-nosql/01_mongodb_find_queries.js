
/*
 MIT 8103 — Portfolio 4
 ElydsPay MongoDB document retrieval queries

 Database: elydspay_nosql_db
 Collection: customer_activity
*/

// Query 1: Retrieve activities for customer 1.
db.customer_activity.find({ customer_id: 1 });

// Query 2: Retrieve activities performed through the mobile app.
db.customer_activity.find({ channel: "mobile_app" });

// Query 3: Retrieve activities tagged as security-related.
db.customer_activity.find({ tags: "security" });
