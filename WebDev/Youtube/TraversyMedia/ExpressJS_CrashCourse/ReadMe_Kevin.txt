URL: https://www.youtube.com/watch?v=gnsO8-xJ8rs&t=389s
Title: Express Crash Course

To create package.json file in this folder

  >npm init

To install Express & Body-parser modules
  >Open and edit package.json and add below lines:

      "dependencies": {
        "express": "*",
        "body-parser": "*"
      },

  Then run below command
  >npm install


Create a new file called app.js (becuase you had below in package.json)

    "main": "app.js",

Each time we make a change to app.js, we have to exit and restart
"node app.js" ... this is annoying ...

To avoid this (similar to live server), you can install below modules
globally

  >npm install nodemon -g

  Then you can just run
  >nodemon

To install express-validator (https://github.com/ctavan/express-validator)
>npm install express-validator --save  