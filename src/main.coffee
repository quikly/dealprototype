class Landing
  
  detailsBtn = ''
  returnBtn = ''
  shareBtn = ''
  handleBar = ''
  bar = ''
  mainWrap = ''
  detail = ''
  landing = ''
  
  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn  = $('.return-btn')
    @shareBtn   = $('.share')

    @handleBar  = $('.handlebar')
    @bar        = $('.bar')
    @mainWrap   = $('#main-wrap')
    @landing    = $('.landing')
    

    @initWaypoint()
    @bindButtons()
    $(window).resize (e) => 
      @resizeLanding()

  resizeLanding: (e) =>
    @landing.css({'height':($(window).height())+'px'});
    console.log @landing.height()

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
      @handleBar.toggleClass('collapse')
      $('.wheel-wrap').toggleClass('collapse')
      @detailsBtn.toggle()
      @returnBtn.toggleClass('invisible')
      
    , {
        #context: '#main-wrap',
        offset: '0px'
           #(-$(this).height())
    })

  onClick: (e, el) =>
    e.preventDefault()
    href = el.attr('href')
    offsetTop = $(href).offset().top-80;
    
    $('body').stop().animate({ 
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