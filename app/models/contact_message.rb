class ContactMessage < ActiveRecord::Base
	belongs_to :game
	validates_presence_of :body, :game
	

	def validate
		if self.occurred >= Time.now
			errors.add(:occurred, "is in the future.")
		end
	end
end
