require 'test/unit'
require 'date'
require_relative '../app/working_dates_calendar'
require_relative '../app/rules'

class TestXXX < Test::Unit::TestCase

	def test_when_calendar_has_a_non_working_day_of_weeks_returns_non_working_for_that_day_of_week
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Sunday'))
		assert(argentine_calendar.is_non_working_date(some_sunday))
	end

	def test_when_calendar_has_a_working_day_of_weeks_returns_working_for_that_day_of_week
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Sunday'))
		assert(!argentine_calendar.is_non_working_date(some_monday))
	end

	def test_when_calendar_has_more_than_one_non_working_day_a_week
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Sunday'))
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Saturday'))
		assert(argentine_calendar.is_non_working_date(some_saturday))
	end

	def test_when_calendar_has_non_working_day_in_a_specific_month_returns_non_working_for_that_day_of_month
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Sunday'))
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Saturday'))
		argentine_calendar.add_non_working_month_day(Rule::NonWorkingMonthDayRule.new(16,'Mar'))
		assert argentine_calendar.is_non_working_date(march_sixteen)
	end

	def test_when_calendar_has_non_working_day_in_a_specific_month_returns_working_for_that_day_of_month
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Sunday'))
		argentine_calendar.add_non_working_day(Rule::NonWorkingDayRule.new('Saturday'))
		argentine_calendar.add_non_working_month_day(Rule::NonWorkingMonthDayRule.new(17,'Mar'))
		assert(!argentine_calendar.is_non_working_date(march_sixteen))
	end

	
	def test_when_calendar_has_non_working_date_returns_non_working_for_that_date
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_date(Rule::NonWorkingSpecificRule.new(specific_date))
		assert argentine_calendar.is_non_working_date(specific_date)
	end

	def test_when_calendar_has_non_working_date_returns_working_for_that_date
		argentine_calendar = WorkingDatesCalendar.new
		argentine_calendar.add_non_working_date(Rule::NonWorkingSpecificRule.new(march_sixteen))
		assert !argentine_calendar.is_non_working_date(march_seventeen)
	end

	private

	def specific_date
		Date.new
	end

	def march_seventeen
		Date.new(2012, 3, 17)
	end

	def march_sixteen
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