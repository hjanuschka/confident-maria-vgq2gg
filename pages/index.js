import { useState } from "react";
import { useEffect } from "react";

export default function CaptchaValidationPage(props) {
  const [captchaSDKLoaded, setCaptchaSDKLoaded] = useState(false);
  // Load SDK
  useEffect(() => {
    const script = document.createElement("script");
    script.src = "https://www.captcha.eu/sdk.js";
    script.async = true;
    script.onload = () => {
      // ADD YOUR CAPTCHA.EU PUBLIC KEY
      KROT.setup("xxxx");
      setCaptchaSDKLoaded(true);
    };
    document.body.appendChild(script);
  }, []);

  // This generates a solution and posts to the server
  // the server then, should validate and return if it worked or not
  // typically the server, would validate the captcha, and then e.g.: save the form
  function getSolution() {
    KROT.getSolution().then((s) => {
      console.log(JSON.stringify(s));
      // Create the fetch request
      fetch("/api/captcha", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(s),
      })
        .then((response) => response.json())
        .then((r) => {
          if (r.success) {
            alert("Captcha validated");
          }
        })
        .catch((error) => {
          console.error("Error:", error);
        });
    });
  }
  if (!captchaSDKLoaded) {
    return <>SDK Loading</>;
  }

  return (
    <>
      <button onClick={getSolution}>Validate Captcha</button>
    </>
  );
}
