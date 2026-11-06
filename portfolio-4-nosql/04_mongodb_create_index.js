
/*
 MIT 8103 — Portfolio 4
 ElydsPay: Create an index on customer_id
*/

db = db.getSiblingDB("elydspay_nosql_db");

// Create an ascending index for customer activity lookups.
db.customer_activity.createIndex(
  { customer_id: 1 },
  { name: "idx_customer_activity_customer_id" }
);

// Verify the indexes on the collection.
db.customer_activity.getIndexes();
