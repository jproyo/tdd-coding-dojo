require_relative 'month_day'

class WorkingDatesCalendar

	def initialize
		@non_working_days = []
		@non_working_month_day = []
	end

	def is_non_working_date(date)
		true if is_non_working_day?(date) or is_non_working_month_day?(date)
	end

	def is_non_working_month_day?(date)
		@non_working_month_day.include?(MonthDay.new(date.day,Date::ABBR_MONTHNAMES[date.month]))
	end

	def is_non_working_day?(date)
		@non_working_days.include?(Date::DAYNAMES[date.wday])
	end

	def add_non_working_day(day)
		@non_working_days << day
	end

	def add_non_working_month_day(day, month)
		@non_working_month_day << MonthDay.new(day, month)
	end


end