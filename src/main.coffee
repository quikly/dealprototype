class Landing
  
  detailsBtn = ''
  returnBtn = ''
  handleBar = ''
  handlebarSmall = ''
  

  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn  = $('.return-btn')
    @handleBar  = $('.handlebar')
    @handlebarSmall  = $('.handlebar-small')
    @initWaypoint()
    @bindButtons()

  bindButtons: =>
    @detailsBtn.bind 'click', (e) =>
        @onClick(e, $(e.currentTarget))
    @returnBtn.bind 'click', (e) =>
        @onReturn(e, $(e.currentTarget))


  initWaypoint: ->
    @handleBar.waypoint( (direction) =>
      if direction is 'down'
        @handleBar.fadeOut('fast')
        @detailsBtn.fadeOut('fast')

        @handlebarSmall.fadeIn('fast')
        @returnBtn.fadeIn('fast')
      else
        @handleBar.fadeIn('fast')
        @detailsBtn.fadeIn('fast')
        
        @returnBtn.fadeOut('fast')
        @handlebarSmall.fadeOut('fast')
    , {
        context: '#main-wrap',
        offset: '-200px'
    })

  onClick: (e, el) =>
    e.preventDefault()
    href = el.attr('href')
    offsetTop = $(href).offset().top+1;
    
    el.parent().parent().stop().animate({ 
        scrollTop: offsetTop
    }, 300)

  onReturn: (e,el) =>
    e.preventDefault()
    el.parent().parent().stop().animate({ 
        scrollTop: 0
    }, 300)

    
    

$(document).ready ->
  window.landing = new Landing