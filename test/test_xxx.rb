require 'test/unit'
require 'date'
require_relative '../app/working_dates_calendar'

class TestXXX < Test::Unit::TestCase

	def test_when_calendar_has_a_non_working_day_of_weeks_returns_non_working_for_that_day_of_week
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day('Sunday')
		assert(argentine_calendar.is_non_working_date(some_sunday))
	end

	def test_when_calendar_has_a_working_day_of_weeks_returns_working_for_that_day_of_week
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day('Sunday')
		assert(!argentine_calendar.is_non_working_date(some_monday))
	end

	def test_when_calendar_has_more_than_one_non_working_day_a_week
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day('Sunday')
		argentine_calendar.add_non_working_day('Saturday')
		assert(argentine_calendar.is_non_working_date(some_saturday))
	end

	def test_4
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day('Sunday')
		argentine_calendar.add_non_working_day('Saturday')
		argentine_calendar.add_non_working_month_day(16,'Mar')
		assert argentine_calendar.is_non_working_date(january_first)
	end
	
	private

	def january_first
		Date.new(2012, 3, 16)
	end

	def some_sunday
		Date.new(2012, 3, 11)
	end

	def some_monday
		Date.new(2012, 3, 12)
	end

	def some_saturday
		Date.new(2012, 3, 10)
	end

end