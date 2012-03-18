require 'test/unit'
require 'date'
require_relative '../app/working_dates_calendar'
require_relative '../app/rules'
require_relative 'test_helper'

class TestNonWorkingDatesCalendar < Test::Unit::TestCase

	def setup
		argentine_calendar = WorkingDatesCalendar.new
	end

	def test_when_calendar_has_a_non_working_day_of_weeks_returns_non_working_for_that_day_of_week
		add_non_working_day('Sunday')
		assert(argentine_calendar.is_non_working_date(some_sunday))
	end

	def test_when_calendar_has_a_working_day_of_weeks_returns_working_for_that_day_of_week
		add_non_working_day('Sunday')
		assert(!argentine_calendar.is_non_working_date(some_monday))
	end

	def test_when_calendar_has_more_than_one_non_working_day_a_week
		add_non_working_day('Sunday')
		add_non_working_day('Saturday')
		assert(argentine_calendar.is_non_working_date(some_saturday))
	end

	def test_when_calendar_has_non_working_day_in_a_specific_month_returns_non_working_for_that_day_of_month
		add_non_working_day('Sunday')
		add_non_working_day('Saturday')
		add_non_working_month_day(16,'Mar')
		assert argentine_calendar.is_non_working_date(march_sixteen)
	end

	def test_when_calendar_has_non_working_day_in_a_specific_month_returns_working_for_that_day_of_month
		add_non_working_day('Sunday')
		add_non_working_day('Saturday')
		add_non_working_month_day(17,'Mar')
		assert(!argentine_calendar.is_non_working_date(march_sixteen))
	end

	
	def test_when_calendar_has_non_working_date_returns_non_working_for_that_date
		add_non_working_month_date(specific_date)
		assert argentine_calendar.is_non_working_date(specific_date)
	end

	def test_when_calendar_has_non_working_date_returns_working_for_that_date
		add_non_working_month_date(march_sixteen)
		assert !argentine_calendar.is_non_working_date(march_seventeen)
	end

	private

	def add_non_working_month_date(date)
		argentine_calendar.add_non_working_rule(Rule::NonWorkingSpecificRule.new(date))
	end

	def add_non_working_month_day(day,month)
		argentine_calendar.add_non_working_rule(Rule::NonWorkingMonthDayRule.new(day,month))
	end

	def add_non_working_day(day)
		argentine_calendar.add_non_working_rule(Rule::NonWorkingDayRule.new(day))
	end

	def specific_date
		Date.new
	end

	def march_seventeen
		date_from(2012, 3, 17)
	end

	def march_sixteen
		date_from(2012, 3, 16)
	end

	def some_sunday
		date_from(2012, 3, 11)
	end

	def some_monday
		date_from(2012, 3, 12)
	end

	def some_saturday
		date_from(2012, 3, 10)
	end

end