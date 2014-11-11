Dir["#{Rails.root}/app/managers/*.rb"].each {|file| require file }

SmartManaging.configure do |config|
  config.global_options({
    #style: :bootstrap3 #options available are :bootstrap3 or :bootstrap2
  })
end
