$(document).ready(
		function() {

			// 신고하기 모달창
			$('#decl-btn').click(function() {
				$('#decl-modal').css("display", "block");
			});

			$('.close').click(function() {
				$('#decl-modal').css("display", "none");
			});
			// //////////////////////////////////////////////

			
			
			// 신고하기 토글
			$(".1").hide();

			$(".2").hide();

			$(".3").hide();

			$(".4").hide();

			$(".5").hide();

			$(".span-decl-content1").click(function() {
				$(".1").toggle();
			});

			$(".span-decl-content2").click(function() {
				$(".2").toggle();
			});

			$(".span-decl-content3").click(function() {
				$(".3").toggle();
			});

			$(".span-decl-content4").click(function() {
				$(".4").toggle();
			});

			$(".span-decl-content5").click(function() {
				$(".5").toggle();
			});
			// //////////////////////////////////////////

			/*
			 * var modal = document.getElementById('decl-modal'); var btn =
			 * document.getElementById('decl-btn'); var span =
			 * document.getElementById('close')[0];
			 * 
			 * btn.onclick = function() { modal.style.display = "block"; }
			 * 
			 * span.onclick = function() { modal.style.display = "none"; }
			 * window.onclick = function(event) { if (event.target == modal) {
			 * modal.style.display = "none"; } }
			 */

			
			
			
			// ///////////////////타이머//////////////////////////////
			CountDownTimer('10/28/2020', 'countdown');

			function CountDownTimer(dt, id) {
				var end = new Date(dt);

				var _second = 1000;
				var _minute = _second * 60;
				var _hour = _minute * 60;
				var _day = _hour * 24;
				var timer;

				function showRemaining() {
					var now = new Date();
					var distance = end - now;
					if (distance < 0) {

						clearInterval(timer);
						document.getElementById(id).innerHTML = 'EXPIRED!';

						return;
					}
					var days = Math.floor(distance / _day);
					var hours = Math.floor((distance % _day) / _hour);
					var minutes = Math.floor((distance % _hour) / _minute);
					var seconds = Math.floor((distance % _minute) / _second);

					document.getElementById(id).innerHTML = days + '일 ';
					document.getElementById(id).innerHTML += hours + '시간 ';
					document.getElementById(id).innerHTML += minutes + '분 ';
					document.getElementById(id).innerHTML += seconds + '초';
				}

				timer = setInterval(showRemaining, 1000);
			}
			// ///////////////////////////////////////////////

			
			
			
			
			// //////////////////////////////버튼
			
		})