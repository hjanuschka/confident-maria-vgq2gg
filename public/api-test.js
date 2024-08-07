
const APIKEY = "fc7ea921fbfbcb08e9095152974913e60eda94e9"
fetch('https://api.zdrive.ir/v1/AUTH_DevX', { method: "GET", "X-API-KEY": APIKEY})
.then( res => res.json())
.then( data => console.log(data))