window.onload = function() {
	document.getElementById('btn_price').onclick = function() {
		price(this.form)
	};
	var btn_order = document.getElementById('btn_order');
	btn_order.addEventListener('click', order1);
	/*btn_order.addEventListener('click', order2);*/
	btn_order.addEventListener('click', order2);
}

function print(str) {
	document.writeln(str + '<br>');
}


function comma(su) {
	return su.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function price(f) {
	if (f.cnt.value.trim().length == 0) {
		alert('인원수를 입력하세요.');
		f.cnt.focus();
	} else{
		var amount = parseInt(f.cnt.value) * 12000;
		amount = comma(amount);
		alert('결재 예상 금액: ' + amount);
	}
}

/*$(document).ready(function() {
    if(f.cnt.value.trim().length == $(':checkbox:checked').length){ //값 비교
           $(":checkbox:not(:checked)").attr("disabled", "disabled");//checked 처리
     }
});*/

function order1(event) {
	var f = event.currentTarget.form;
	var str = '';
	var temp = $('input:checkbox[name="seat"]').is(":checked");
	if(temp == true) {
		if (f.cnt.value.trim().length == 0) {
			alert('인원수를 입력하세요.');
			f.cnt.focus();
		} else {
		str += ' 좌석: ' + f.seat.value + ' 인원: ' + f.cnt.value + ' 결재 금액: ' + comma(parseInt(f.cnt.value) * 12000) + ' 원';
		document.getElementById('panel1').innerHTML = str;
		}
	}
	else{
		alert('좌석을 선택해 주세요.');
	}
}

/*function order2(event) {
	var f = event.currentTarget.form;
	var str = '';
	var temp = $('input:checkbox[name="seat"]').is(":checked");
	if(temp == true) {
		if (f.cnt.value.trim().length == 0) {
			f.cnt.focus();
		}else{
	str += '결재 금액: ' + comma(parseInt(f.cnt.value) * 12000) + ' 원';
	document.getElementById('panel2').innerHTML = str;
		}
	}
}*/

function order2(event) {
	var f = event.currentTarget.form;
	var str = '예약 취소 안내<br>';
	var temp = $('input:checkbox[name="seat"]').is(":checked");
	if(temp == true) {
		if (f.cnt.value.trim().length == 0) {
		}else{
	str += '예약날짜 7일전 전액 환불<br>';
	str += '예약날짜 5일전 50% 환불<br>';
	str += '예약날짜 당일 환불 불가<br>';
	str += "<button type='button' onClick='javascript:payment();' style='color:black;'>결제</button>";
	
	var panel2 = document.getElementById('panel2');
	panel2.style.color = '#FF0000';
	panel2.style.fontWeight = 'bold';
	panel2.innerHTML = str;
		}
	}
}
