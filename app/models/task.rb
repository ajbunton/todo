class Task < ActiveRecord::Base
	belongs_to :list

	validates :desc, presence: true

	def self.is_complete(task)
		if task.complete == true
			'Complete'
		else
			'Incomplete'
		end
	end
end