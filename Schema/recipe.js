import mongoose from "mongoose";

const RecipeSchema = new mongoose.Schema({
  recipeName: String,
  description: String,
  cookingDuration: String,
  ingredients: [String],
  servings: Number,
  difficulty: String,
  cuisine: String,
  chef: { type: mongoose.Schema.Types.ObjectId, ref: "Chef" },
});

export default mongoose.model("Recipe", RecipeSchema);
