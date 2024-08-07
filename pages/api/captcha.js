import formidable from "formidable";
import fs from "fs";

// Validate the captcha server-to-server
const post = async (req, res) => {
  console.log("server-side", req.body);
  //validate this captcha
  const url = "https://www.captcha.eu/validate";
  const payload = req.body;

  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Rest-Key": "xxxx", // put your REST secret key here, do not leak to public
      },
      body: JSON.stringify(payload),
    });

    const responseData = await response.json();
    res.status(response.status).json(responseData);
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "An error occurred" });
  }
};
// Handle only post requests
export default (req, res) => {
  req.method === "POST"
    ? post(req, res)
    : req.method === "PUT"
    ? console.log("PUT")
    : req.method === "DELETE"
    ? console.log("DELETE")
    : req.method === "GET"
    ? console.log("GET")
    : res.status(404).send("");
};
