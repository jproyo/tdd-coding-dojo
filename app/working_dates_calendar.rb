require_relative 'month_day'

class WorkingDatesCalendar

	def initialize
		@non_working_rules = []
	end

	def is_non_working_date(date)
		true if @non_working_rules.any? {|rule| rule.is_non_working(date) }
	end

	def add_non_working_rule(rule)
		@non_working_rules << rule
	end


end