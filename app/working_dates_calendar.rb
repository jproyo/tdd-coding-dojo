require_relative 'month_day'

class WorkingDatesCalendar

	def initialize
		@non_working_days = []
		@non_working_month_day = []
		@non_working_date = []
	end

	def is_non_working_date(date)
		true if is_non_working_day?(date) or is_non_working_month_day?(date) or is_non_working_specific_date?(date)
	end

	def is_non_working_specific_date?(date)
		@non_working_date.include?(date)
	end

	def is_non_working_month_day?(date)
		@non_working_month_day.include?(MonthDay.new(date.day,Date::ABBR_MONTHNAMES[date.month]))
	end

	def is_non_working_day?(date)
		@non_working_days.any? {|rule| rule.is_non_working(date) }
	end

	def add_non_working_date(date)
		@non_working_date << date
	end

	def add_non_working_day(rule_day)
		@non_working_days << rule_day
	end

	def add_non_working_month_day(day, month)
		@non_working_month_day << MonthDay.new(day, month)
	end


end