//= require jquery3
//=require rails-ujs
//= require popper
//= require bootstrap
//= require jquery.validate
//= require jquery.validate.additional-methods

$.validator.addMethod(
        "url_regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp,'i');
            return this.optional(element) || re.test(value);
        },
        "Please enter a valid URL (using http)"
);


$('#new_short_link').ready(function() {
  var url_validator = $('#new_short_link').validate({
    rules: {
      'short_link[main_url]': {
        required: true,
        url_regex: /^(http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/
      },
    },
    messages: {
      'short_link[main_url]': {
        required: 'Please put in a URL',
      }
    }
  });
});
