class Sorter 

  constructor: ->

     #TODO: get real data
    @userContacts = do @spoofData
    
    @contacts = (person for person in @userContacts.contacts)
    do @renderContacts

    do @bindTextField
    do @bindSelectAll
    do @bindCheckboxes
    do @bindSubmit

    @selectAll = false


  renderContacts: =>
    el = $('.list-email')
    
    for contact, i in @contacts
      el.append('
        <label class="checkbox" for="checkboxes-'+i+'" data-name="'+contact.first_name+' '+contact.last_name+' '+contact.email+'">
          <input type="checkbox" name="checkboxes" id="checkboxes-'+i+'" value="'+i+'">
          '+contact.first_name+' '+contact.last_name+'
        </label>
        ')


  bindTextField: =>
    $('#searchField').bind( 'textchange', (e)->
      currentText = $(this).val()
      console.log $('.list-email').find("[data-name*='" + currentText + "']")
      if currentText != ''
        $('.list-email .checkbox').hide();
        $('.list-email').find("[data-name*='" + currentText + "']").show()
      else
        $('.list-email .checkbox').show()
    )

  bindSelectAll: =>
    $("#selectall").on('click', (e) ->
      $('.list-email .checkbox').find(':checkbox').prop('checked', this.checked)
      if $('.list-email .checkbox').find(':checkbox:checked').length > 0
        $("#submit-btn").removeClass('disabled')
      else
        $("#submit-btn").addClass('disabled')
    )

  bindCheckboxes: =>
    $('.list-email .checkbox').find(':checkbox').on('click', (e)=>
      
      if $('.list-email .checkbox').find(':checkbox:checked').length > 0
        $("#submit-btn").removeClass('disabled')
      else
        $("#submit-btn").addClass('disabled')
    )
   

  bindSubmit: => 
    $("#submit-btn").on('click', (e)=>
      e.preventDefault()
      people = @contacts
      sendTo = 
        deaID: @userContacts.dealID
        contacts: []
      #console.log 'people are ' + people + ' deal is ' + deal
      $('.list-email label').find(':checkbox:checked').each( (addresses)->
        sendTo.contacts.push people[$(this).val()]
      )
      console.log sendTo
    )

  ### 
  ======= REMOVE THIS FAKE DATA =======
  ###
  spoofData: ->
    {
      dealID: 2
      contacts: 
        [{
          first_name:'Jonathan'
          last_name:'Taylor'
          email:'jonathan@quikly.com'
          },{
          first_name:'Scott'
          last_name:'Meves'
          email:'scott@quikly.com'
          },{
          first_name:'Shawn'
          last_name:'Gellar'
          email:'shawn@quikly.com'
          },{
          first_name:'Brandon'
          last_name:'Gheen'
          email:'brandon@quikly.com'
          },{
          first_name:'Brian'
          last_name:'Rudolph'
          email:'brian@quikly.com'
          },{
          first_name:'Steven'
          last_name:'Rozanski'
          email:'steve@quikly.com'} 
        ]
    }

$(document).ready ->
  window.sorter = new Sorter

