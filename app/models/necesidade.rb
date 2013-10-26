class Necesidade < ActiveRecord::Base
	belongs_to :comunals
	belongs_to :grupo

	def file_ext=(x)
		@ar = x
		write_attribute(:file_ext,"#{x.original_filename.split('.').last}")
	end

	after_save :foto
	def foto
		if @ar
			xd = File.join("public/pdf","#{id}.#{file_ext}")
			File.open(xd,"wb") do |x|
				x.write(@ar.read)
			end
		end
	end
end
