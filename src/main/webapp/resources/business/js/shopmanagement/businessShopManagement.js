// horizontal scroll movement
$("#image-preview").on('mousewheel',function(e) {
	e.preventDefault();
	const wheelDelta = e.originalEvent.wheelDelta;
	if(wheelDelta > 0){
		$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());

	}else{
		$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
	}
});

function checkFile() {
	const fileName = document.getElementById('file-name');
	if (!fileName.value) {
		fileName.style.display = 'none';
	} else {
		fileName.style.display = '';
	}
}