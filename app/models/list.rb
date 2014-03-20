class List < ActiveRecord::Base
	has_many :tasks, dependent: :destroy

	validates :name, presence: true, uniqueness: true

	def self.finished(list)
		tasks = list.tasks
		finished = tasks.all? do |task|
			task.complete == true
		end

		if tasks.all.length == 0
			"empty"

		elsif finished == true
			"complete!"
		else
			"incomplete."
		end
	end
end