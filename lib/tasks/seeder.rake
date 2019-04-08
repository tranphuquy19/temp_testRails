namespace :seeder do
    
    desc "Seed all tables"
  task all: :environment do
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
  end

  desc "Seed table categories"
  task category: :environment do
    category_list = [
      ["Kanji", "Hán tự", "kanji.jpg"],
      ["Grammar", "Ngữ pháp", "grammar.jpg"],
      ["Vocabulary", "Từ vựng", "vocabulary.jpg"],
      ["Listening", "Nghe", "listening.jpg"],
      ["JLPT", "JLPT", "jlpt.jpg"],
      ["Homework", "Bài tập về nhà", "homework.jpg"],
    ]
    category_list.each do |title, content, img|
      Category.create(title: title, content: content, img: img)
    end
  end

  desc "Seed table exams"
  task exam: :environment do
  end

  desc "Seed table posts"
  task :post, [:num] => [:environment] do |t, args|
    nums = args[:num].to_i
    ct = Faker::Markdown.headers + "\n" + "\n" + Faker::Markdown.emphasis + "\n" + Faker::Markdown.inline_code + "\n" + Faker::Markdown.unordered_list + "\n" + Faker::Markdown.block_code + "\n" + Faker::Markdown.table + "\n" + Faker::Markdown.emphasis

    r = Random.new

    nums.times do
      Post.create(title: Faker::Lorem.sentence, content: ct, tags: Faker::Lorem.words(2).join(","), user_id: r.rand(1...3), category_id: r.rand(1...6))
    end
  end

  desc "Seed table clases"
  task classs: :environment do
  end

  desc "Seed table questions"
  task question: :environment do
  end

  desc "Seed table comments"
  task comment: :environment do
  end

  desc "Seed table commons"
  task common: :environment do
  end

  desc "Seed table classMember"
  task classMember: :environment do
  end
end
