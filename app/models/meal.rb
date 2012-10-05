class Meal < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_protected :id
  belongs_to :survey
  belongs_to :user

  Meal::DAYS        = %W[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
  Meal::HOURS       = (1..24).to_a
  Meal::PLACES      = ["Bakery/Dessert", "Beer", "Bistro/Brasserie", "Cafe", "Catering", "Cha Chaan Teng", "Coffee Shop", "Dance Clubs", "Deli", "Delivery", "Fast Food", "Karaoke", "Kiosk/Stall", "Lounge", "Pub/Bar", "Restaurant", "Tea", "Wine/Spirits"].sort
  Meal::CUISINES    = ["African", "Asian", "Chinese", "Beijing", "Cantonese", " Dongbei", "Foochow", "Fujian", "Hainanese", "Hakka", "Hangzhou", "Henan", "Hunan", "Jilin", "Mongolian", "Shaanxi", "Shandong", "Shanghainese", "Sichuan", "Taiwanese", "Teochew", "Xinjiang", "Yunnan", "Zi Char", "Indian", "North Indian", "Pakistani", "South Indian", "Indochinese", "Burmese", "Cambodian", "Thai", "Vietnamese", "Japanese", "Korean", "Malay / Indonesian", "Nepalese", "Nonya / Peranakan", "Philippine", "SingaporeanFusionHalalInternationalLatin American", "Argentinean", "Brazilian", "Caribbean", "MexicanMiddle Eastern", "Lebanese", "Persian", "TurkishPizzaSeafoodSteak and GrillsSteamboatVegetarianWestern", "American", "Cajun/Creole", "Australian", "Canadian", "European", "Belgian", "Czech", "Danish", "Dutch", "English", "French", "German", "Greek", "Irish", "Italian", "Portuguese", "Russian", "Spanish", "Swedish", "Swiss", "Mediterranean", "Moroccan", "New Zealand"].sort
  Meal::PRICES      = ["S$1-S$15", "S$16-S$30", "S$31-S$45", "S$46-S$60", "S$60 and more"]
  Meal::RECOMMENDED = ["After Work", "Alfresco/Outdoor", " ining", "Beer Lists", "Boys Night Out", "Breakfast", "Brunch", "Buffet", "Business Breakfast", "Business Dining", "Cheap Eat/Budget", "Children/Family", "Chillout", "Corporate Functions", "Dancing", "Dinner", "Fine Dining", "Girls Night Out", "Healthy Eating", "Hi Tea", "Hidden FindLarge Group", "Live Music", "Lunch", "People Watching", "Pet Friendly", "Private Dining", "Quiet/Peaceful", "Romance/First Dates", "Supper/Night Dining", "Take Away", "Vegetarians", "Vibrant/Noisy", "View/Scenery", "Waterfront", "Weddings", "Wheelchair Friendly", "Wine Lists"].sort

  validates :day,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :inclusion => { :in => Meal::DAYS }
            # ,
            # :uniqueness => { :scope => :user_id,
            #                 :message => "You've already picked %{value}" }

  validates :hour,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :inclusion => { :in => Meal::HOURS }
            # ,
            # :uniqueness => { :scope => [:user_id, :day],
            #                 :message => "You've already picked %{value} on that day" }


  validates :place,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :inclusion => { :in => Meal::PLACES }


  validates :cuisine,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :inclusion => { :in => Meal::CUISINES }

  validates :price,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :inclusion => { :in => Meal::PRICES }

  validates :recommended,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :inclusion => { :in => Meal::RECOMMENDED }



end
