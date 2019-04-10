require 'json'
require 'time'

namespace :seeder do
    
    desc "Seed all tables"
  task all: :environment do
    puts "Make sure \'rails db:drop\' and \'rails db:migrate\' has been run!"
    Rake::Task["seeder:user"].invoke
    puts "Seeding users"
    Rake::Task["seeder:category"].invoke
    puts "Seeding categories"
    Rake::Task["seeder:post"].invoke(20)
    puts "Seeding posts"
    Rake::Task["seeder:question"].invoke
    puts "Seeding questions"
    Rake::Task["seeder:exam"].invoke
    puts "Seeding exams"
    Rake::Task["seeder:testSession"].invoke
    puts "Seeding test sessions"
    Rake::Task["seeder:sessionMember"].invoke
    puts "Seeding session members"
    Rake::Task["seeder:classs"].invoke
    puts "Seeding classes"
    Rake::Task["seeder:classMember"].invoke
    puts "Seeding class members"
  end

  desc "Seed table users"
  task user: :environment do
    user_list = [
      ["Trần Phú Quy", "tranphuquy19@gmail.com", "123456789"],
      ["Châu Thị Tư", "chauthitu@gmail.com", "123456789"],
      ["", "tranchivi@gmail.com", "123456789"]
    ]
    user_list.each do |name, email, pass|
      User.create(name: name, email: email, password: pass)
    end
    47.times do |i|
      User.create(name: "user"+i.to_s, email: "user"+i.to_s+"@exam.com", password: "123456789")
    end
  end

  desc "Seed table categories"
  task category: :environment do
    category_list = [
      ["Kanji", "Hán tự", "homework-2.jpg"],
      ["Grammar", "Ngữ pháp", "homework-4.jpg"],
      ["Vocabulary", "Từ vựng", "homework-5.jpg"],
      ["Listening", "Nghe", "homework-7.jpg"],
      ["JLPT", "JLPT", "homework-9.jpg"],
      ["Homework", "Bài tập về nhà", "vocabulary8.jpg"],
    ]
    category_list.each do |title, content, img|
      Category.create(title: title, content: content, img: img)
    end
  end

  desc "Seed table exams"
  task exam: :environment do
    #10: thoi gian , 1: cau hoi dau tien , 10: cau hoi cuoi cung , 1: id_user, 1:cate
    exam_list = [
      ["Kiểm tra Kanji đề 1", 10, 1, 10, 1, "category/kanji-33.png", 1],
      ["Kiểm tra Kanji đề 2", 10, 5, 15, 1, "category/kanji10.png", 1],
      ["Kiểm tra Kanji đề 3", 10, 10, 20, 1, "category/homework-9.jpg", 1],
      ["Kiểm tra Kanji đề 4", 10, 15, 25, 1, "category/kanji4.PNG", 1],
      ["Kiểm tra Kanji đề 5", 30, 1, 25, 1, "category/kanji5.jpeg", 1],
      ["Kiểm tra Kanji đề 6", 10, 20, 30, 1, "category/kanji6.jpeg", 1],
      ["Kiểm tra Kanji đề 7", 10, 25, 35, 1, "category/kanji7.jpeg", 1],
      ["Kiểm tra Kanji đề 8", 10, 30, 37, 1, "category/kanji8.jpg", 1],
      ["Kiểm tra Kanji đề 9", 10, 24, 34, 1, "category/kanji9t.jpg", 1],
      ["Kiểm tra Kanji đề 10", 30, 15, 37, 1, "category/kanji10.png", 1],
      ["Kiểm tra Kanji tổng kết kanji", 60, 1, 37, 1, "category/homework-1.jpg", 1],
      ["Kiểm tra từ vựng đề 1", 15, 38, 48, 2, "category/vocabulary1.jpg", 3],
      ["Kiểm tra từ vựng đề 2", 15, 40, 50, 2, "category/vocabulary2.png", 3],
      ["Kiểm tra từ vựng đề 3", 15, 45, 55, 2, "category/vocabulary3.jpg", 3],
      ["Kiểm tra từ vựng đề 4", 15, 50, 60, 2, "category/vocabulary4.png", 3],
      ["Kiểm tra từ vựng đề 5", 30, 38, 60, 2, "category/vocabulary5.png", 3],
      ["Kiểm tra từ vựng đề 6", 15, 55, 65, 2, "category/vocabulary6.jpg", 3],
      ["Kiểm tra từ vựng đề 7", 15, 60, 70, 2, "category/vocabulary7.jpg", 3],
      ["Kiểm tra từ vựng đề 8", 15, 65, 75, 2, "category/vocabulary8.jpg", 3],
      ["Kiểm tra từ vựng đề 9", 15, 70, 80, 2, "category/vocabulary9.jpg", 3],
      ["Kiểm tra từ vựng đề 10", 30, 55, 80, 2, "category/vocabulary10.jpg", 3],
      ["Kiểm tra từ vựng tổng kết từ vựng", 60, 38, 84, 2, "category/vocabulary11.png", 3],
      ["Kiểm tra ngữ pháp đề 1", 20, 85, 95, 2, "category/vocabulary1.jpg", 2],
      ["Kiểm tra ngữ pháp đề 2", 20, 90, 100, 2, "category/vocabulary9.jpg", 2],
      ["Kiểm tra ngữ pháp đề 3", 20, 95, 105, 2, "category/vocabulary6.jpg", 2],
      ["Kiểm tra ngữ pháp đề 4", 20, 100, 110, 2, "category/vocabulary3.jpg", 2],
      ["Kiểm tra ngữ pháp đề 5", 40, 85, 110, 2, "category/vocabulary5.png", 2],
      ["Kiểm tra ngữ pháp đề 6", 20, 105, 115, 2, "category/homework-1.jpg", 2],
      ["Kiểm tra ngữ pháp đề 7", 20, 110, 120, 2, "category/homework-4.jpg", 2],
      ["Kiểm tra ngữ pháp đề 8", 20, 115, 125, 2, "category/homework-8.jpg", 2],
      ["Kiểm tra ngữ pháp đề 9", 20, 120, 130, 2, "category/homework-6.jpg", 2],
      ["Kiểm tra ngữ pháp đề 10", 40, 105, 130, 2, "category/kanji10.png", 2],
      ["Kiểm tra ngữ pháp đề 11", 20, 125, 135, 2, "category/kanji4.PNG", 2],
      ["Kiểm tra ngữ pháp đề 12", 20, 130, 140, 2, "category/vocabulary10.jpg", 2],
      ["Kiểm tra ngữ pháp đề 13", 20, 135, 145, 3, "category/kanji6.jpeg", 2],
      ["Kiểm tra ngữ pháp đề 14", 20, 138, 148, 3, "category/kanji9.jpg", 2],
      ["Kiểm tra ngữ pháp đề 15", 40, 125, 148, 3, "category/homework-1.jpg", 2],
      ["Kiểm tra ngữ pháp tổng kết ngữ pháp", 100, 85, 148, 3, "category/vocabulary11.png", 2],
      ["Kiểm tra JLPT đề 1 ", 120, 1, 84, 3, "category/jlpt-1.png", 5],
      ["Kiểm tra JLPT đề 2", 120, 85, 148, 3, "category/JLPT-2.jpg", 5],
      ["Kiểm tra Homework đề 1", 30, 1, 20, 3, "category/homework-1.jpg", 6],
      ["Kiểm tra Homework đề 2 ", 30, 25, 45, 3, "category/homework-2.jpg", 6],
      ["Kiểm tra Homework đề 3 ", 30, 46, 66, 3, "category/homework-9.jpg", 6],
      ["Kiểm tra Homework đề 4 ", 30, 65, 85, 3, "category/homework-4.jpg", 6],
      ["Kiểm tra Homework đề 5 ", 30, 85, 105, 3, "category/homework-5.jpg", 6],
      ["Kiểm tra Homework đề 6 ", 30, 105, 125, 3, "category/homework-6.jpg", 6],
      ["Kiểm tra Homework đề 7 ", 30, 115, 135, 3, "category/homework-7.jpg", 6],
      ["Kiểm tra Homework đề 8 ", 30, 128, 148, 3, "category/homework-8.jpg", 6]
    ]
    r = Random.new
    exam_list.each do |title, time_remaining, qBegin, qEnd, user_id, img, category_id|
      a = Array(qBegin..qEnd).join(",")
      Exam.create(title: title, time_remaining: time_remaining, list_questions: a, category_id: category_id, user_id: r.rand(1...4))
    end
  end

  desc "Seed table posts"
  task :post, [:num] => [:environment] do |t, args|
    nums = args[:num].to_i
    r = Random.new
    nums.times do
      ct = Faker::Markdown.headers + "\n" + "\n" + Faker::Markdown.emphasis + "\n" + Faker::Markdown.inline_code + "\n" + Faker::Markdown.unordered_list + "\n" + Faker::Markdown.block_code + "\n" + Faker::Markdown.table + "\n" + Faker::Markdown.emphasis
      Post.create(title: Faker::Lorem.sentence, content: ct, tags: Faker::Lorem.words(2).join(","), user_id: r.rand(1...4), category_id: r.rand(1...6))
    end
  end

  desc "Seed table classes"
  task classs: :environment do
    classs_list = [
      ["Lớp học JLPT N5"],
      ["Lớp học JLPT N4"],
      ["Lớp học JLPT N3"],
      ["Lớp học JLPT N2"],
      ["Lớp học JLPT N1"],
      ["Lớp học kanji N5"],
      ["Lớp học kanji N4"],
      ["Lớp học kanji N3"],
      ["Lớp học kanji N2"],
      ["Lớp học kanji N1"],
      ["Lớp học từ vựng N5"],
      ["Lớp học từ vựng N4"],
      ["Lớp học từ vựng N3"],
      ["Lớp học từ vựng N2"],
      ["Lớp học từ vựng N1"],
      ["Lớp học ngữ pháp N5"],
      ["Lớp học ngữ pháp N4"],
      ["Lớp học ngữ pháp N3"],
      ["Lớp học ngữ pháp N2"],
      ["Lớp học ngữ pháp N1"]
    ]
    classs_list.each do |name|
      Classs.create(name: name)
    end
  end

  desc "Seed table test sessions"
  task testSession: :environment do
    #04/4/2019 : ngay thi , 7:00 : thoi gian thi , "1,2,3,4" : bộ câu hỏi , 1: cate , 2: id_user
    testSesss_list = [
      ["Kiểm tra Kanji khóa 18", "04/04/2019 7:00", "1,2,3,4", 1, 2, "category/9cfb4cdd6d3a7bea080e010d4a90eeb6.jpg"],
      ["Kiểm tra Kanji khóa 17", "04/06/2019 8:00", "1,2,5,7",1, 2, "category/9f228e44fcc4b928c01c93a984200e3c.jpg"],
      ["Kiểm tra Kanji khóa 16", "04/12/2019 14:00", "3,4,6,8", 1, 2, "category/9fc222cc8aaf35ed34b958f671de3d6d.jpg"],
      ["Kiểm tra Kanji khóa 15", "04/18/2019 13:00", "2,5,9,10", 1, 2, "category/9fc222cc8aaf35ed34b958f671de3d6dq.jpg"],
      ["Kiểm tra từ vựng khóa 18", "04/08/2019 8:00", "1,2,3,4", 3, 2, "category/82eedaf8933d78d14261854a39efd93e.jpg"],
      ["Kiểm tra từ vựng khóa 17", "04/10/2019 9:00", "1,2,5,7", 3, 2, "category/4366b9b215ba727d236e2c9d91dab48a.jpg"],
      ["Kiểm tra từ vựng khóa 16", "04/20/2019 15:00", "3,4,6,8", 3, 2, "category/a63b07ddc2042a1cdab194abc90d289d.jpg"],
      ["Kiểm tra từ vựng khóa 15", "04/24/2019 14:00", "2,5,9,10", 3, 2, "category/a41236dbe8a05921eec0fc470596eb7d.jpg"],
      ["Kiểm tra ngữ pháp khóa 18", "04/14/2019 9:00", "1,2,3,5", 2, 2, "category/df146775e376e2ee42e81074c7890b79.jpg"],
      ["Kiểm tra ngữ pháp khóa 17", "04/28/2019 10:00", "1,2,5,3", 2, 2, "category/JLPT-2.jpg"],
      ["Kiểm tra ngữ pháp khóa 16", "04/28/2019 16:00", "3,4,6,5", 2, 2, "category/ky-nang-hoc-tieng-nhat.jpg"],
      ["Kiểm tra ngữ pháp khóa 15", "04/26/2019 15:00", "2,5,9,1", 2, 2, "category/vocabulary-1.jpg"],
      ["Kiểm tra ngữ pháp khóa 14", "04/28/2019 10:00", "1,2,5,8", 2, 2, "category/reading-1.jpg"],
      ["Kiểm tra ngữ pháp khóa 13", "04/28/2019 16:00", "3,4,6,2", 2, 2, "category/vocabulary3.jpg"],
      ["Kiểm tra ngữ pháp khóa 12", "04/26/2019 15:00", "2,5,9,7", 2, 2, "category/vocabulary7.jpg"]
    ]
    testSesss_list.each do |content, datetime, list_exams, category_id, user_id, img|
      d = Time.strptime(datetime, "%m/%d/%Y %H:%M").strftime("%Y-%m-%d %H:%M:00")
      TestSession.create(content: content, list_exams: list_exams, time_public: d, user_id: user_id, category_id: category_id, img: img)
    end
  end

  desc "Seed table questions"
  task question: :environment do
    question_list = [
      [3, 1, "<u> 先週</u> デパートに かいものに いきました。", "せんしゅ", "せんしゅう", "ぜんしゅ", "ぜんしゅう", "イ"],
      [3, 1, "ごはんの <u> 後</u>で さんぽします。", "つぎ", "うしろ", "まえ", "あと", "エ"],
      [3,1, "もう いちど <u> 言って</u> ください。", "いって", "きって", "まって", "たって", "ア"],
      [3,1, "ちかくに <u> 山</u>が あります。", "かわ", "やま", "いけ", "うみ", "イ"],
      [3,1, "この ホテルは いやが <u> 多い</u>です。", "すくない", "おおい", "せまい", "ひろい", "イ"],
      [3,1, "ともだちと いっしょに <u> 学校</u>に いきます。", "がこう", "がこお", "がっこう", "がっこお", "ウ"],
      [3,1, "えんぴつが <u> 六本</u> あります。", "ろくぼん", "ろくぽん", "ろっぼん", "ろっぽん", "エ"],
      [3,1, "この <u> 新聞</u>は いくらですか。", "しんむん", "しんぶん", "しむん", "しぶん", "イ"],
      [3,1, "この カメラは <u> 安い</u>です。", "たかい", "やすい", "おもい", "かるい", "イ"],
      [3,1, "かさは <u> 外</u>に あります。", "いえ", "なか", "そと", "にわ", "ウ"],
      [3,3, "けさ <u> しゃわー</u>を おびました。", "シャワー", "シャウー", "ジャワー", "ジャウー", "ア"],
      [3,1, "コーヒーを <u> のみました</u>。", "食みました", "飲みました", "買みました", "帰ました", "イ"],
      [3,1, "<u> 郵便局 </u> の近くに引っ越したので便利です。", "ゆうびんきょく", "ゆびんきょく", "ようべんきょく", "よべんきょく", "ア"],
      [3,1, "初めまして。リンと<u> もうします </u>。", "由します", "曲します", "申します", "直します", "ウ"],
      [3,1, "財布が落ちていたので、交番に<u> 届けた</u>", "つづけた", "あずけた", "とどけた", "ほどけた", "ウ"],
      [3,1, "向こうの和室でお茶と<u> おかし </u>をいただきましょう。", "お菓子", "お果物", "お果子", "お菓物", "ア"],
      [3,1, "昔は、車の代わりに馬や牛<u> 荷物 </u>を運んだりした。", "みもつ", "かもつ", "にもつ", "いもつ", "ウ"],
      [3,1, "次の信号を左に<u> 曲がって </u>ください。", "もがって", "みがって", "むがって", "まがって", "エ"],
      [3,1, "まもなく電車が<u> まいります </u>。危ないですから、黄色い線まで下がってお待ちください。", "入ります", "参ります", "着ります", "回ります", "イ"],
      [3,1, "やり方は簡単です。心配は<u> 要りません </u>。", "ありません", "おりません", "たりません", "いりません", "エ"],
      [3,1, "この<u> ざっし </u>は、辞書があれば読める。", "冊子", "雑誌", "冊誌", "雑子", "イ"],
      [3,1, "<u>宿題 </u>を机の上に置いてしまった。", "すくだい", "しょくだい", "しゅくだい", "しくだい", "ウ"],
      [3,1, "これは夫がかいた<u>港 </u>の絵です。", "やまと", "みやこ", "うまた", "みなと", "エ"],
      [3,1, "電車が事故で<u>おくりました </u>。", "割れました", "送れました", "遅れました", "別れました", "ウ"],
      [3,1, "彼は<u>卒業式 </u>に出ませんでした。", "そっぎょうしき", "そちぎょうしき", "そつぎょうしき", "そうぎょうしき", "ウ"],
      [3,1, "紹介します。<u>つま </u>と息子です。", "夫", "妻", "主人", "家内", "イ"],
      [3,1, "<u>授業</u>の予定が変わった。", "じぎょう", "ずぎょう", "じゅうぎょう", "じゅぎょう", "エ"],
      [3,1, "彼女と結婚の<u>約束 </u>をした。", "よくそく", "よっそく", "やくそく", "やっそく", "ウ"],
      [3,1, "船より<u>ひこうき </u>のほうが速い。", "飛高機", "飛行機", "引行機", "引高機", "イ"],
      [3,1, "大学で<u>美術 </u>を勉強しています。", "ぎじつ", "ぎじゅつ", "びじつ", "びじゅつ", "エ"],
      [3,1, "<u>残念 </u>ですが、パーティーに出席できません。", "さんれん", "ざんれん", "ざっねん", "ざんねん", "エ"],
      [3,1, "自動販売機を使いたいので、一万円札を<u>細かく </u>してくれませんか。", "こまかく", "みじかく", "ほそかく", "やわらかく", "ア"],
      [3,1, "右をきれいにしたら、以前に<u>比べて</u>女性客が増えた。", "ひらべて", "くらべて", "ならべて", "こらべて", "イ"],
      [3,1, "<u>再来週</u>、面接試験を受けます。", "さらいしゅう", "さいらいしゅう", "せらいしゅう", "せいらいしゅう", "ア"],
      [3,1, "石けんが12<u>こ</u>、入っています。", "個", "台", "札", "故", "ア"],
      [3,1, "あのお寺の庭は、みどりが多くて<u>静か </u>です。", "にぎやか", "ゆたか", "しずか", "のどか", "ウ"],
      [3,1, "この ぼうしは 1000<u>えん</u>です。", "1000内", "1000用", "1000再", "1000円", "エ"],
      [3,3, "<u>ここは でぐちです。いりぐちは あちらです</u>。", "あちらから でて ください。", "あちらから おりて ください。", "あちらから はいって ください。", "あちらから わたって ください。", "ウ"],
      [3,3, "<u>にねんまえに きょうとへ いきました</u>。", "きのう きょうとへ いきました。", "おととい きょうとへ いきました。", "きょねん きょうとへ いきました。", "おととし きょうとへ いきました。", "エ"],
      [3,3, "<u>この まちには ゆうめいな たてものが あります</u>。", "この まちには ゆうめいな ビルが あります。", "この まちには ゆうめいな おちゃが あります。", "この まちには ゆうめいな ケーキが あります。", "この まちには ゆうめいな こうえんが あります。", "ア"],
      [3,3, "<u>その えいがは おもしろくなかったです</u>。", "その えいがは たのしかったです。", "その えいがは つまらなかったです。", "その えいがは みじかかったです。", "その えいがは ながかったです。", "イ"],
      [3,3, "<u>たんじょうびは 6がつ15にちです</u>。", "6がつ15にちに けっこんしました。", "6がつ15にちに テストが はじまりました。", "6がつ15にちに うまれました。", "6がつ15にちに くにへ かえりました。", "ウ"],
      [3,3, "車の事故にあったが、 ( ) よかった。", "気をつけて", "いいかげんで", "お気のとくで", "大したことがなくて", "エ"],
      [3,3, "( ) が、どうぞおはいりください。", "片付けられません", "散らかっています", "きれいにしません", "汚れてきます", "イ"],
      [3,3, "この店の一日の ( ) は、約 10万円です。", "売り場", "売り上げ", "売り切れ", "売り出し", "イ"],
      [3,3, "( ) 、たくさん召し上がってください。", "失礼して", "えんりょせずに", "けんそんせずに", "しょうちして", "イ"],
      [3,3, "ぼくは、毎朝、風呂場で ( ) をそります。", "ひじ", "はげ", "かび", "ひげ", "エ"],
      [3,3, "わたしの へやは この ( ) の 2かいです。", "エレベーター", "プール", "エアコン", "アパート", "エ"],
      [3,3, "さとうさんは ギターを じょうずに ( )。", "うたいます", "ききます", "ひきます", "あそびます", "ウ"],
      [3,3, "テーブルに おさらと はしを ( ) ください。", "ならべて", "とって", "たぺて", "あらって", "ア"],
      [3,3, "けさ そうじを したから へやは ( )です。", "きれい", "きたない", "あかるい", "くらい", "ア"],
      [3,3, "きょうは 500 ( ) およぎました。", "ど", "ばん", "メートル", "グラム", "ウ"],
      [3,3, "えきから たいしかんまでの ( ) を かいて ください。", "しゃしん", "ちず", "てがみ", "きっぷ", "イ"],
      [3,3, "うるさいから テレビを ( ) ください。", "けして", "つけて", "しめて", "あけて", "ア"],
      [3,3, "きょうは ( ) が ふって います。", "くもり", "はれ", "かぜ", "ゆき", "エ"],
      [3,3, "では、また ( ) お電話いたします。", "まもなく", "のちほど", "しばらく", "さきに", "イ"],
      [3,3, "昨日、運動しすぎて、からだの ( ) が痛いです。", "あのへん", "どこでも", "あちこち", "どこか", "ウ"],
      [3,3, "きんちょうしないで、 ( ) 話しましょう。", "おもいついて", "はりきって", "おちついて", "みなおして", "イ"],
      [3,3, "よくわかりません。もう少し ( ) せつめいしてくださいませんか。", "くわしく", "きびしく", "けわしく", "よろしく", "ア"],
      [3,3, "スキーで ( ) 足の骨をおってしまった。", "おちて", "たおれて", "ころんで", "つぶれて", "ウ"],
      [3,3, "ぼくは ( ) で、姉が一人、兄が二人います。", "ひとりっこ", "すえっこ", "ちょうなん", "じなん", "イ"],
      [3,3, "この野菜は ( ) 食べられません。ゆでるか焼くしてください。", "むいては", "ままでは", "なまでは", "にては", "ウ"],
      [3,3, "夫とは大学のとき( ) 、卒業後すぐにけっこした。", "出会って", "出会いして", "出会いで", "出会いにして", "ア"],
      [3,3, "荷物が届きましたが、それは私が注文したのと( ) 。", "ちがかったです", "まちがったです", "ちがっていました", "まちがえていました", "エ"],
      [3,3, "学歴が( ) 。", "大きい", "高い", "強い", "", "イ"],
      [3,3, "計画を( )。", "立てる", "作る", "みつける", "", "ア"],
      [3,3, "年を( )。", "すぎる", "とる", "ふえる", "", "イ"],
      [3,3, "きゅうけいを( )。", "作る", "とる", "やすむ", "", "イ"],
      [3,3, "楽しい生活を( )。", "いきる", "とる", "おくる", "", "ウ"],
      [3,3, "めいわくを( )。", "やる", "させる", "かける", "", "ウ"],
      [3,3, "ちょきんを( )。", "あずける", "おろす", "つむ", "", "イ"],
      [3,3, "体重が( )。", "のびる", "ふえる", "ふとる", "", "イ"],
      [3,3, "身長が( )。", "のびる", "ふえる", "やせる", "", "ア"],
      [3,3, "うそを ( ) はいけません。", "ひいて", "とって", "うつして", "ついて", "エ"],
      [3,3, "これからそちらに ( ) から、3時までには着くと思います。", "むかえます", "とどきます", "まにあいます", "むかいます", "エ"],
      [3,3, "えんぴつに消しゴムをつけたのは、よい ( ) だと思う。", "アイデア", "チャンス", "バランス", "テーマ", "ア"],
      [3,3, "ぼくは英語は 苦手だが、数学は ( ) だ。", "上手", "得意", "上等", "高級", "イ"],
      [3,3, "となりのせきが ( ) ので、荷物をそこに置いた。", "あいていた", "のこっていた", "すいていた", "あまっていた", "ア"],
      [3,3, "これ ( ) えんぴつです。", "に", "を", "は", "や", "ウ"],
      [3,3, "日本 ( ) ラーメンは おいしいです。", "に", "の", "を", "へ", "イ"],
      [3,3, "わたしには きょうだいが 二人 います。弟 ( ) いもうとです。", "は", "も", "と", "か", "ウ"],
      [3,3, "きのう、わたしは ひとり ( ) えいがを みに いきました。", "が", "を", "で", "は", "ウ"],
      [3,3, "駅まで タクシーで １０００えん ( ) です。", "ぐらい", "など", "ごろ", "も", "ア"],
      [3,3, "たまごりょうりの じょうずな つくりかたを ( ) 読みました。", "何に", "何も", "何かへ", "何かで", "エ"],
      [3,2, "( ) うちに、聞いたことをメモしておいたほうがいい。", "忘れる", "忘れない", "忘れている", "", "イ"],
      [3,2, "ほかのことに気を( ) うちにご飯を食べる時間がなくなってしまった。", "取られた", "取られない", "取られている", "", "ウ"],
      [3,2, "お風呂に( ) あだいに、配達のひとがきたようだ。", "入る", "入った", "入っている", "", "ウ"],
      [3,2, "私は夏休みの( ) 、アメリカの友達の家にいた。", "なかで", "あいだ", "あいだに", "", "イ"],
      [3,2, "4時に( )飛行機の時間には間に合わない。", "起きなければ", "起きてからでなけれは", "おきられてからでないと", "", "ア"],
      [3,2, "もっと夏くなってからでないと( )。", "海では泳げない", "仕事をしても疲れない", "せんぷうきを使わなくてもいい", "", "ア"],
      [3,2, "間もなく2時に( )ところです。", "なる", "なった", "なっている", "", "ア"],
      [3,2, "学校を休んでいる( ) 友達のお母さんにみられた。", "ところで", "ところに", "ところを", "", "ウ"],
      [3,2, "今、出かけるじゅんびをしている( )ちょっと待て。", "ところで", "ところを", "ところだから", "", "ウ"],
      [3,2, "じんせいは自分の( )とおりにはいかない。", "考え", "けいかく", "思う", "", "ウ"],
      [3,2, "この絵の( ) 30年前はこの辺ははたけだった。", "とおり", "どおり", "とおりの", "", "ア"],
      [3,2, "この虫はちほうによって呼び方が( )そうだ", "違う", "同じだ", "にている", "", "ア"],
      [3,2, "明日はところによっては( )。", "天気がみな違う", "どこも雨が降る", "雨が降るかもしれない", "", "ウ"],
      [3,2, "彼女はデートのたびに( )。", "元気がない", "遅れてくる", "いそがしそうだ", "", "イ"],
      [3,2, "この絵は本物ではないが、見れば( ) 本物に見える", "見るほど", "見えるほど", "見ないほど", "", "ア"],
      [3,2, "さしみは( ) 新鮮なほどおいしい。", "しんせんだと", "しんせんなら", "新鮮でなければ", "", "イ"],
      [3,2, "カンさんはピアノを( ) 歌を歌うのが上手だ。", "ひくたびに", "ひきながら", "ひくついでに", "", "イ"],
      [3,2, "銀行に行ったついでに( )。", "ぐうぜんリーさんに会った", "自転車に乗った", "花屋に寄って", "", "ウ"],
      [3,2, "ちょうどメルを聞いている( )本人が来た。", "までに", "あいだ", "ところに", "", "ウ"],
      [3,2, "先生の説明を聞いている( )だんだんわかってきた。", "うちに", "たびに", "ところを", "", "ア"],
      [3,2, "今朝( ) のどがいたかった。", "起きたとき", "起きたついでに", "起きているうちに", "", "ア"],
      [3,2, "自分に目で( ) 何ともお答えできない。", "確かめたとおりに", "たしかめてからでないと", "確かめたから", "", "イ"],
      [3,2, "今日のスポーツ大会は( ) 行います。", "予定どおり", "予定のうちに", "予定によって", "", "ア"],
      [3,2, "私の場合は、引っ越しする( ) 物が増える。", "ところに", "たびに", "ついでに", "", "イ"],
      [3,2, "あの子はここにかばんを( ) どこかへ行ってしまった。", "置いているあだに", "置いたついでに", "置いたまま", "", "ウ"],
      [3,2, "山道( ) 見える景色 がひろがっていく。", "登れば登るほど", "登っていって", "登っていってから", "", "ア"],
      [3,2, "感謝の言葉でも、言い方( ) 悪い意味に聞こえることもある。", "どおりでは", "たびに", "によっては", "", "ウ"],
      [3,2, "パーティーではたきさんのごちそうがでた。( ) ほどだった。", "全部食べた", "全部食べられる", "全部食べられない", "", "ウ"],
      [3,2, "最近、食事する時間もないほど( )。", "忙しい", "ひまだ", "あまりたべない", "", "ア"],
      [3,2, "きのうは本当に寒くて、からだが( )くらいだった。", "凍った", "凍るかと思う", "凍るかどうか", "", "イ"],
      [3,2, "京都の紅葉ほどうつくしいものは( )。", "ほかにもある", "ほかにない", "ほかにも少ない", "", "イ"],
      [3,2, "日本で富士山ぐらい( ) 山はないと思う。", "きれいな", "高い", "ほかの", "", "ア"],
      [3,2, "( ) くらいなら、今の生活レベルでがまんしよう。", "いい仕事がない", "仕事が欲しい", "きつい仕事をする", "", "ウ"],
      [3,2, "何もしないで後でざんねんがるくらいなら、( ) ほうがいい。", "なにも残念がらない", "あまりがんばらない", "失敗してもやってみた", "", "ウ"],
      [3,2, "旅行先でおいしい店が知りたければ、その土地の人に( ) にかぎる。", "聞く", "聞いた", "聞いている", "", "ア"],
      [3,2, "眠れないときは( ) にかぎる。", "4 時間", "温かいミルク", "朝、起きられない", "", "イ"],
      [3,2, "前のアパートが冬も暖かかったのに対して、( ) はとても寒い。", "今のアパート", "わたしの職場", "山川さんの家", "", "ア"],
      [3,2, "旧製品は長い間よく売れているのに対して、このしんせいひんは( )。", "明日発売になる", "あまりに気がない", "すぐに売りきれた", "", "イ"],
      [3,2, "この町は。夏はおおぜいのかんこうきゃくでにぎやかなはんめん、( )。", "冬は人が少ない", "ふゆもスキー客が多い", "一年中人が来る", "", "ア"],
      [3,2, "自動化は人が労働を減らしてくれる一方で、ひとのくふうするのうりょくを( )。", "変えてくれる", "たかくしてくれる", "低くしてしまう", "", "ウ"],
      [3,2, "山口君は( )一方で、静かに本を読むのも好きだという", "よくとしょかんにいく", "サッカーにむちゅうになる", "本をたくさん買う", "", "イ"],
      [3,2, "今日は急に気温が下がって、( ) というよりさむかった。", "涼しい", "暖かい", "暑い", "", "ア"],
      [3,2, "うちでは、いぬのチロはペットというより( )。", "家族なんで", "動物なんで", "かわいいんでん", "", "ア"],
      [3,2, "このアルバとはきついかわりに( )。", "休みがない", "給料がいい", "やってみたい", "", "イ"],
      [3,2, "わたしは夜( ) かわりに朝早く起きて勉強しています。", "遅く帰る", "眠くなる", "早く寝る", "", "ウ"],
      [3,2, "来週は今週( ) もっと忙しいくなると思いますよ。", "の反面", "というより", "より", "", "ウ"],
      [3,2, "仕事はなくなる( ) つらいことはない。", "くらい", "くらいなら", "くらいでは", "", "ア"],
      [3,2, "その人には一度会っただけだが、すぐにおもいだせる( ) とくちょうのあるひとだ。", "反面", "ほど", "かわりに", "", "イ"],
      [3,2, "疲れたときは寝る( )。", "に限る", "くらいだ", "よりいい", "", "ア"],
      [3,2, "えんりょしながらひとに手伝いを頼む( )、自分でやってしまったほうがいい。", "一方で", "というより", "くらいなら", "", "ウ"],
      [3,2, "うちでは母がパンが( ) 、父はパンはほとんど食べない。", "すきならすきなほど", "好きなのに対して", "すきというより", "", "イ"],
      [3,2, "林さんのお子さんにあいさつすると、へんじをする( ) いつもにこにこ笑う。", "かわりに", "はんめん", "のに対して", "", "ア"],
      [3,2, "年を取ると覚える力は弱くなる( ) 、深く考えられるようになる。", "というより", "反面", "し", "", "イ"],
      [3,2, "こんな方法でお金を手に入れるのは、頭がいい( ) ずるいと思う。", "というより", "くらいなら", "ばかりで", "", "ア"],
      [3,2, "もっと雪が( ) スキーはできない。", "降ってから", "降っているうちに", "降ってからでない", "降らない間に", "ウ"],
      [3,2, "祖父が( )、午後になって雨が降ってきた。", "言ってから", "言ったから", "言っていれば", "言ったとおり", "エ"],
      [3,2, "彼は会う( ) 政治の話をする。", "ところで", "たびに", "うちに", "一方で", "イ"],
      [3,2, "本屋でよみたいほんを( ) 、待ち合わせの時間を過ぎてしまった。", "探している間", "探しているうちに", "探しながら", "探してから", "イ"],
      [3,2, "リーさんはこの学校に( ) 、一度も欠席しなかった。", "留学している間", "留学してからでないと", "留学しているうちに", "留学しているところで", "ア"],
      [3,2, "クレジットカードは便利な( ) 、危険も多い。", "場合", "結果", "反面", "割合", "ウ"],
      [3,2, "私がこどものようふくをつくるのは、こどもの( )、自分のしゅみです。", "物というより", "物かわりに", "ためというより", "ためのかわりに", "ウ"],
      [3,2, "山田先生が( )、川島先生はすぐに怒る。", "いつも笑っているのに対して", "いつも笑っているのより", "あまり笑っているのに対して", "あまり笑っているのより", "ア"],
      [3,2, "連休はどこかに旅行に行く ( ) 、いえでパーティーをしたい。", "というより", "はんめん", "うちに", "かわりに", "エ"],
      [3,2, "かぜをひいたようだ。こんな時は無理を( ) 。今日は仕事を休もう。", "しないようだ", "しないにかぎる", "するようではない", "するのでもない", "イ"]
  ]
    question_list.each do |level, category_id, content, q1, q2, q3, q4, key|
      answers_hash = {:a => q1, :i => q2, :u => q3, :e => q4}.to_s
      case category_id
      when 1
        Question.create(level: level, content: content, answers: answers_hash, key: key, user_id: 1, category_id: category_id)
      when 2
        Question.create(level: level, content: content, answers: answers_hash, key: key, user_id: 2, category_id: category_id)
      else
        Question.create(level: level, content: content, answers: answers_hash, key: key, user_id: 3, category_id: category_id)
      end
    end
  end

  desc "Seed table comments"
  task comment: :environment do
    #3 user_id, 19 post_id 
    comment_list = [
      ["bài viết này hay quá!", 3, 1],
      ["bài viết này rất hữu ích", 4, 2],
      ["cảm ơn ", 5, 3],
      ["bài viết rất hay ", 6, 4],
      ["rất hữu ích", 7, 5],
      ["Hay quá... Cảm ơn sp nhé!", 8, 6],
      [" Xem đi xem lại càng thấy ngấm", 9, 7],
      ["Mình muốn mua sách tập đọc thì tn vậy ? ", 9, 8],
      ["bài viết này hay quá!", 10, 9],
      ["rất hay ", 11, 10],
      ["thích ghê :))", 12, 11],
      ["thực sự tuyệt vời lắm ạ", 13, 12],
      [" rất hay và thực tế !", 14, 13],
      ["Hay thật luôn ...!!!", 15, 14],
      ["Lên chiến lược mới thui...!", 16, 15],
      ["tuyệt vời!", 17, 16],
      ["Học để quên!", 18, 17],
      ["ngấm dần ngấm dần", 19, 18],
      ["Bản chất của việc nhớ là quên hahaha", 20, 19],
      ["ahihi ahihi !!!", 21, 20]
    ]
  end

  desc "Seed table commons"
  task common: :environment do
  end

  desc "Seed table session members"
  task sessionMember: :environment do
    #1,2,3 user_id, 2 test_session_id
    sessionMen_list = [
      ["26,27,7,4,5", 1],
      ["6,7,8,9,10", 2],
      ["11,12,13,14,15", 3],
      ["16,17,18,19,20", 4],
      ["21,22,23,24,25", 5],
      ["26,27,28,29,30", 6],
      ["31,32,33,34,35", 7],
      ["36,37,38,39,40", 8],
      ["41,42,43,44,45", 9],
      ["46,47,48,49,50", 10],
      ["30,35,40,45,50", 11],
      ["5,10,15,20,25", 12]
    ]
    sessionMen_list.each do |session_members, test_session_id|
      sm = session_members.split(",")
      sm.each do |user_id|
        SessionMember.create(user_id: user_id.to_i, test_session_id: test_session_id)
      end
    end
  end

  desc "Seed table classMember"
  task classMember: :environment do
    #4 là user_id, 9 classs_id 
    classMember_list = [
      [4, 1],
      [5,2],
      [6,3],
      [7,4],
      [8,5],
      [9,6],
      [10,7],
      [11,8],
      [12,9],
      [13,10],
      [14,11],
      [15,12],
      [16,13],
      [17,14],
      [18,15],
      [19,16],
      [20,17],
      [21,18],
      [22,19],
      [23,20],
      [24,1],
      [25,2],
      [26,3],
      [27,4],
      [28,5],
      [29,6],
      [30,7],
      [31,8],
      [32,9],
      [33,10],
      [34,11],
      [35,12],
      [36,13],
      [37,14],
      [38,15],
      [39,16],
      [40,17],
      [41,18],
      [42,19],
      [43,20],
      [44,1],
      [45,2],
      [46,3],
      [47,4],
      [48,5],
      [49,6],
      [50,1]
    ]
    classMember_list.each do |user_id, classs_id|
      ClassMember.create(user_id: user_id, classs_id: classs_id)
    end
  end
end
