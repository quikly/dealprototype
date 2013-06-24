class Sorter 

  constructor: ->
    do @bindTextField
    do @bindSelectAll
    do @bindCheckboxes
    do @bindSubmit

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
    $("#selectall").on('click', (e)->
      $('.list-email label').find(':checkbox').prop('checked', this.checked)
    )

  bindCheckboxes: =>
    $('.list-email label').find(':checkbox').on('click', (e)->
      if $('.list-email label').find(':checkbox:checked').length > 0
        $("#submit-btn").removeClass('disabled')
      else
        $("#submit-btn").addClass('disabled')
    )

  bindSubmit: => 
    $("#submit-btn").on('click', (e)=>
      e.preventDefault()
      sendTo = [] 
      $('.list-email label').find(':checkbox:checked').each( (addresses)->
        sendTo.push $(this).val()
        console.log sendTo
      )
    )

$(document).ready ->
  window.sorter = new Sorter