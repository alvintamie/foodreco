class Survey < ActiveRecord::Base
  #attr_accessible :annual_salary, :birth_year, :friends_count, :gender, :name, :relationship_status, :religion
  #attr_accessible :occupation, :education

  attr_protected :id

  #serialize :education_from_facebook,   ActiveRecord::Coders::Hstore
  #serialize :occupation_from_facebook,  ActiveRecord::Coders::Hstore

  belongs_to  :user

  Survey::EDUCATION                   = ["Elementary School", "Secondary School", "O Level (High School)", "Polytechnic", "A Level (Junior College)", "University", "Masters/Phd"]

  Survey::GENDER                      = ["male", "female"]
  Survey::FRIENDS_COUNT               = ["0-50", "50 or more"]
  Survey::RELATIONSHIP_STATUS         = ["Single", "In a relationship", "Married"]
  Survey::RELIGION                    = ["Halal", "Non-Halal"]
  Survey::AGE                         = ["5-12", "13-19", "20-25", "26-40", "40 or older"]
  Survey::ANNUAL_SALARY               = ["0-3000", "3000-20000", "80000 or more"]  

  before_validation :set_name!

  validates :education,
            :presence => true,
            :on => :update,
            :inclusion => { :in => Survey::EDUCATION }

  validates :gender,
            :presence => true,
            :on => :update,
            :inclusion => { :in => Survey::GENDER }

  validates :friends_count_range,
            :presence => true,
            :on => :update,
            :inclusion => { :in => Survey::FRIENDS_COUNT }

  validates :relationship_status,
            :presence => true,
            :on => :update,
            :inclusion => { :in => Survey::RELATIONSHIP_STATUS }

  validates :religion,
            :presence => true,
            :allow_nil => false,
            :allow_blank => false,
            :on => :update,
            :inclusion => { :in => Survey::RELIGION }

  validates :age_range,
            :presence => true,
            :on => :update,
            :inclusion => { :in => Survey::AGE }

  validates :annual_salary_range,
            :presence => true,
            :on => :update,
            :inclusion => { :in => Survey::ANNUAL_SALARY }

  validates :name,
            :presence => true,
            :on => :update

  # validates :user,
  #           :presence => true

  # validates :user_id,
  #           :uniqueness => true

  def create_survey_from_omniauth(auth)
    self.gender_from_facebook               = auth.extra.raw_info.gender
    self.friends_count_from_facebook        = nil
    self.relationship_status_from_facebook  = auth.extra.raw_info.relationship_status
    self.religion_from_facebook             = auth.extra.raw_info.religion
    self.birthdate_to_age                   = auth.extra.raw_info.birthday
    #self.education_from_facebook            = {:education => auth.extra.raw_info.education, :work => auth.extra.raw_info.work}
    self.save
  end

  def gender_from_facebook=(unknown_gender)
    Survey::GENDER.each do |gender_matcher|
      self.gender = unknown_gender if gender_matcher == unknown_gender
    end
    write_attribute(:gender_from_facebook, unknown_gender)
  end

  def friends_count_from_facebook=(friends_count)
    range = Survey::FRIENDS_COUNT.match_numeric_range_with_value friends_count
    if range.present?
      self.friends_count_range = range
    end
    write_attribute(:friends_count_from_facebook, friends_count)
  end

  def relationship_status_from_facebook=(unknown_status)
    Survey::RELATIONSHIP_STATUS.each do |status_matcher|
      self.relationship_status = unknown_status if status_matcher == unknown_status
    end
    write_attribute(:relationship_status_from_facebook, unknown_status)
  end

  def religion_from_facebook=(unknown_religion)
    if unknown_religion.match(/(Islam)|(Muslim)/).present?
      food_preference = "Halal" 
    else
      food_preference = "Non-Halal" 
    end
    self.religion = food_preference
    write_attribute(:religion_from_facebook, unknown_religion)
  end


  def birthdate_to_age=(birthdate)
    birth_year =  birthdate.split("/").last.to_i
    age = Time.now.year - birth_year
    self.age_from_facebook = age
  end

  def age_from_facebook=(age)
    write_attribute(:age_from_facebook, age)
    range = Survey::AGE.match_numeric_range_with_value(age)
    self.age_range = range
  end

  private
  def set_name!
    self.name = self.user.name if self.user
  end

end
