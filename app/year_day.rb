class YearDay

	attr :day, :month

	def initialize(day, month)
		@day = day
		@month = month
	end

	def ==(another_year_date)
		another_year_date.equal?(self) ||
		(another_year_date.instance_of?(self.class) &&
			another_year_date.day == @day &&
			another_year_date.month == @month
		)
	end

end