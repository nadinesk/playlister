10.times do
  Tvshow.create(
    title: Faker::Ancient.hero,
    
    price: Faker::Number.number(4)
  )
  Mood.create(title: Faker::Ancient.hero)
end

counter = 1
Tvshow.all.each do |tvshow|
  tvshow.mood_id = counter
  tvshow.save
  counter += 1
end

FactoryGirl.create(:user)
