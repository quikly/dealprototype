class Landing

	mainWrap = ''
	openThreshold: 10
	scrollNum: 0

	constructor: ->
 		@mainWrap = $('#main-wrap')
 		@listenScroll()
 		
   

  listenScroll: ->
  	console.log('listen for scroll')
  	@mainWrap.bind('mousewheel', (event, delta, deltaX, deltaY) =>
  		@openDetail(deltaY)
  	)
  
  openDetail: (deltaY) ->
  	@scrollNum = parseInt(@scrollNum) + deltaY
  	console.log(@scrollNum)

  




$(document).ready ->
  landing = new Landing