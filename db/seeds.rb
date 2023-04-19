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
    title: "",
    content: ""
    )
Post.create!(
    user_id: 4,
    title: "",
    content: ""
    )
Post.create!(
    user_id: 5,
    title: "",
    content: ""
    )
Post.create!(
    user_id: 6,
    title: "",
    content: ""
    )
Post.create!(
    user_id: 7,
    title: "",
    content: ""
    )
Post.create!(
    user_id: 8,
    title: "",
    content: ""
    )
Post.create!(
    user_id: 9,
    title: "",
    content: ""
    )


#sweet
Sweet.create!(:month => 12, :name => "", :description => "")
Sweet.create!(:month => 12, :name => "", :description => "")
Sweet.create!(:month => 11, :name => "", :description => "")
Sweet.create!(:month => 11, :name => "", :description => "")
Sweet.create!(:month => 10, :name => "", :description => "")
Sweet.create!(:month => 10, :name => "", :description => "")
Sweet.create!(:month => 9, :name => "", :description => "")
Sweet.create!(:month => 9, :name => "", :description => "")
Sweet.create!(:month => 8, :name => "", :description => "")
Sweet.create!(:month => 8, :name => "", :description => "")
Sweet.create!(:month => 7, :name => "索餅", :description => %{奈良・平安期に中国から伝来した唐菓子のひとつで、\n七夕に索餅を食べると疫病にかからないと言われた。})
Sweet.create!(:month => 7, :name => "土用餅", :description => %{土用は立春・立夏・立秋・立冬前の１８日間のこと。\n季節の変わり目であることから、精のつくものを食べる風習があり、和菓子では土用餅を食べる。})
Sweet.create!(:month => 6, :name => "水無月", :description => %{明治以降、この時期、主に京都で食べられる菓子。\n上の小豆は、邪気払いの意味。下の三角形の外郎は、氷室の節句の氷の見立てなどとされている。})
Sweet.create!(:month => 6, :name => "氷室饅頭", :description => %{6月1日の氷室の節句にちなむ。\n白は清浄、赤は厄除け、緑は健康など色の意味については諸説ある。})
Sweet.create!(:month => 5, :name => "柏餅", :description => %{5月5日端午の節句の日、主に関東で食べられる。\n柏の葉は昔、神への供物の食器として使われた。})
Sweet.create!(:month => 5, :name => "ちまき", :description => %{5月5日端午の節句の日、主に関西で食べられる。\nちまきを菓子として作るようになったのは、江戸時代から。})
Sweet.create!(:month => 4, :name => "", :description => "")
Sweet.create!(:month => 4, :name => "", :description => "")
Sweet.create!(:month => 3, :name => "", :description => "")
Sweet.create!(:month => 3, :name => "", :description => "")
Sweet.create!(:month => 2, :name => "", :description => "")
Sweet.create!(:month => 2, :name => "", :description => "")
Sweet.create!(:month => 1, :name => "花びら餅", :description => %{平安時代、朝廷では元日から３日間、長寿を願って歯固めの儀式から由来している和菓子。})
Sweet.create!(:month => 1, :name => "", :description => "")

Comment.create!(
   post_id: 1,
   comment: ""
)
Comment.create!(
   post_id: 2,
   comment: ""
)
Comment.create!(
   post_id: 3,
   comment: ""
)
Comment.create!(
   post_id: 4,
   comment: ""
)
Comment.create!(
   post_id: 5,
   comment: ""
)
Comment.create!(
   post_id: 6,
   comment: ""
)
Comment.create!(
   post_id: 7,
   comment: ""
)
Comment.create!(
   post_id: 8,
   comment: ""
)
