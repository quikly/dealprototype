// Generated by CoffeeScript 1.6.2
(function() {
  var Landing,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Landing = (function() {
    var detailView, detailsBtn, landingView, mainWrap, returnBtn;

    mainWrap = detailView = landingView = '';

    detailsBtn = '';

    returnBtn = '';

    Landing.prototype.scrollNum = 0;

    Landing.prototype.scrollThreshold = 20;

    Landing.prototype.isDetailOpen = false;

    function Landing() {
      this.setUpdatePositionInterval = __bind(this.setUpdatePositionInterval, this);
      this.decrementScroll = __bind(this.decrementScroll, this);
      this.closeDetail = __bind(this.closeDetail, this);
      this.openDetail = __bind(this.openDetail, this);
      this.negativeScroll = __bind(this.negativeScroll, this);
      this.positiveScroll = __bind(this.positiveScroll, this);
      this.handleScroll = __bind(this.handleScroll, this);      this.mainWrap = $('#main-wrap');
      this.returnBtn = $('.return-btn');
      this.detailView = $('.detail-view');
      this.landingView = $('.landing-view');
      this.detailsBtn = $('.details-btn');
      this.returnBtn = $('.return-btn');
      this.detailsBtn.bind('click', this.openDetail);
      this.returnBtn.bind('click', this.closeDetail);
      this.listenScroll();
      this.setUpdatePositionInterval(500);
    }

    Landing.prototype.listenScroll = function() {
      var _this = this;

      return this.mainWrap.bind('mousewheel', function(event, delta, deltaX, deltaY) {
        return _this.handleScroll(deltaY);
      });
    };

    Landing.prototype.handleScroll = function(deltaY) {
      if (deltaY > 0) {
        return this.positiveScroll(deltaY);
      } else {
        return this.negativeScroll(deltaY);
      }
    };

    Landing.prototype.positiveScroll = function(deltaY) {
      this.scrollNum = this.scrollNum + deltaY;
      if (this.scrollNum >= this.scrollThreshold) {
        this.closeDetail();
        return this.scrollNum = 0;
      }
    };

    Landing.prototype.negativeScroll = function(deltaY) {
      this.scrollNum = this.scrollNum + deltaY;
      if (this.scrollNum <= -this.scrollThreshold) {
        this.openDetail();
        return this.scrollNum = 0;
      }
    };

    Landing.prototype.openDetail = function() {
      this.detailView.css('top', '-900px');
      return this.isDetailOpen = true;
    };

    Landing.prototype.closeDetail = function() {
      this.detailView.css('top', '0');
      return this.isDetailOpen = false;
    };

    Landing.prototype.decrementScroll = function() {
      if (this.scrollNum < 0) {
        this.scrollNum += 5;
      }
      return console.log(this.scrollNum);
    };

    Landing.prototype.setUpdatePositionInterval = function(intervalMs) {
      return setInterval(this.decrementScroll, intervalMs);
    };

    return Landing;

  })();

  $(document).ready(function() {
    var landing;

    return landing = new Landing;
  });

}).call(this);