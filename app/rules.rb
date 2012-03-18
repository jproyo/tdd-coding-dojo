require 'date'

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
end