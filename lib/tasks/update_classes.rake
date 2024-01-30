namespace :update_classes do
  desc 'updates ballet class names'
  task :add_names => :environment do
    BalletClass.all().each do |f|
      f.update_attribute :class_name, f.ballet_level.name
    end
  end
end
