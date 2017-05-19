module DashboardHelper
  def columnChartData(expenses, opts={})
    data = []
    expenses.each do |transaction_type, expenses|
      data << {
        type: opts[:columnType],
        showInLegend: true,
        name: transaction_type.humanize,
        dataPoints: expenses
      }
    end
    data.to_json.html_safe
  end

  def cumulativeChartData(expenses)
    data = []
    expenses.each do |month_tag, expenses|
      data << {
        type: "area",
        showInLegend: true,
        name: month_tag.to_s.humanize,
        dataPoints: expenses
      }
    end
    data.to_json.html_safe
  end
end