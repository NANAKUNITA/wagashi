# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#admin
Admin.create(:email => 'admin@mail', :password => 'admin1234')

#user
User.create!(
    email: "hanako@mail",
    name: "hana2",
    password: "abc1234",
    #image: File.open("./app/assets/images/profile.jpg")
)
User.create!(
    email: "maru@mail",
    name: "国丸屋",
    password: "abc1234",
    #image: File.open("./app/assets/images/profile2.jpg")
)

User.create!(
    email: "text@mail",
    name: "yeswoman",
    password: "abc1234",
    #image: File.open("./app/assets/images/profile2.jpg")
)


#post
Post.create!(
   user_id: 1,
   title: "🌸本日の和菓子🌸",
   content: "今日は、３色団子を今年初めて食べました！
   やはり、毎年どうしても食べたくなる一品です…。
   また、4月中に春の和菓子を共有しますね！ではまた！"
)
Post.create!(
   user_id: 2,
   title: "来月のご案内",
   content: "来月、5月22日に国丸屋本店にて、和菓子イベントを開催いたします！
   5月の和菓子だけではなく、1月から12月までの季節の和菓子をそれぞれ数量限定でご用意いたします。
   ぜひ、この機会にお試しくださいませ！
   場所日時などの詳しい情報は、国丸屋のホームページにてご確認ください。"
)
Post.create!(
    user_id: 3,
    title: "美味しいお菓子",
    content: "久しぶりに和菓子を食べてみました。\nこんなゆったりとした時間を過ごすのはいつぶりでしょうか。桜餅、また食べたいです。"
    )


#sweet
Sweet.create!(:month => 12, :name => "顔見世", :description => "顔見世とは、11月〜12月に上演される歌舞伎の年中行事のこと。和菓子の顔見世は、歌舞伎役者の着物の袖を意匠化したもの。")
Sweet.create!(:month => 12, :name => "五平餅", :description => "中部地方の山間部発祥の郷土食といわれる。来年の豊作を願って神に捧げた山仕事の人々が安全を願って食べた、などと言われている。")
Sweet.create!(:month => 11, :name => "銀杏餅", :description => "11月19日の裏千家宗旦忌では、この銀杏を使って川端道喜が作る銀杏餅が茶会の主菓子とされる。この時期、京都の町中の菓子屋にもさまざまな銀杏餅が並ぶ。")
Sweet.create!(:month => 11, :name => "", :description => "")
Sweet.create!(:month => 10, :name => "栗きんとん", :description => "栗餡にそぼろ状の栗を混ぜ、茶巾で絞って栗の形に仕立てる岐阜県中津市の銘菓。")
Sweet.create!(:month => 10, :name => "山づと", :description => "山里からの土産という意味。栗入りの餡を筒状にし、蒸した薯蕷（じょうよ）皮で巻いて小口に切ったものもある。")
Sweet.create!(:month => 9, :name => "光琳菊", :description => "江戸中期の琳派の絵師・尾形光琳由来の和菓子。尾形光琳の作品は、和菓子のデザインにしばしば用いられる。")
Sweet.create!(:month => 9, :name => "", :description => "")
Sweet.create!(:month => 8, :name => "葛饅頭", :description => "葛粉に砂糖などを加えた生地の中に、餡を入れたもの。")
Sweet.create!(:month => 8, :name => "葛焼き", :description => "京都の夏の定番。昔は葛・水・砂糖を混ぜ合わせたものを鍋に少し油を塗って焼くとあり、小豆は使われていなかったようだ。")
Sweet.create!(:month => 7, :name => "索餅", :description => %{奈良・平安期に中国から伝来した唐菓子のひとつで、\n七夕に索餅を食べると疫病にかからないと言われた。})
Sweet.create!(:month => 7, :name => "土用餅", :description => %{土用は立春・立夏・立秋・立冬前の１８日間のこと。\n季節の変わり目であることから、精のつくものを食べる風習があり、和菓子では土用餅を食べる。})
Sweet.create!(:month => 6, :name => "水無月", :description => %{明治以降、この時期、主に京都で食べられる菓子。\n上の小豆は、邪気払いの意味。下の三角形の外郎は、氷室の節句の氷の見立てなどとされている。})
Sweet.create!(:month => 6, :name => "氷室饅頭", :description => %{6月1日の氷室の節句にちなむ。\n白は清浄、赤は厄除け、緑は健康など色の意味については諸説ある。})
Sweet.create!(:month => 5, :name => "柏餅", :description => %{5月5日端午の節句の日、主に関東で食べられる。\n柏の葉は昔、神への供物の食器として使われた。})
Sweet.create!(:month => 5, :name => "ちまき", :description => %{5月5日端午の節句の日、主に関西で食べられる。\nちまきを菓子として作るようになったのは、江戸時代から。})
Sweet.create!(:month => 4, :name => "", :description => "")
Sweet.create!(:month => 4, :name => "", :description => "")
Sweet.create!(:month => 3, :name => "いがまんじゅう", :description => "三河地域で雛祭りの日に供えて食べる。赤は桃の花、緑は新緑、黄は菜の花を表している。")
Sweet.create!(:month => 3, :name => "ぼた餅", :description => "彼岸にぼた餅を食べるという風習が定着したのは江戸時代といわれる。季節ごとに名前が変わり、春はぼた餅、夏は夜船、秋はおはぎ、冬は北窓という。")
Sweet.create!(:month => 2, :name => "玉椿", :description => "大名家の婚礼にために作られた。薄桃色の求肥が椿の花、中の黄身餡が花芯を表す。")
Sweet.create!(:month => 2, :name => "立春大福", :description => "")
Sweet.create!(:month => 1, :name => "花びら餅", :description => %{平安時代、朝廷では元日から３日間、長寿を願って歯固めの儀式から由来している和菓子。})
Sweet.create!(:month => 1, :name => "笑顔饅頭", :description => "縁起のよい銘や意匠から、正月慶事の贈答品などに用いられる。")

#これを入れると、error
#Comment.create!(
   #post_id: 1,
   #comment: "私もわかります！いつも３本は買って食べてしまいます（笑）"
#)
#Comment.create!(
   #post_id: 2,
   #comment: "行きたいです！楽しみにしています✨"
#)
#Comment.create!(
   #post_id: 3,
   #comment: "桜餅、すでに私は今年６個食べました！いろんなお店のを食べてみると面白いですよ！"
#)
