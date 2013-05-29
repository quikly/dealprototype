class Landing
  mainWrap = detailView = landingView = ''
  detailsBtn = ''
  returnBtn = ''
  scrollNum: 0
  scrollThreshold: 20
  detailOffset: '-800px'
  previewOffset: '-200px'
  isDetailOpen: false

  constructor: ->
    @mainWrap = $('#main-wrap')
    @detailView = $('.detail-view')
    @landingView = $('.landing-view')
    @detailsBtn = $('.details-btn')
    @returnBtn = $('.return-btn')
    @detailsBtn.bind 'click', @openDetail
    @returnBtn.bind 'click', @closeDetail
    @listenScroll()
    @delay 2000, @openPreview
    @delay 2700, @closePreview
    #@setUpdatePositionInterval(500)

  listenScroll: ->
    @mainWrap.bind 'mousewheel', (event, delta, deltaX, deltaY) =>
      #@handleScroll(deltaY)
    
  handleScroll: (deltaY) =>
    if deltaY > 0 
      @positiveScroll(deltaY)
    else
      @negativeScroll(deltaY)

  positiveScroll: (deltaY) =>
    @scrollNum += deltaY
    if @scrollNum >= @scrollThreshold and @isDetailOpen
      @closeDetail()
      @scrollNum = 0
    #console.log('positive: ' + deltaY)

  negativeScroll: (deltaY) =>
    @scrollNum += deltaY
    if @scrollNum <= -@scrollThreshold and !@isDetailOpen
      @openDetail()
      @scrollNum = 0
    #console.log('negative: ' + @scrollNum)

  openDetail: =>
    @detailView.css('top', @detailOffset)
    @isDetailOpen = true

  closeDetail: =>
    @detailView.css('top', '0')
    @isDetailOpen = false

  decrementScroll: =>
    if @scrollNum < 0
      @scrollNum += 5
    else if @scrollNum > 0
      @scrollNum -= 5
      
    console.log 'scrollNum: ' + @scrollNum

  openPreview: =>
    
    @detailView.css('top', @previewOffset)
    @detailsBtn.css('bottom', parseInt(@previewOffset) * -1 + 'px')

  closePreview: =>
    @detailView.css('top', '0')
    @detailsBtn.css('bottom', '0')


  delay: (time, fn, args...) ->
    setTimeout fn, time, args...
    
    
  setUpdatePositionInterval: (intervalMs) =>
    setInterval @decrementScroll, intervalMs
    

$(document).ready ->
  window.landing = new Landing