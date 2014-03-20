jQuery.fn.submitOnCheck = function() {
  this.find('input[type=checkbox]').click(function() {
  	alert('clicked');
    $(this).parent('form').submit();
  });
  return this;
}

var ready;
ready = function() {
  $('.edit_task').submitOnCheck();


  $('#new_list').on('click', function(e){
		e.preventDefault();
		$('#new_list_form').show();
	});

  $('.cancel').on('click', function(e){
  		e.preventDefault();
  		$('#new_list_form').hide();
  		$('form.new_task').hide();
  	});

  $('#update_list').on('click', function(e){
  		e.preventDefault();
  		$('#update_list_form').show();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
