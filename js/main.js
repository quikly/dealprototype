// Generated by CoffeeScript 1.6.2
(function() {
  var Landing,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Landing = (function() {
    function Landing() {
      this.animEndEvents = __bind(this.animEndEvents, this);
      this.addPerson = __bind(this.addPerson, this);
      this.updatePrice = __bind(this.updatePrice, this);
      this.peopleHeight = __bind(this.peopleHeight, this);
      this.openNav = __bind(this.openNav, this);
      this.shareHover = __bind(this.shareHover, this);
      this.onReturn = __bind(this.onReturn, this);
      this.onDetail = __bind(this.onDetail, this);
      this.bindButtons = __bind(this.bindButtons, this);
      this.resizeLanding = __bind(this.resizeLanding, this);
      var isOpen,
        _this = this;

      this.detailsBtn = $('.details-btn');
      this.returnBtn = $('.return-btn');
      this.shareBtn = $('.share');
      this.navBtn = $('#nav-btn');
      isOpen = false;
      this.handleBar = $('.handlebar');
      this.bar = $('.bar');
      this.wheel = $('.wheel');
      this.dollar = $('.dollar');
      this.landing = $('.landing');
      this.detail = $('.detail');
      this.new_price = '';
      this.next_price = '';
      this.discount = '';
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
      $('#verify-modal').modal({
        show: true
      });
      this.wheel.bind(this.animEndEvents(), function(e) {
        var callback, el;

        el = $(e.currentTarget);
        $('#oldPrice').find('.dollar').html(_this.new_price);
        $('.price-next').find('.dollar').html(_this.next_price);
        $('.price-window').removeClass('change');
        callback = function() {
          el.removeClass('wheel-highlight');
          return $('.price-window').css(window.landing.changePlayState('running'));
        };
        return setTimeout(callback, 500);
      });
      $(".people").bind(this.animEndEvents(), function(e) {
        var completedAnim;

        completedAnim = e.originalEvent.animationName;
        if (completedAnim === 'peopleIntro') {
          $(e.currentTarget).removeClass('intro');
        }
        return $(_this).unbind(e);
      });
      $(".nav").bind(this.animEndEvents(), function(e) {
        var completedAnim;

        completedAnim = e.originalEvent.animationName;
        if (completedAnim === 'navIntro') {
          $(e.currentTarget).removeClass('intro');
        }
        return $(_this).unbind(e);
      });
      this.handleBar.bind(this.animEndEvents(), function(e) {
        var completedAnim;

        completedAnim = e.originalEvent.animationName;
        if (completedAnim === 'handlebarIntro') {
          $(e.currentTarget).removeClass('intro');
        }
        $(_this).unbind(e);
        return $.waypoints('refresh');
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
        return _this.onDetail(e, $(e.currentTarget));
      });
      this.returnBtn.bind('click', function(e) {
        return _this.onReturn(e, $(e.currentTarget));
      });
      this.shareBtn.hover(function(e) {
        return _this.shareHover($(e.currentTarget));
      });
      return this.navBtn.bind('click', function(e) {
        return _this.openNav(e, $(e.currentTarget));
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
        return _this.returnBtn.toggleClass('collapse');
      }, {
        offset: '78px'
      });
    };

    Landing.prototype.onDetail = function(e, el) {
      var href, offsetTop;

      e.preventDefault();
      if (!this.isOpen) {
        href = el.attr('href');
        offsetTop = $(href).offset().top - 68;
        return $('body, html').stop().animate({
          scrollTop: offsetTop
        }, 300);
      }
    };

    Landing.prototype.onReturn = function(e, el) {
      e.preventDefault();
      return $('body, html').stop().animate({
        scrollTop: 0
      }, 300);
    };

    Landing.prototype.shareHover = function(el) {
      return $('.share-items').toggleClass('slide-down');
    };

    Landing.prototype.openNav = function(e, el) {
      if (this.isOpen) {
        this.isOpen = false;
      } else {
        this.isOpen = true;
      }
      $('#nav').removeClass('invisible');
      $('#nav').toggleClass('visible');
      $('body, html').toggleClass('noscroll');
      $('.hero-img').toggleClass('slide');
      this.landing.toggleClass('slide');
      return this.detail.toggleClass('slide');
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
      var h, m, _ref;

      h = window.innerHeight - this.handleBar.height();
      m = (_ref = $('.small').css('top')) != null ? _ref : 0;
      h -= Math.abs(parseInt(m));
      return $('.people').height(h);
    };

    Landing.prototype.updatePrice = function(new_price, next_price, discount) {
      this.new_price = new_price;
      this.next_price = next_price;
      this.discount = discount;
      $('#newPrice').find('.dollar').html(this.new_price);
      $('.percent').html(this.discount);
      $('.price-window').addClass('change');
      this.wheel.addClass('wheel-highlight');
    };

    Landing.prototype.addPerson = function(img) {
      var offset, rmClass;

      offset = '68px';
      img = 'img/temp/scott.jpg';
      $('.people').prepend('<div class="person new"><img class="pic" src="' + img + '"><h1 class="name">I&apos;m in!</h1></div>');
      rmClass = function() {
        return $('.person').first().removeClass('new');
      };
      setTimeout(rmClass, 500);
    };

    Landing.prototype.animEndEvents = function() {
      var endEvents;

      endEvents = "animationend \nwebkitAnimationEnd \nMSAnimationEnd \noAnimationEnd";
      return endEvents;
    };

    Landing.prototype.changePlayState = function(state) {
      var prop;

      prop = {
        '-webkit-animation-play-state': state,
        '-moz-animation-play-state': state,
        'animation-play-state': state
      };
      return prop;
    };

    return Landing;

  })();

  $(document).ready(function() {
    return window.landing = new Landing;
  });

}).call(this);
