class Sorter 

  constructor: ->
    do @bindTextField
    do @bindSelectAll
    do @bindCheckboxes
    do @bindSubmit

    @selectAll = false

    @userContacts = {
      dealID: 2
      contacts: 
        [{
          first_name:'Jonathan'
          last_name:'Taylor'
          email:'<jonathan@quikly.com>'
          },{
          first_name:'Scott'
          last_name:'Meves'
          email:'<scott@quikly.com>'
          },{
          first_name:'Shawn'
          last_name:'Gellar'
          email:'<shawn@quikly.com>'
          },{
          first_name:'Scott'
          last_name:'Meves'
          email:'<scott@quikly.com>'}
        ]
    }
    
    @contacts = (person for person in @userContacts.contacts)
    do @renderContacts
    


  renderContacts: =>
    el = $('.list-email')
    
    for contact, i in @contacts
      console.log i
      el.append('
        <label class="checkbox" for="checkboxes-0" data-name="'+contact.first_name+' '+contact.last_name+' '+contact.email+'">
          <input type="checkbox" name="checkboxes" id="checkboxes-0" value="'+contact.email+'">
          '+contact.first_name+' '+contact.last_name+'
        </label>
        ')


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
      if $('.list-email label').find(':checkbox:checked').length > 0
        $("#submit-btn").removeClass('disabled')
      else
        $("#submit-btn").addClass('disabled')
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

