class Landing
  
  detailsBtn = ''
  returnBtn = ''
  shareBtn = ''
  handleBar = ''
  
  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn  = $('.return-btn')
    @handleBar  = $('.handlebar')
    @shareBtn   = $('.share')
    @initWaypoint()
    @bindButtons()

  bindButtons: =>
    @detailsBtn.bind 'click', (e) =>
        @onClick(e, $(e.currentTarget))
    @returnBtn.bind 'click', (e) =>
        @onReturn(e, $(e.currentTarget))
    @shareBtn.hover (e) =>
        @shareHover($(e.currentTarget))


  initWaypoint: ->
    @handleBar.waypoint( (direction) =>
      @handleBar.toggleClass('collapse')
      $('.wheel-wrap').toggleClass('collapse')
      
      if direction is 'down'
        @detailsBtn.fadeOut('fast')
        @returnBtn.fadeIn('fast')
      else
        @detailsBtn.fadeIn('fast')
        @returnBtn.fadeOut('fast')
        
    , {
        context: '#main-wrap',
        offset: '0px'
           #(-$(this).height()) + 80 + 'px'
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

  shareHover: (el) =>
    $('.share-items').toggleClass('slide-down');


    
    

$(document).ready ->
  window.landing = new Landing