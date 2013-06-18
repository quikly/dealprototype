class Landing
  
  detailsBtn = ''
  returnBtn = ''
  shareBtn = ''
  handleBar = ''
  bar = ''
  wheel = ''
  dollar = ''
  discount = ''
  mainWrap = ''
  detail = ''
  landing = ''

  new_price = ''
  next_price = ''
  
  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn  = $('.return-btn')
    @shareBtn   = $('.share')

    @handleBar  = $('.handlebar')
    @bar        = $('.bar')
    @wheel      = $('.wheel')
    @dollar     = $('.dollar')
    @discount   = $('.discount')
    @mainWrap   = $('#main-wrap')
    @landing    = $('.landing')
    @detail     = $('.detail')
    
    @initDetailWaypoint()
    @initReturnWaypoint()

    @makeMason()

    @bindButtons()
    $(window).resize (e) => 
      @resizeLanding()
      @peopleHeight()
    @peopleHeight()
    @resizeLanding()

    #right this better
    @wheel.bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', (e) -> 
      #console.log 'Wheel done'
      el = $(e.currentTarget)
      callback = -> 
        el.removeClass('wheel-highlight')
        $('.wheel-red').removeClass('red-highlight');
      setTimeout callback, 2500
    )
    @dollar.bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', (e) => 
      el = $(e.currentTarget)
      
      el.html(@new_price);
      $('.price-next .dollar').html(@next_price);
      callback = -> 
        el.removeClass('flipout')
        el.addClass('flipin')
      setTimeout callback, 200
      
    )


  resizeLanding: (e) =>
    @landing.css({'height':($(window).height())+'px'});
    

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

  peopleHeight: =>
    h = window.innerHeight - @handleBar.height()
    m = $('.small').css('top') ? 0  
    h -= Math.abs(parseInt(m))
    $('.people').height(h)
    
    
  updatePrice: (new_price, next_price)=>
    @wheel.addClass('wheel-highlight')
    $('.wheel-red').addClass('red-highlight');
    @new_price = new_price
    @next_price = next_price
    @dollar.removeClass('flipin').addClass('flipout')
    
    return
    


$(document).ready ->
  window.landing = new Landing



