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

	def embed(video)
		unless video.blank?
			youtube_id = video.split("=").last
			content_tag(:iframe, nil, class: "video", src: "http://www.youtube.com/embed/#{youtube_id}?rel=0&amp;modestbranding=1&amp;autohide=1&amp;showinfo=0&amp;controls=1&amp;frameborder=0 autoplay=0" , allowfullscreen:0)
  		end
  	end
end

