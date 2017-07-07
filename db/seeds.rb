
10.times do
  Tvshow.create(
    
    title: Faker::Ancient.hero,
    price: Faker::Number.number(4),
    time_commitment: Faker::Number.number(1),
    suspense_level: Faker::Number.number(1)
  )
  Mood.create(title: Faker::Hipster.words(1)[0])
end

counter = 171
Tvshow.all.each do |tvshow|
  tvshow.mood_id = counter
  tvshow.save
  counter += 1
end

FactoryGirl.create(:user)
