class Sorter 

  constructor: ->
    do @bindTextField
    do @bindSelectAll
    @selectAll = false


  bindTextField: =>
    $('#searchField').bind( 'textchange', (e)->
      currentText = $(this).val().toLowerCase()
      console.log $('.controls').find("[data-name*='" + currentText + "']")
      if currentText != ''
        $('.controls .checkbox').hide();
        $('.controls').find("[data-name*='" + currentText + "']").show()
      else
        $('.controls .checkbox').show()
    )

  bindSelectAll: =>
    $(".checkall").on('click', (e)->
      console.log this.checked
      $('#names').find(':checkbox').prop('checked', this.checked)
    )

$(document).ready ->
  window.sorter = new Sorter