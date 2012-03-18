require_relative 'month_day'

class WorkingDatesCalendar

	def initialize
		@non_working_rules = []
	end

	def is_non_working_date(date)
		true if is_non_working_day?(date) or is_non_working_month_day?(date) or is_non_working_specific_date?(date)
	end

	def is_non_working_specific_date?(date)
		@non_working_rules.any? {|rule| rule.is_non_working(date) }
	end

	def is_non_working_month_day?(date)
		@non_working_rules.any? {|rule| rule.is_non_working(date) }
	end

	def is_non_working_day?(date)
		@non_working_rules.any? {|rule| rule.is_non_working(date) }
	end

	def add_non_working_date(rule_date)
		@non_working_rules << rule_date
	end

	def add_non_working_day(rule_day)
		@non_working_rules << rule_day
	end

	def add_non_working_month_day(rule_month)
		@non_working_rules << rule_month
	end


end