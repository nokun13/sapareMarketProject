/* 더보기버튼 기능 */
		const tbody = document.querySelector("tbody");
		const rows = tbody.querySelectorAll("tr");
		const moreButton = document.querySelector(".moreButton");
		let count = 4;
		if (count > rows.length) {
			count = rows.length;
		}

		function showItem(count) {
			for (let i = 0; i < count; i++) {
				rows[i].style.display = 'block';
			}
		}

		showItem(count);

		let cnt = 0;

		moreButton.addEventListener("click", function() {
			if (cnt < 3) {

				var scrollPos = $(window).scrollTop();

				count += 3;
				if (count > rows.length) {
					count = rows.length;
				}
				showItem(count);

				$(window).scrollTop(scrollPos);
				cnt += 1;

				if (cnt == 3) {
					$("#loadMore").fadeOut('fast');
				}
			}

		});
		
		$(document).ready(function(){
			
		///퀵메뉴 스크롤 
		var defaultTop = parseInt($('.quickmenu').css('top'));
		$(document).on('scroll', function() {
			var scv = $(document).scrollTop();
			$('.quickmenu').stop().animate({
				'top' : scv + defaultTop + 'px'
			}, -1);
		});

		$('.bt').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 0);
			return false;
		});

		});//ready