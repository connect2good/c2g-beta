module DonationsHelper
	def months
		content_tag :select do
			months = []
			for number in (1..12) do
				months.push(number)
  		end
  		months.each do |month|
  			concat content_tag :option, month
  		end
		end
	end

	def years
		content_tag :select do
			years = []
			for number in (2014..2020) do
				years.push(number)
  		end
  		years.each do |year|
  			concat content_tag :option, year
  		end
		end
	end

end
