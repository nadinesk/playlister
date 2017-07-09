


10.times do
  Tvshow.create(
    title: Faker::Ancient.hero,
    price: Faker::Number.number(4),
    time_commitment: Faker::Number.number(1),
    suspense_level: Faker::Number.number(1)
  )
  Mood.create(title: Faker::Hipster.words(1)[0])
end



i = 0
10.times do |i|
  MoodShow.create(
    mood_id: i, 
    tvshow_id: i)
end

 FactoryGirl.create(:user) 