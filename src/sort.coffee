class Sorter 

  constructor: ->
    do @bindTextField


  bindTextField: =>


    $('#txtfld').bind( 'textchange', (e)->
      console.log $(this).val()
      currentText = $(this).val()
      $('#names li').hide();
      $("#names").find("[data-name*='" + currentText + "']").show()
      console.log $("#names").find("[data-name*='" + currentText + "']")
    )

$(document).ready ->
  window.sorter = new Sorter