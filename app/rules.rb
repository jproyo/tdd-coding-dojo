require 'date'
require_relative 'month_day'

module Rule
	class NonWorkingRule
		def is_non_working(date)
			yield date if block_given?
		end
	end

	class NonWorkingDayRule < NonWorkingRule

		def initialize(day)
			@day = day
		end

		def is_non_working(date)
			super(date) {|d| Date::DAYNAMES[d.wday] == @day }
		end
	end

	class NonWorkingMonthDayRule < NonWorkingRule

		def initialize(day,month)
			@month_day = MonthDay.new(day,month)
		end

		def is_non_working(date)
			super(date) {|d| MonthDay.new(d.day,Date::ABBR_MONTHNAMES[d.month]) == @month_day }
		end
	end
			
	class NonWorkingSpecificRule < NonWorkingRule

		def initialize(date)
			@specific_date = date
		end

		def is_non_working(date)
			super(date) {|d| d == @specific_date }
		end
	end

end