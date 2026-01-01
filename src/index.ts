import express from "express";
import { config } from "dotenv";
import { connectDb } from "./db";
import { initBot } from "./bot";

config();

async function main() {
  await connectDb();
  initBot();

  const app = express();
  app.get("/", (_, res) => res.send("Server running"));
  app.listen(3000, () => console.log("Server running on port 3000"));
}

main();
