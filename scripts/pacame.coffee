# Description
#  アルパカの癒し画像を返事します
#
# Commands
#  Hubot paca me - Receive a alpaca

module.exports = (robot) ->
  robot.respond /paca me/i, (msg) ->
    module.exports.request(msg) (err, res, body) -> 
      photos = JSON.parse(body).photos.photo
      msg.send photos[Math.floor(Math.random() * photos.length)].url_l

#Flickr APIにアクセスする
module.exports.request = (msg) ->
  msg.http("https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=18952dc6c587047c327fb59aebd18605&text=alpaca&sort=interestingness-desc&extras=url_l&format=json&nojsoncallback=1").get()
