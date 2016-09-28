var ready = function() {
  $('.list-group-item').click(function() {
    var $filters = $(this).parent();
    var currentFilter = $filters.find('.active').attr('data');
    var filter = $(this).attr('data');
    if(currentFilter === filter) filter = '';

    $filters.find('input[type=hidden]').val(filter);

    $('.expense-search-form').submit();
  });

  $('.month-filter').click(function() {
    var month = $(this).attr('data-month');
    var year = $(this).attr('data-year');

    $('#month').val(month);
    $('#year').val(year);

    $('.expense-search-form').submit();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
