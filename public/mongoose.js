import mongoose from 'mongoose';
import dotenv from 'dotenv';

dotenv.config();

export default async function yourMom() {
  console.log('im here');
  const mongoDB = process.env.MONGO_URI;
  mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true }).then((res) => {
  }).catch((err) => {
    console.log(err);
  });
  console.log('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
}