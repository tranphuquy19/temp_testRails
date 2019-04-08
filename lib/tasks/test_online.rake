namespace :test_online do
  desc "Rails task myFaker"
  task myFaker: :environment do
    
  end

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
  end

  desc "Seed table exams"
  task exam: :environment do
  end

  desc "Seed table posts"
  task post: :environment do
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

  desc "Set Admin"
  task :setAdmin, [:id] => [:environment] do |t, args|
    u = User.find_by_id(args[:id])
    u.role = 2
    u.save
  end

end
