namespace :karma do
  desc "TODO"
  task :sum => :environment do
    User.all.each do |user|
      puts "*"
      user.update_attribute(:total_karma, user.karma_points.sum(:value))
    end
  end

end
