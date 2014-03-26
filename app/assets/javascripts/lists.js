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

  $('#new_task_link').on('click', function(e){
    e.preventDefault();
    $('#add_task_form').show();
  });

  $('#edit_list_name').on('click', function(e){
    e.preventDefault();
    $('#update_list_form').show();
    $('#edit_list_name').hide();
  })

  $('#cancel').on('click', function(e){
    e.preventDefault();
    $('#update_list_form').hide();
    $('#list_name').val('');
    $('#edit_list_name').show();
    $('#new_list_form').hide();
    $('#new_list').show();
    $('#list_name').val('');
  });

  $('#cancel_task').on('click', function(e){
    e.preventDefault();
    $('#add_task_form').hide();
    $('#task_desc').val('');
    $('#new_task_link').show();
  })

};

$(document).ready(ready);
$(document).on('page:load', ready);
