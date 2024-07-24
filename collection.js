const db = db.getSiblingDB("FinanceData");

// Drop the existing database
print("Dropping database...");
db.dropDatabase();

// Create a collection named "Finance"
print("Creating collection Finance...");
db.createCollection("Finance");

// Insert a document into the Finance collection
print("Inserting document...");
db.Finance.insertOne({
    company: "AMAZON",
    due: 150,
    businessType: "Income",
    currency: "PLN",
    date: "16/05/2024"
});

print("Script finished.");
