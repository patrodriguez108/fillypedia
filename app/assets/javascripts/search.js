$('document').ready(function() {
  $('#search-input').autocomplete({
    source: $('#search-input').data('autocomplete-source')
  })
})
