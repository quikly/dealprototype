class Landing
	mainWrap: ''
	detailView: ''
	openThreshold: 10
	scrollNum: 0

	constructor: ->
 		@mainWrap = $('#main-wrap')
 		@detailView = $('.detail-view')
 		@listenScroll()
 		@setUpdatePositionInterval(500)

  listenScroll: ->
  	console.log('listen for scroll')
  	@mainWrap.bind('mousewheel', (event, delta, deltaX, deltaY) =>
  		@openDetail(deltaY)
  	)
  
  openDetail: (deltaY) =>
  	if deltaY < 0
  		@scrollNum = @scrollNum + deltaY
  		@detailView.css('top', '-'+deltaY+'px')
  	if @scrollNum < -100
  		@detailView.css('top', '-900px')
  	console.log(@scrollNum)

  decrementScroll: =>
  	if @scrollNum < 0
  		@scrollNum += 5
  	console.log @scrollNum

  setUpdatePositionInterval: (intervalMs) =>
    setInterval @decrementScroll, intervalMs
  	

$(document).ready ->
  landing = new Landing