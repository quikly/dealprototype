class Landing

  
  constructor: ->
    @detailsBtn = $('.details-btn')
    @returnBtn  = $('.return-btn')
    @shareBtn   = $('.share')
    @navBtn     = $('#nav-btn')
    isOpen = false

    @handleBar  = $('.handlebar')
    @bar        = $('.bar')
    @wheel      = $('.wheel')
    @dollar     = $('.dollar')
    @landing    = $('.landing')
    @detail     = $('.detail')

    @new_price  = ''
    @next_price = ''
    @discount   = ''

    # waypoint reg
    @initDetailWaypoint()
    @initReturnWaypoint()

    # masonry reg
    @makeMason()

    # listen for clicks
    @bindButtons()

    # bind to resize
    $(window).resize (e) => 
      @resizeLanding()
      @peopleHeight()

    # call resize functions on load
    @peopleHeight()
    @resizeLanding()

    # ======= Animation Event Handlers =========

    @wheel.bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', (e) => 
      el = $(e.currentTarget)
      $('#oldPrice').find('.dollar').html(@new_price)
      $('.price-next').find('.dollar').html(@next_price)
      $('.price-window').removeClass('change')
      callback = -> 
        el.removeClass('wheel-highlight')
        #$('.wheel-red').removeClass('red-highlight');
        $('.price-window').css(window.landing.changePlayState('running'))
      setTimeout callback, 500
    )
    
  resizeLanding: (e) =>
    @landing.css({'height':($(window).height())+'px'});
    

  bindButtons: =>
    # detail button
    @detailsBtn.bind 'click', (e) => 
          @onDetail(e, $(e.currentTarget))
    # return button
    @returnBtn.bind 'click', (e) =>
        @onReturn(e, $(e.currentTarget))
    #share button
    @shareBtn.hover (e) =>
        @shareHover($(e.currentTarget))
    #nav button
    @navBtn.bind 'click', (e) =>
        @openNav(e, $(e.currentTarget))


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
        offset: '78px'
    })

  onDetail: (e, el) =>
    e.preventDefault()
    if not @isOpen
      href = el.attr('href')
      offsetTop = $(href).offset().top-68
      
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

  openNav: (e, el) =>
    if @isOpen
      @isOpen = false
    else
      @isOpen = true
    $('#nav').removeClass('invisible')
    $('#nav').toggleClass('visible')
    $('body').toggleClass('noscroll')
    $('.hero-img').toggleClass('slide')
    @landing.toggleClass('slide')
    @detail.toggleClass('slide')


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
    
    
  updatePrice: (new_price, next_price, discount)=>
    @new_price = new_price
    @next_price = next_price
    @discount = discount
    $('#newPrice').find('.dollar').html(@new_price)
    $('.percent').html(@discount);
    $('.price-window').addClass('change')
    @wheel.addClass('wheel-highlight')
    return

  changePlayState: (state)->
    prop = 
      '-webkit-animation-play-state': state
      '-moz-animation-play-state': state
      'animation-play-state': state
    return prop

  addPerson: (img)=>
    #height of one person plus margin top
    offset = '68px'
    img = 'img/temp/scott.jpg'
   
    $('.people').prepend(
        '<div class="person new"><img class="pic" src="'+img+'"><h1 class="name">I&apos;m in!</h1></div>'
      )

    rmClass = -> 
      $('.person').first().removeClass('new')
    setTimeout rmClass, 500
    return
    
    
$(document).ready ->
  window.landing = new Landing

