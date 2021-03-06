// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require kindeditor

//= require bootstrap
//= require kindeditor/kindeditor.js
//= require_tree .

/*===== Welcome#index - 首頁導航列變化 =====*/
$(window).scroll(function () {
	var $navbar = $('#navbar')
	if ($(this).scrollTop() > 500) {
		$('#navbar').addClass('show_bgcolor')
	} else {
		$('#navbar').removeClass('show_bgcolor')
	}
})

/*===== Products#show - 變更顯示圖片 =====*/
$(document).on('mouseover', '.list-image', function () {
  var src_other = $(this).attr('src') //抓取小圖圖片路徑
  var src_main = src_other.toString().replace("other", "main") //更改圖片路徑

  $('.main-image').attr('src', src_main) //變更大圖圖片路徑

  $('.list-image').removeClass('list-image-active') //其他圖片移除鎖定狀態
  $(this).addClass('list-image-active') //當前圖片新增鎖定狀態
})

$(document).ready(function() {
	$('#myCarousel').carousel({
	interval: 5000
	})

    $('#myCarousel').on('slid.bs.carousel', function() {
    	//alert("slid");
	});


});
