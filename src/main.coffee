class Landing
  
  detailsBtn = ''
  returnBtn = ''
  shareBtn = ''
  handleBar = ''
  bar = ''
  mainWrap = ''
  
  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn  = $('.return-btn')
    @handleBar  = $('.handlebar')
    @bar  = $('.bar')
    @shareBtn   = $('.share')
    @mainWrap   = $('#main-wrap')
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
      console.log 'hello'
      @bar.toggleClass('collapse')
      $('.wheel-wrap').toggleClass('collapse')
      @detailsBtn.toggle()
      @returnBtn.toggleClass('invisible')
      
    , {
        context: '#main-wrap',
        offset: '0px'
           #(-$(this).height())
    })

  onClick: (e, el) =>
    e.preventDefault()
    href = el.attr('href')
    offsetTop = $(href).offset().top+1;
    
    @mainWrap.stop().animate({ 
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