<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<footer>
		<div class="footer_main">
			<p class="footer_p">
			(주) Laundry <br> <br>대표이사: 황도현, 김상재, 이건욱, 이영경
			</p>
		</div>
	</footer>
	
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
	$(document).ready(function(){
	    $('.laundryLists').slick({
	      slidesToShow: 3,
	      slidesToScroll: 1,
	      autoplay: true,
	      autoplaySpeed: 2000,
	      responsive: [
	        {
	          breakpoint: 1024,
	          settings: {
	            slidesToShow: 3,
	            slidesToScroll: 1
	          } 
	        },
	        {
	          breakpoint: 600,
	          settings: {
	            slidesToShow: 2,
	            slidesToScroll: 1
	          }
	        },
	        {
	          breakpoint: 480,
	          settings: {
	            slidesToShow: 1,
	            slidesToScroll: 1
	          }
	        }
	      ]
	    });
	}
	</script>
</body>
</html>