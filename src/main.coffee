class Landing
  
  detailsBtn = ''
  returnBtn = ''
  

  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn = $('.return-btn')
    @bindButtons()

  bindButtons: =>
     @detailsBtn.bind 'click', (e) =>
      @onClick(e, $(e.currentTarget))


  onClick: (e, el) =>
    e.preventDefault()
    href = el.attr('href')
    offsetTop = $(href).offset().top+1;
    console.log(offsetTop)
    el.parent().parent().stop().animate({ 
        scrollTop: offsetTop
    }, 300)

$(document).ready ->
  window.landing = new Landing