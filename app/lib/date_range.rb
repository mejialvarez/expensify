class DateRange
  def self.month_ago(month=0)
    month_obj = month.to_i.month.ago.to_date
    month_obj.beginning_of_month..month_obj.end_of_month
  end

  def self.last_6_month
    6.month.ago.to_date.beginning_of_month..Date.today
  end
end