# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#user
User.create!(
    email: Faker::Internet.email,
    name: "hana2",
    password: "abc1234"
   #image: File.open("./app/assets/images/profile.jpg")
)
User.create!(
    email: Faker::Internet.email,
    name: "国丸屋",
    password: "abc1234"
   #image: File.open("./app/assets/images/profile2.jpg")
)

#post
Post.create!(
   user_id: 1,
   title: "🌸本日の和菓子🌸",
   content: "今日は、花筏（はないかだ）という和菓子を試してみました！この和菓子は、水面に散って離れていく桜をイメージした和菓子だそうです🌸咲いている桜も綺麗ですが、散っているところまで美しく表現できるのはとても素敵なことですね…✨また、4月中に春の和菓子を共有しますね！ではまた！",
   #image: File.open("./app/assets/images/post1.jpg")
)
Post.create!(
   user_id: 2,
   title: "来月のご案内",
   content: "来月、5月22日に国丸屋本店にて、和菓子イベントを開催いたします！5月の和菓子だけではなく、1月から12月までの季節の和菓子をそれぞれ数量限定でご用意いたします。ぜひ、この機会にお試しくださいませ！場所日時などの詳しい情報は、国丸屋のホームページにてご確認ください。",
   #image: File.open("./app/assets/images/profile2.jpg")
)

#sweet
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")
Sweet.create!(:name => "")