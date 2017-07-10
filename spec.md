# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
	- User has_many :playlists
	- Mood has_many :mood_shows
  	- Playlist has_many :showlines  	
  	- Tvshow has_many :mood_shows
  	- Tvshow has_many :moods, through: :mood_shows
  	- Tvshow has_many :showlines

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
	- MoodShow belongs_to :tvshow
	- MoodShow belongs_to :mood
	- Playlist belongs_to :user
	- Showline  belongs_to :tvshow
  	- Showline belongs_to :playlist

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
	- Mood has_many :tvshows, through: :mood_shows
	- Playlist has_many :tvshows, through: :showlines
	- Tvshow has_many :moods, through: :mood_shows

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
	- Can create Mood and its Tvshows to create a moodshow record (new_mood_path, 'moods/new')

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	- validates :title, presence: true
	- validates :title, :suspense_level, :time_commitment, :price, presence: true
	- user through Devise: validates, email, password length

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	- /admin/stats	

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
	- moods/new
- [x] Include signup (how e.g. Devise)
	- Devise
- [x] Include login (how e.g. Devise)
	- Devise
- [x] Include logout (how e.g. Devise)
	- Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
	- Omniauth Facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	- users/2/playlists/3
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
	- moods/3/tvshows	
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
	- /moods/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate