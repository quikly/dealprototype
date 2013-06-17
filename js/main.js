// Generated by CoffeeScript 1.6.2
(function() {
  var Landing,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Landing = (function() {
    var bar, detail, detailsBtn, discount, dollar, handleBar, landing, mainWrap, new_price, next_price, returnBtn, shareBtn, wheel;

    detailsBtn = '';

    returnBtn = '';

    shareBtn = '';

    handleBar = '';

    bar = '';

    wheel = '';

    dollar = '';

    discount = '';

    mainWrap = '';

    detail = '';

    landing = '';

    new_price = '';

    next_price = '';

    function Landing() {
      this.updatePrice = __bind(this.updatePrice, this);
      this.peopleHeight = __bind(this.peopleHeight, this);
      this.shareHover = __bind(this.shareHover, this);
      this.onReturn = __bind(this.onReturn, this);
      this.onClick = __bind(this.onClick, this);
      this.bindButtons = __bind(this.bindButtons, this);
      this.resizeLanding = __bind(this.resizeLanding, this);
      var _this = this;

      this.detailsBtn = $('.details-btn');
      this.returnBtn = $('.return-btn');
      this.shareBtn = $('.share');
      this.handleBar = $('.handlebar');
      this.bar = $('.bar');
      this.wheel = $('.wheel');
      this.dollar = $('.dollar');
      this.discount = $('.discount');
      this.mainWrap = $('#main-wrap');
      this.landing = $('.landing');
      this.detail = $('.detail');
      this.initDetailWaypoint();
      this.initReturnWaypoint();
      this.makeMason();
      this.bindButtons();
      $(window).resize(function(e) {
        _this.resizeLanding();
        return _this.peopleHeight();
      });
      this.peopleHeight();
      this.resizeLanding();
      this.wheel.bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(e) {
        var callback, el;

        el = $(e.currentTarget);
        callback = function() {
          el.removeClass('wheel-highlight');
          return $('.wheel-red').removeClass('red-highlight');
        };
        return setTimeout(callback, 2500);
      });
      this.dollar.bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function(e) {
        var callback, el;

        el = $(e.currentTarget);
        el.html(_this.new_price);
        $('.price-next .dollar').html(_this.next_price);
        callback = function() {
          el.removeClass('flipout');
          return el.addClass('flipin');
        };
        return setTimeout(callback, 200);
      });
    }

    Landing.prototype.resizeLanding = function(e) {
      return this.landing.css({
        'height': ($(window).height()) + 'px'
      });
    };

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

    Landing.prototype.initDetailWaypoint = function() {
      var _this = this;

      return this.handleBar.waypoint(function(direction) {
        _this.bar.toggleClass('collapse');
        $('.wheel-wrap').toggleClass('collapse');
        _this.detailsBtn.toggle();
        return _this.returnBtn.toggleClass('invisible');
      }, {
        offset: '0px'
      });
    };

    Landing.prototype.initReturnWaypoint = function() {
      var _this = this;

      return this.detail.waypoint(function(direction) {
        console.log('FIXIE');
        return _this.returnBtn.toggleClass('collapse');
      }, {
        offset: '78px'
      });
    };

    Landing.prototype.onClick = function(e, el) {
      var href, offsetTop;

      e.preventDefault();
      href = el.attr('href');
      offsetTop = $(href).offset().top - 80;
      return $('body').stop().animate({
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

    Landing.prototype.makeMason = function() {
      var wall;

      return wall = new Masonry(document.getElementById('masonry'), {
        columnWidth: 300,
        gutterWidth: 20,
        isResizable: true,
        isFitWidth: true
      });
    };

    Landing.prototype.peopleHeight = function() {
      var h;

      h = window.innerHeight - this.handleBar.height();
      return $('.people').height(h);
    };

    Landing.prototype.updatePrice = function(new_price, next_price) {
      this.wheel.addClass('wheel-highlight');
      $('.wheel-red').addClass('red-highlight');
      this.new_price = new_price;
      this.next_price = next_price;
      this.dollar.removeClass('flipin').addClass('flipout');
    };

    return Landing;

  })();

  $(document).ready(function() {
    return window.landing = new Landing;
  });

}).call(this);
