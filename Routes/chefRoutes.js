import express from "express";
import Chef from "./Schema/chef.js";
const router = express.Router();

router.post("/", async (req, res) => {
  try {
    const chef = new Chef(req.body);
    await chef.save();
    res.status(201).json(chef);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

router.get("/", async (req, res) => {
  try {
    const chefs = await Chef.find();
    res.json(chefs);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

export default router;
