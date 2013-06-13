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
    @detail     = $('.detail')
    
    @initDetailWaypoint()
    @initReturnWaypoint()

    @makeMason()

    @bindButtons()
    $(window).resize (e) => 
      @resizeLanding()
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


  initDetailWaypoint: ->
    @handleBar.waypoint( (direction) =>
      @bar.toggleClass('collapse')
      $('.wheel-wrap').toggleClass('collapse')
      @detailsBtn.toggle()
      @returnBtn.toggleClass('invisible')
    , {
        offset: '0px'
    })

  initReturnWaypoint: ->
    @detail.waypoint( (direction) =>
      console.log('FIXIE')
      @returnBtn.toggleClass('collapse')
    , {
        #context: '#main-wrap',
        offset: '78px'
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

  makeMason: ->
    wall = new Masonry( document.getElementById('masonry'), {
      columnWidth: 300,
      gutterWidth: 20,
      isResizable: true,
      isFitWidth: true
    });

    
    

$(document).ready ->
  window.landing = new Landing