var express = require('express')
  , app = express()
  , port = process.env.PORT || 8080

app.get('/', function(req, res) {
  res.send('./app/index.html')
})

app.listen(port, function () {
  console.log('Listening on ' + port)
})