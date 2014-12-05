var express = require('express'),
    app = express()

app.get('/', function (req, res) {
  res.render('index.html')
})

var server = app.listen(3000, function () {
  var host = server.address().address,
      port = server.address().port
  
  console.log('Listening at http://%s:%s', host, port)
  
})