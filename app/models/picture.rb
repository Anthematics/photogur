class Picture < ApplicationRecord
validates :artist,:url, presence: true
validates :artist, length: { in:3..20}
validates :url, uniqueness: true

	def self.newest_first
		Picture.order("created_at DESC")
	end

	def self.most_recent_five
		Picture.newest_first.limit(5)
	end

	def self.created_before(date)
		Picture.where("created_at < ?" , date)
	end

	def self.pictures_created_in_year(year)
		@pictures_created_in_year=[]
		Picture.all.each do |p|
			if p.created_at.year == year
				@pictures_created_in_year << p
			end
		end
		return @pictures_created_in_year
	end

end


#
# Add a new method pictures_created_in_year
# to Picture that accepts a year as an argument and
#  returns all pictures whose created_at falls within
#  that calendar year. Add sections for each year to your index
#   and display the corresponding pictures in each section.
