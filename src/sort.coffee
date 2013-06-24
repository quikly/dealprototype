class Sorter 

  constructor: ->
    do @bindTextField
    do @bindSelectAll
    @selectAll = false


  bindTextField: =>
    $('#txtfld').bind( 'textchange', (e)->
      currentText = $(this).val().toLowerCase()
      if currentText != ''
        $('#names li').hide();
        $("#names").find("[data-name*='" + currentText + "']").show()
      else
        $('#names li').show()
    )

  bindSelectAll: =>
    $(".checkall").on('click', (e)->
      console.log this.checked
      $('#names').find(':checkbox').prop('checked', this.checked)
    )

$(document).ready ->
  window.sorter = new Sorter