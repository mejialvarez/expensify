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
    var monthAgo = $(this).attr('data-month-ago');

    $('#month_ago').val(monthAgo);

    $('.expense-search-form').submit();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
