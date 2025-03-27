import mongoose from "mongoose";

const NEW_URL = "mongodb+srv://gjorge:qwert_123@cluster0.x196b.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

export const mongo_connection = async () => {
    try {
        await mongoose.connect(NEW_URL, {
            dbName: "products-database"
        });
        console.log("Connection with mongo success.");
    } catch (error) {
        throw new Error("Connection to mongo database failed.");
    }
};