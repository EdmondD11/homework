import express from "express";
import { mongo_connection } from "./mongo-connection.js";
import recipeRoutes from "./Routes/recipeRoutes.js";
import chefRoutes from "./Routes/chefRoutes.js";

const server = express();
server.use(express.json());

server.listen(3001, "localhost", async () => {
    console.log('Server is up and running');
    await mongo_connection();
});

server.use("/recipes", recipeRoutes);
server.use("/chefs", chefRoutes);
