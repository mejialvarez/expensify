var ready = function() {
  $('.js-filter').click(function() {
    var $filterParent = $(this).parent();

    $filterParent.find('.js-filter').not(this).removeClass('active');
    $(this).toggleClass('active');

    filterExpenses($('#js-expenses-path').val());
  });

  function filterExpenses(url) {
    $.ajax({
      url: url,
      data: getFilterData(),
      dataType: 'script'
    });
  }

  function getFilterData() {
    var monthFilter = $('.js-month-filters .active')
    .attr('data-month-filter');

    var categoryFilter = $('.js-category-filters .active')
    .attr('data-category-filter');

    var transactionTypeFilter = $('.js-transaction-type-filters .active')
    .attr('data-transaction-type-filter');

    return {
      month_ago: monthFilter,
      category: categoryFilter,
      transaction_type: transactionTypeFilter
    };
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);
