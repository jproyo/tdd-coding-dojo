class WorkingDatesCalendar

	def initialize
		@non_working = []
	end

	def is_non_working_date(date)
		true if date.sunday? or date.saturday? or @non_working.include?(Date::DAYNAMES[date.wday])
	end

	def add_non_working_day(day)
		@non_working << day
	end

end