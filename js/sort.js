// Generated by CoffeeScript 1.6.2
(function() {
  var Sorter,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Sorter = (function() {
    function Sorter() {
      this.bindSubmit = __bind(this.bindSubmit, this);
      this.bindCheckboxes = __bind(this.bindCheckboxes, this);
      this.bindSelectAll = __bind(this.bindSelectAll, this);
      this.bindClearField = __bind(this.bindClearField, this);
      this.bindTextField = __bind(this.bindTextField, this);
      this.renderContacts = __bind(this.renderContacts, this);
      var person;

      this.userContacts = this.spoofData();
      this.contacts = (function() {
        var _i, _len, _ref, _results;

        _ref = this.userContacts.contacts;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          person = _ref[_i];
          _results.push(person);
        }
        return _results;
      }).call(this);
      this.renderContacts();
      this.bindTextField();
      this.bindClearField();
      this.bindSelectAll();
      this.bindCheckboxes();
      this.bindSubmit();
      this.selectAll = false;
    }

    Sorter.prototype.renderContacts = function() {
      var contact, el, i, _i, _len, _ref, _results;

      el = $('.list-email');
      _ref = this.contacts;
      _results = [];
      for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
        contact = _ref[i];
        _results.push(el.append('\
        <label class="checkbox" for="checkboxes-' + i + '" data-name="' + contact.first_name + contact.last_name + contact.email + '">\
          <input type="checkbox" name="checkboxes" id="checkboxes-' + i + '" value="' + i + '">\
          ' + contact.first_name + ' ' + contact.last_name + '\
        </label>\
        '));
      }
      return _results;
    };

    Sorter.prototype.bindTextField = function() {
      return $('#searchField').bind('textchange', function(e) {
        var currentText;

        currentText = $(this).val().toLowerCase();
        $('.scroll-box').scrollTop(0);
        if (currentText !== '') {
          $('.list-email .checkbox').hide();
          return $('.list-email').find("[data-name*='" + currentText + "']").show();
        } else {
          return $('.list-email .checkbox').show();
        }
      });
    };

    Sorter.prototype.bindClearField = function() {
      return $('#clearfield').bind('click', function(e) {
        $('#searchField').val('');
        return $('#searchField').trigger('textchange');
      });
    };

    Sorter.prototype.bindSelectAll = function() {
      return $("#selectall").on('click', function(e) {
        $('.list-email .checkbox').find(':checkbox').prop('checked', this.checked);
        if ($('.list-email .checkbox').find(':checkbox:checked').length > 0) {
          return $("#submit-btn").removeClass('disabled');
        } else {
          return $("#submit-btn").addClass('disabled');
        }
      });
    };

    Sorter.prototype.bindCheckboxes = function() {
      var _this = this;

      return $('.list-email .checkbox').find(':checkbox').on('click', function(e) {
        $('#searchField').val('');
        $('#searchField').trigger('textchange');
        if ($('.list-email .checkbox').find(':checkbox:checked').length > 0) {
          return $("#submit-btn").removeClass('disabled');
        } else {
          return $("#submit-btn").addClass('disabled');
        }
      });
    };

    Sorter.prototype.bindSubmit = function() {
      var _this = this;

      return $("#submit-btn").on('click', function(e) {
        var people, sendTo;

        e.preventDefault();
        people = _this.contacts;
        sendTo = {
          deaID: _this.userContacts.dealID,
          contacts: []
        };
        $('.list-email label').find(':checkbox:checked').each(function(addresses) {
          return sendTo.contacts.push(people[$(this).val()]);
        });
        return console.log(sendTo);
      });
    };

    /* 
    ======= REMOVE THIS FAKE DATA =======
    */


    Sorter.prototype.spoofData = function() {
      return {
        dealID: 2,
        contacts: [
          {
            first_name: 'Jonathan',
            last_name: 'Taylor',
            email: 'jonathan@quikly.com'
          }, {
            first_name: 'Scott',
            last_name: 'Meves',
            email: 'scott@quikly.com'
          }, {
            first_name: 'Shawn',
            last_name: 'Gellar',
            email: 'shawn@quikly.com'
          }, {
            first_name: 'Brandon',
            last_name: 'Gheen',
            email: 'brandon@quikly.com'
          }, {
            first_name: 'Brian',
            last_name: 'Rudolph',
            email: 'brian@quikly.com'
          }, {
            first_name: 'Steven',
            last_name: 'Rozanski',
            email: 'steve@quikly.com'
          }, {
            first_name: 'Christopher',
            last_name: 'Ozment',
            email: 'christopherozment@gmail.com'
          }, {
            first_name: 'John',
            last_name: 'Solimine',
            email: 'spikepress@spikepress.com'
          }, {
            first_name: 'Kyle',
            last_name: 'Fletcher',
            email: 'design@kylefletcher.com'
          }, {
            first_name: 'Rachel',
            last_name: 'Blatt',
            email: 'rachel.a.blatt@gmail.com'
          }, {
            first_name: 'Andrew',
            last_name: 'Pabon',
            email: 'pabon.andrew@gmail.com'
          }
        ]
      };
    };

    return Sorter;

  })();

  $(document).ready(function() {
    return window.sorter = new Sorter;
  });

}).call(this);
