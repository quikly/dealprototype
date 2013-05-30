class Landing
  
  detailsBtn = ''
  returnBtn = ''
  

  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn = $('.return-btn')
    @initWaypoint()
    @bindButtons()

  bindButtons: =>
     @detailsBtn.bind 'click', (e) =>
      @onClick(e, $(e.currentTarget))

  initWaypoint: ->
    $('.detail').waypoint( (direction) ->
      console.log 'PING Down!'
    , {
        context: '#main-wrap'
    })

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