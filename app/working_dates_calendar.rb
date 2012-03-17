require_relative 'year_day'

class WorkingDatesCalendar

	def initialize
		@non_working_days = []
		@non_working_year_day = []
	end

	def is_non_working_date(date)
		true if @non_working_days.include?(Date::DAYNAMES[date.wday]) or @non_working_year_day.include?(YearDay.new(date.day,Date::ABBR_MONTHNAMES[date.month]))
	end

	def add_non_working_day(day)
		@non_working_days << day
	end

	def add_non_working_year_day(day, month)
		@non_working_year_day << YearDay.new(day, month)
	end


end