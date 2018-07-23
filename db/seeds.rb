# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
urls = ['https://code.tutsplus.com/tutorials/search/heroku', 'https://devcenter.heroku.com/articles/heroku-mysql',
'https://github.com/jainankita90/shorten_url','https://www.amazon.com/Amazon-Amazon-com-eGift-Cards/dp/BT00DC6QU4',
'https://brandavenue.rakuten.co.jp/contents/sale/'
]
urls.each do |u|
  s = ShortLink.new(main_url:u)
  s.save!
end
