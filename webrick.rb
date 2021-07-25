 # webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

server.mount_proc("/time") do |req, res|
  body = "<html><body>#{Time.new}</body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_get") do |req, res|
  h = req.query
  puts h
  body = "<html><body><head><meta charset=\"utf-8\"></head><p>クエリパラメータは#{h}です</p><p>こんにちは#{h["username"]}さん。あなたの年齢は#{h["age"]}ですね</body></html>" 
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_post") do |req, res|
  h = req.query
  puts h
  body = "<html><body><head><meta charset=\"utf-8\"></head><p>フォームデータは#{h}です</p><p>こんにちは#{h["username"]}さん。あなたの年齢は#{h["age"]}ですね</body></html>" 
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start

