class Landing
  mainWrap = detailView = landingView = ''
  detailsButton = '' 
  scrollNum: 0
  scrollThreshold: 20
  isDetailOpen: false

  constructor: ->
    @mainWrap = $('#main-wrap')
    @detailView = $('.detail-view')
    @landingView = $('.landing-view')
    @detailsButton = $('.details-btn')
    @detailsButton.bind 'click', @openDetail
    @listenScroll()
    @setUpdatePositionInterval(500)

  listenScroll: ->
    console.log('listen for scroll')
    @mainWrap.bind 'mousewheel', (event, delta, deltaX, deltaY) =>
      @handleScroll(deltaY)
    
  handleScroll: (deltaY) =>
    if deltaY > 0 
      @positiveScroll(deltaY)
    else
      @negativeScroll(deltaY)

  positiveScroll: (deltaY) =>
    @scrollNum = @scrollNum + deltaY
    if @scrollNum > @scrollThreshold 
      @closeDetail()
      @scrollNum = 0
    console.log('positive: ' + deltaY)

  negativeScroll: (deltaY) =>
    @scrollNum = @scrollNum + deltaY
    if @scrollNum < -@scrollThreshold 
      @openDetail()
      @scrollNum = 0
    console.log('negative: ' + @scrollNum)

  openDetail: =>
    @detailView.css('top', '-900px')
    @isDetailOpen = true

  closeDetail: =>
    @detailView.css('top', '0')
    @isDetailOpen = false

  decrementScroll: =>
    if @scrollNum < 0
      @scrollNum += 5
    console.log @scrollNum

  setUpdatePositionInterval: (intervalMs) =>
    setInterval @decrementScroll, intervalMs
    

$(document).ready ->
  landing = new Landing