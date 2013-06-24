// Generated by CoffeeScript 1.6.2
(function() {
  var Sorter,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Sorter = (function() {
    function Sorter() {
      this.bindSelectAll = __bind(this.bindSelectAll, this);
      this.bindTextField = __bind(this.bindTextField, this);      this.bindTextField();
      this.bindSelectAll();
      this.selectAll = false;
    }

    Sorter.prototype.bindTextField = function() {
      return $('#txtfld').bind('textchange', function(e) {
        var currentText;

        currentText = $(this).val().toLowerCase();
        if (currentText !== '') {
          $('#names li').hide();
          return $("#names").find("[data-name*='" + currentText + "']").show();
        } else {
          return $('#names li').show();
        }
      });
    };

    Sorter.prototype.bindSelectAll = function() {
      return $(".checkall").on('click', function(e) {
        console.log(this.checked);
        return $('#names').find(':checkbox').prop('checked', this.checked);
      });
    };

    return Sorter;

  })();

  $(document).ready(function() {
    return window.sorter = new Sorter;
  });

}).call(this);
