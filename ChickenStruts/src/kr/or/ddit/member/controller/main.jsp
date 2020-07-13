<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
ul{
    list-style: none outside none;
    padding-left: 0;
    margin: 0;
}
.slide-content .slide-content{
    margin-bottom: 60px;
}
.slider li{
    text-align: center;
    color: #FFF;
    background-size:cover;
    background-position: center;
}
.slider h3 {
    margin: 0;
    padding: 100px 0;
    height:250px;
}
.slide-content{
    width: 100%;
    height:300px;
}
.item1{background-image:url('/images/icons/chicken.png');}
.item2{background-image:url('/images/icons/chicken.png');}
.item3{background-image:url('/images/icons/chicken.png');}
.item4{background-image:url('/images/icons/chicken.png');}
.item5{background-image:url('/images/icons/chicken.png');}
.item6{background-image:url('/images/icons/chicken.png');}
</style>
<head>
    <meta charset="UTF-8">
    <title>LightSlider Test</title>
    <link rel="stylesheet"  href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() {
    $("#slider").lightSlider({
        mode:'slide',    // 이미지가 표시되는 형식 (fade / slide)
        loop:true,       // 무한반복 할 것인지
        auto:true,       // 자동 슬라이드
        keyPress:true,   // 키보드 탐색 허용
        pager:false,     // 페이지 표시
        speed:1500,      // 슬라이드 되는 속도
        pause:3000       // 이미지가 머무는 시간
    });
});

</script>
 
<body>
    <div class="slide-wrap">
        <div class="slide-content">
            <ul id="slider" class="slider">
                <li class="item1">
                    <h3>유</h3>
                </li>
                <li class="item2">
                	 <h3>웅</h3>
                </li>
                <li class="item3">
                	 <h3>치</h3>
                </li>
                <li class="item4">
                 <h3>킨</h3>
                </li>
                <li class="item5">
                 <h3>짱</h3>
                </li>
                <li class="item6">
                 <h3>~</h3>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
