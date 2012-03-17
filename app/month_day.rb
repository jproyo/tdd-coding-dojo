class MonthDay

	attr :day, :month

	def initialize(day, month)
		@day = day
		@month = month
	end

	def ==(another_month_day)
		another_month_day.equal?(self) ||
		(another_month_day.instance_of?(self.class) &&
			another_month_day.day == @day &&
			another_month_day.month == @month
		)
	end

end