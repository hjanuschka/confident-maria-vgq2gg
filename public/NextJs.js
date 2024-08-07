Next.js : Mainly Pre-rendering the application.

Why Next.js:
--> Server-rendering by default
--> Automatic code splitting for faster page loads
--> Simple client-side routing (page based)
--> Dynamic Imports

 Next.js is a flexible React framework that gives you building blocks to create fast web applications.

Building Blocks of a Web Application:
 User Interface,Routing,Data fetching,Rendering,Performance,Ifrastructure,Integrations

SEO: Search Engine Optimise
CDN: content delivery network

Two Projects:
1.EDFUNDSWEB
2.NBFCVelocity

cloning steps:
git clone "https"
-->we creating these 3 files .env && .env.dev && .env.prod 

Pre-rendering:
 -->In this pre-rendering there are maily two forms as followes. The difference is in when it generates the HTML for a page.
SSR: Server-side Rendering -->The HTML is generated on each request.
SSG: Static-site Generation -->The HTML is generated at build time and will be reused on each request.

Hydration:
  When the page is loaded by the browser, its js code runs and makes the page fully interactive, this process is know as hydration.

Commands:
npx create-next-app app_name ---> Create the app
npm run dev ---> For rurn the Development

App Structure:
-->Public 
-->Pages -> We can add the new-components && another folder in it i.e 'api'
-->Style -> global.css & style.module.css


1. Compiling:
   -->It refers to the process of taking the code in one language and outputting into the another language or another version of that language.
   -->Code needs to be Transformed into a version browsers can understand.
2. Minifying:
   -->It is the process of removing the unnecessary code formating and commemts without changing the code's functionality.
   -->The goal is to improve the application's perforamance by decressing the file sizes.
3. Bundling:
   -->Bundling is the process of resolving the web of dependencies and merging (or ‘packaging’) the files (or modules) into optimized bundles for the browser.

Diff B/W Compiling & Bundling:
-->Compiling is transforming code into something parsable by browsers. Bundling is resolving your applications dependency graph and reducing the number of files.

4. Code_Splitting:
   -->Code-splitting is the process of splitting the application’s bundle into smaller files required by each entry point.
   -->The goal is to improve the application's initial load time by only loading the code required to run that page.

Naviagte Between Pages:
   --> We can create the new files into the page directory like pages/index.js & pages/posts/first-post.js
Link Component:
 using <Link> and import the Link component from the "next/link". By using that link between pages in your appplication.

How to add the static files & CSS & Meta Data:
  --> We are add in the public directory.
  --> To load global CSS to your application, create a file called pages/_app.js
  --> meta tags (like og:image), which are used to describe a page's content.
  --> clsx is a simple library that lets you toggle class names easily. You can install it using npm install clsx

How to create an API Route:
  -->let you create an API endpoint inside a Next.js app. You can do so by creating a function inside the pages/api directory that has the following format:
 function getData(req,res){
// Someting code
//res.status(200).json({ text: 'Hello' });
}
export default getData;
req: HTTP incoming message 
res: HTTP server response

Data fetching:
client-side: we can using useEffect in react components.
getServerSideprops:using when SSR(Server-side Rendering) only. It rurns on server-side only and never runs on the browser. and it will be the pre-render this page each request using the data feching using getServerSideProps.
getStaticPaths:You should use getStaticPaths if you’re statically pre-rendering pages that use dynamic routes and data from the database, data comes from the lifesystem.
getStaticProps:The data required to render the page is available at build time ahead of a user’s request.


1. getServerSideProps:
export async function getServerSideProps(context){
 return {
  props:{},// we will passed to the page component as a props
 }
}

2. getStaticProps:
export async function getStaticProps(context){
 return {
  props:{},// we will passed to the page component as a props
 }
}

3. getStaticPaths:
export async function getStaticPaths() {
  return {
    paths: [{ params: { id: '1' } }, { params: { id: '2' } }],
    fallback: false, // can also be true or 'blocking'
  }
}

 Api Call:
const getData = async()=>{
try{
  const res = await fetch("URL");
  const data = await res.json();
 }
catch(err){
  console.log("err")
 }
}
<button onClick={getData}>Click!</button>

--> When we use the router from the next.js we import the 'next/router' and then use const router = userRouter()
-->we can add the router.replace insted of router.push


How To Initilize Redux In Next.js
-->Create Next.js project using command npx create-next-app project_name
-->After that we can install Dependencies like redux react-redux next-redux-wrapper redux-thunk
-->Make redux structure like Action && Reducer && Store
-->After Initilize the store and provider in app.js
-->Setup the redux-thunk for the middleware like async functions

Note:
Compose: When you want to pass the multiple store enhancers to the store in redux.
@@react.js convert into next.js:
---> First remove the react-scripts using 'npm uninstall react-scripts' and install the next using npm i next don't remove the thinks in package.json react && react-dom.
---> And then add the next-scripts like next dev && next bulid && next start.
---> And add .next to .gitignore
---> Most of cases like SEO (Search Engine Optimise) that time we use Next.js


Redux:
   Redux is a pattern and library for managing and updating application satate,using events called "Actions".
Libraries:
-->React-redux
-->Redux-toolkit
-->Redux DevTools Extension
steps:
-->Creating Store using configureStore from redux/toolkit in that we can pass the arugements i.e reducer & middleware.
-->And the create reducers along with actions.
-->We can add provider in index.js we can provided State values in the UI component.

 React.js:
--> React is a clint-side Js library.  
--> first Install Node.js
--> npx create-react-app project_name
--> npm install and After npm start.
Note:
--> React allows you create re-usable components and recative components consists of JS, HTML & CSS.
--> We create components should be in Pascal Case. like TestOne.js
--> Props: To Share the set of data one component to another component like parent to child.It is immutable & Pure.