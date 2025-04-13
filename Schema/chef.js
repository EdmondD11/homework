import mongoose from "mongoose";

const ChefSchema = new mongoose.Schema({
  name: String,
  experience: String,
  specialty: String,
});

export default mongoose.model("Chef", ChefSchema);