class Event < ApplicationRecord
	has_many :attendances, dependent: :destroy
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

	 has_one_attached :illustration

	validates :start_date, presence: true
	validate :start_date_is_not_past
	#Vérifie que la date de départ n'est pas dans le passé


	validates :duration, presence: true
	
	validate :multiple_of_5
	#nombre de minutes doit être un multiple de 5


  	validates :title, length: { in: 5..140 }

	validates :description, length: { in: 20..1000 }


	validate :price_between_1_and_1000
	#Vérifie que le prix estcompris entre 1 et 1000

	validates :location, presence: true



	def price_between_1_and_1000
	  if self.price<1
	     self.errors.add(:price, "price must be > =1 euros")
	elsif self.price>1000
	     self.errors.add(:price, "price must be < 1000 euros")
	  end
	end

	def start_date_is_not_past
		if self.start_date - Time.now < 0
			self.errors.add(:start_date, "Your event is already past")
		end
	end

	def multiple_of_5
		if self.duration % 5 != 0
		self.errors.add(:duration, "The duration must be a multiple of 5")
		end	
	end




# check if user is already attendant to display or not stripe button in event_path
  def already_attendant?(current_user)
  	already_attendant = false

  	self.attendances.each do |attendance|
  		if attendance.user == current_user
  			already_attendant = true
  		end
  	end
  	return already_attendant
  end




end
