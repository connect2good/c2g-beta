
$('.checkable').on('change', 
function() {
    $(this).parents('form:first').submit();
});

$(".need").click(function(){
	$(this).find(".needsModal").foundation('reveal', 'open');
});

$(".close-reveal-modal").click(function(){
	$(this).closest(".needsModal").foundation('reveal', 'close');
});
