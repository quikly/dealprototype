// Generated by CoffeeScript 1.6.2
(function() {
  var Landing,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Landing = (function() {
    var detailsBtn, handleBar, returnBtn, shareBtn;

    detailsBtn = '';

    returnBtn = '';

    shareBtn = '';

    handleBar = '';

    function Landing() {
      this.shareHover = __bind(this.shareHover, this);
      this.onReturn = __bind(this.onReturn, this);
      this.onClick = __bind(this.onClick, this);
      this.bindButtons = __bind(this.bindButtons, this);      this.detailsBtn = $('.details-btn');
      this.returnBtn = $('.return-btn');
      this.handleBar = $('.handlebar');
      this.shareBtn = $('.share');
      this.initWaypoint();
      this.bindButtons();
    }

    Landing.prototype.bindButtons = function() {
      var _this = this;

      this.detailsBtn.bind('click', function(e) {
        return _this.onClick(e, $(e.currentTarget));
      });
      this.returnBtn.bind('click', function(e) {
        return _this.onReturn(e, $(e.currentTarget));
      });
      return this.shareBtn.hover(function(e) {
        return _this.shareHover($(e.currentTarget));
      });
    };

    Landing.prototype.initWaypoint = function() {
      var _this = this;

      return this.handleBar.waypoint(function(direction) {
        console.log('hello');
        _this.handleBar.toggleClass('collapse');
        $('.wheel-wrap').toggleClass('collapse');
        if (direction === 'down') {
          return _this.detailsBtn.hide();
        } else {
          return _this.detailsBtn.fadeIn('fast');
        }
      }, {
        context: '#main-wrap',
        offset: function() {
          return -$(this).height() + 77;
        }
      });
    };

    Landing.prototype.onClick = function(e, el) {
      var href, offsetTop;

      e.preventDefault();
      href = el.attr('href');
      offsetTop = $(href).offset().top - 77;
      return el.parent().parent().stop().animate({
        scrollTop: offsetTop
      }, 300);
    };

    Landing.prototype.onReturn = function(e, el) {
      e.preventDefault();
      return el.parent().parent().stop().animate({
        scrollTop: 0
      }, 300);
    };

    Landing.prototype.shareHover = function(el) {
      return $('.share-items').toggleClass('slide-down');
    };

    return Landing;

  })();

  $(document).ready(function() {
    return window.landing = new Landing;
  });

}).call(this);
