
/*
 MIT 8103 — Portfolio 4
 ElydsPay: Examine query execution using explain()
*/

db = db.getSiblingDB("elydspay_nosql_db");

// Inspect the execution plan for customer activity retrieval.
db.customer_activity
  .find({ customer_id: 1 })
  .explain("executionStats");
