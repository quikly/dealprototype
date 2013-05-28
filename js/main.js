// Generated by CoffeeScript 1.6.2
(function() {
  var Landing,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Landing = (function() {
    Landing.prototype.mainWrap = '';

    Landing.prototype.detailView = '';

    Landing.prototype.openThreshold = 10;

    Landing.prototype.scrollNum = 0;

    function Landing() {
      this.setUpdatePositionInterval = __bind(this.setUpdatePositionInterval, this);
      this.decrementScroll = __bind(this.decrementScroll, this);
      this.openDetail = __bind(this.openDetail, this);      this.mainWrap = $('#main-wrap');
      this.detailView = $('.detail-view');
      this.listenScroll();
      this.setUpdatePositionInterval(500);
    }

    Landing.prototype.listenScroll = function() {
      var _this = this;

      console.log('listen for scroll');
      return this.mainWrap.bind('mousewheel', function(event, delta, deltaX, deltaY) {
        return _this.openDetail(deltaY);
      });
    };

    Landing.prototype.openDetail = function(deltaY) {
      if (deltaY < 0) {
        this.scrollNum = this.scrollNum + deltaY;
        this.detailView.css('top', '-' + deltaY + 'px');
      }
      if (this.scrollNum < -100) {
        this.detailView.css('top', '-900px');
      }
      return console.log(this.scrollNum);
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
