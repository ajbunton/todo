jQuery.fn.submitOnCheck = function() {
  this.find('input[type=checkbox]').click(function() {
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

  $('#cancel').on('click', function(e){
    e.preventDefault();
    $('#edit_list_name').hide();
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);
