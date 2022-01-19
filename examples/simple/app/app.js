
const express = require('express')
const app = express()
const port = process.env.PORT || 3000;

console.log(WelcomeMessage());

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//allowing requests from outside of the domain 
app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type,Accept");
  next();
});

app.post('/api/test', (req, res) => {
  body = req.body;
  console.log(body);
  res.send(
    {
      "code": 0,
      "body": body,
      "text": "POST success"
    }
  );
})
app.get('/', (req, res) => res.send(WelcomeMessage()));

app.listen(port, () => console.log(`Listening on port ${port}!`));


function WelcomeMessage(){
  msg = "\nSimple API example.";
  msg += "\nUsage:";
  msg += "\n" + `  curl "http://localhost:3000/api/test" -s -H "Content-Type: application/json" -d '{"name":"my name"}'`;
  msg += "\n";
  return msg;
}