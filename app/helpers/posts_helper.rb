module PostsHelper

	def timeline_datetimes(date) 
		if date.today?
			"Today"
		elsif date.to_date == Date.yesterday
			"Yesterday"
		elsif (date > Date.today - 7) && (date < Date.yesterday)
			date.strftime("%A")
		else
			date.strftime("%e %h")
		end
	end
end

