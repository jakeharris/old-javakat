var express = require('express')
  , app = express()
  , port = process.env.PORT || 8080

app.set('views', __dirname + '/app')
app.set('view engine', 'html')
app.engine('html', require('ejs').renderFile)
app.use(express.static('app/assets/'))

app.get('/', function(req, res) {
  res.render('index')
})

app.listen(port, function () {
  console.log('Listening on ' + port)
})
