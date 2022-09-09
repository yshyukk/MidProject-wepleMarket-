<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://map.vworld.kr/js/webglMapInit.js.do?version=2.0&apiKey=2AC56E63-EB65-3EC3-818B-74F3582A0C2F"></script>
<meta charset="UTF-8">
    <title>WEPLE MARKET</title>
    
    <style>
      body{
        width: 900px;
        height: 500px;
      }

      input{
        background-color: #6c7ae0;
        color: rgb(255, 255, 255);
        margin-right: 6px;
        margin-bottom: 5px;
        margin-top: 5px;
        border: none;
        padding: 10px;
        width: 100px;
      }

    </style>
</head>
<body>
   
    <input type="button" value="메인뷰" onclick="javascript:flyHome();"/>
    <input type="button" onclick="vwmoveTo2(127.914481915959 , 36.444267225588 , 1000000)" value="전체조회">
    <input type="button" onclick="vwmoveTo(126.978229106965 , 37.5665711673465 , 150)" value="서울">
    <input type="button" onclick="vwmoveTo(126.43377108701 , 37.468649718031 , 2800)" value="인천">
    <input type="button" onclick="vwmoveTo(127.013258919229  , 37.2985453646613 , 150)" value="경기">
    <input type="button" onclick="vwmoveTo(128.595334593028 , 35.8664916093874 , 120)" value="대구">
    <input type="button" onclick="vwmoveTo(129.350203249641 , 35.4737048996921 , 2000)" value="울산">
    <input type="button" onclick="vwmoveTo(126.909795765774 , 35.1645575235227 , 80)" value="광주">


<div id="vmap" style="width:100%;height:600px;left:0px;top:0px"></div>

<script type="text/javascript">
        //지도 생성
        let mapOptions = new vw.MapOptions(
        vw.BasemapType.GRAPHIC, //2D 전용
        "", //layersArr 미사용 옵션
        vw.DensityType.FULL, //controlsDensity 2D 전용
        vw.DensityType.BASIC, //interactionDensity 2D 전용
        false , //controlAutoArrange 2D 전용
        new vw.CameraPosition(
        new vw.CoordZ(61.914481915959 , 20.444267225588 , 124), //초기 위치 설정(경도, 위도, 높이 값)
        new vw.Direction(0, -90, 0)
        ), //home
        new vw.CameraPosition(
        new vw.CoordZ(61.914481915959 , 20.444267225588 , 30000000), //초기 위치 설정(경도, 위도, 높이 값)
        new vw.Direction(0, -90, 0)
        )// initPosition
        );
        
        let map = new vw.Map("vmap", mapOptions);/////////////

        
function vwmoveTo(x, y, z) {
    var movePo = new vw.CoordZ(x, y, z);
    var mPosi = new vw.CameraPosition(movePo, new vw.Direction(50, -17, 0));
    map.moveTo(mPosi);
}
function vwmoveTo2(x, y, z) {
    var movePo = new vw.CoordZ(x, y, z);
    var mPosi = new vw.CameraPosition(movePo, new vw.Direction(0, -90, 0));
    map.moveTo(mPosi);
    setPoint();
}
/* begin -------- 맵 초기화 코드 --------- */
function vwmap() {
    var mapOptions = new vw.MapOptions(
        vw.BasemapType.GRAPHIC,
        "",
        vw.DensityType.FULL,
        vw.DensityType.BASIC,
        false,
        new vw.CameraPosition(new vw.CoordZ(126.921883, 37.524370, 482400), new vw.Direction(0, -90, 0)),
        new vw.CameraPosition(new vw.CoordZ(126.921883, 37.524370, 2982400), new vw.Direction(0, -90, 0))
    );

    map = new vw.Map("vmap", mapOptions);
}
function flyHome() {
    if ( map != null ) {
        vw.NavigationZoom.initHome();
        console.log("이동 :");
    }
}

var pop;
  var pointGroup;
  
  function setPoint() {  

    pointGroup = new vw.geom.ShapeGroups("testgroups");
    // 1. 이미지 일괄지정.
    pointGroup.setImage("https://map.vworld.kr/images/v2map/spotmarker.png");
    
    var point1Coord = new vw.Coord(126.909795765774 , 35.1645575235227);
    var pt1 = new vw.geom.Point(point1Coord);
    pt1.setId("test1");
    pt1.setName("광주 공동구매 78건 판매중");
    pt1.setFont("나눔고딕");
    pt1.setFontSize(20);
    
    
    var point2Coord = new vw.Coord(128.595334593028 , 35.8664916093874);
    var pt2 = new vw.geom.Point(point2Coord);
    pt2.setId("test2");
    pt2.setName("대구 공동구매 175 건 판매중");
    pt2.setFont("나눔고딕");
    pt2.setFontSize(20);
    pt2.create();
    
    var point3Coord = new vw.Coord(126.978229106965 , 37.5665711673465);
    var pt3 = new vw.geom.Point(point3Coord);
    pt3.setId("test3");
    pt3.setName("서울 공동구매 631 건 판매중");
    pt3.setFont("나눔고딕");
    pt3.setFontSize(20);
    pt3.create();
    
    var point4Coord = new vw.Coord(126.43377108701 , 37.468649718031);
    var pt4 = new vw.geom.Point(point4Coord);
    pt4.setId("test4");
    pt4.setName("인천 공동구매 231 건 판매중");
    pt4.setFont("나눔고딕");
    pt4.setFontSize(20);
    pt4.create();
    
    var point5Coord = new vw.Coord(127.013258919229  , 37.2985453646613);
    var pt5 = new vw.geom.Point(point5Coord);
    pt5.setId("test5");
    pt5.setName("경기 공동구매 532 건 판매중");
    pt5.setFont("나눔고딕");
    pt5.setFontSize(20);
    pt5.create();

    var point6Coord = new vw.Coord(129.350203249641 , 35.4737048996921);
    var pt6 = new vw.geom.Point(point6Coord);
    pt6.setId("test6");
    pt6.setName("울산 공동구매 89 건 판매중");
    pt6.setFont("나눔고딕");
    pt6.setFontSize(20);
    pt6.create();


    // 이벤트 처리 함수이며, 파라미터로 클릭시 window 픽셀, ecef좌표, cartographic좌표(실제경위도), 객체정보를 인수로 받는다.
    var eventHandler = function(windowPosition, ecefPosition, cartographic, featureInfo) {
        
      
      //console.log("property :" , windowPosition, ecefPosition, cartographic, featureInfo);
      if ( featureInfo != null ) {
        // featureInfo 와 Point객체와는 다름.
        // Point 객체를 가져올 경우 featureInfo.groupId로 가져옴.(그룹별 아이디라기 보다는 개별아이디.)

        var html;
        var id = featureInfo.groupId;
        console.log(id)
        var pointObj = map.getObjectById( id );
        console.log("pointObj :" , pointObj);

        if (id == 'test1') {
            html = '광주<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test2') {
            html = '대구<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test3') {
            html = '서울<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test4') {
            html = '인천<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test5') {
            html = '경기<br> 공동구매 판매 상품 현황';
        }
        else if (id == 'test6') {
            html = '울산<br> 공동구매 판매 상품 현황';
        }

        
        
        // 텍스트문구(HTML)
        //var html = '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세<br>';
        //html += '무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세~~';
        
        // 제목 title
        var title = pointObj.getName();
        //_id, _container, _title, _html, _width, _height, _x, _y
        // 식별아이디, 탑재컨테이너, 제목, html, 레이어가로길이, 레이어세로길이, 클릭 이벤트X, 클릭 이벤트Y
        pop = new vw.Popup("pop01", "vmap", title, html, 450, 300, windowPosition.x, windowPosition.y);
        pop.create();
      }      
    }
    /* pt1.addEventListener(eventHandler);
    pt2.addEventListener(eventHandler);
    pt3.addEventListener(eventHandler);
    pt4.addEventListener(eventHandler);
    pt5.addEventListener(eventHandler); */
    
    pointGroup.addEventListener(eventHandler);
    
    pointGroup.add(pt1);
    pointGroup.add(pt2);
    pointGroup.add(pt3);
    pointGroup.add(pt4);
    pointGroup.add(pt5);
    pointGroup.add(pt6);

    
    pointGroup.show();
  }
  
  // 일괄 마커 숨김
  function hideGroup() {
    pointGroup.hide();
  }
  
  // 일괄마커 표시
  function showGroup() {
    pointGroup.show();
  }
  
  function getObject() {
    var obj = pointGroup.getById("test2");
    console.log("obj : " , obj);
    obj.redraw();
  }
    
  // 마커 이벤트 제거방법.
  function removeEvent() {
     var _obj = map.getObjectById("test1");    
     if ( _obj != null ) {
        _obj.removeEventListener();
     }
  }
  
  // 마커 문구 수정 및 기타 수정.
  function redraw() {
      // 아이디로 객체를 찾는다.
      // 모든 그래픽 객체는 redraw() 메서드가 구현되어 있습니다.
      //test4
      var pt4 = map.getObjectById("test4");
      //console.log("pt4 :" , pt4);
      if ( pt4 != null ) {
        var point4Coord = new vw.Coord(126.971883, 37.527370);

        pt4.setCoord(point4Coord);
        //pt4.setImage("http://localhost:8082/images/v2map/spotmarker.png");
        pt4.setName("2차원 포인트4");
        pt4.setFont("궁서");
        pt4.setFontSize(25);
        pt4.redraw();  
      }
    }
  
  function redraw2() {
    var pt3 = map.getObjectById("test3");
    if ( pt3 != null ) {
      var point3Coord = new vw.Coord(126.945883, 37.524370);
      
      pt3.setName("2차원 포인트3-1");
      pt3.setFont("나눔고딕");
      pt3.setFontSize(15);
      pt3.redraw();
    }
  }
  
  /**
   vw.geom.ShapeGroups 메서드
   contructor : new vw.geom.ShapeGroups(아이디);  식별자
   setId(_id) : ShapeGroups id설정
   getId() : ShapeGroups id 반환
   setOption(_opt) : ShapeGroups 일괄 옵션 설정.  Polyline, MutilPolyline, Polygon, MultiPolygon 등.
   getOption() : ShapeGroups 옵션 반환.
   addEventListener(evtListener) : ShapeGroups 일괄 이벤트리스너 설정    
   removeEventListener() : ShapeGroups 일괄 이벤트리스너 삭제      
   setImage( _image ) :  ShapeGroups 일괄 이미지 설정
   getImage() : ShapeGroups 일괄 이미지 반환    
   add( _item ) : 도형객체 추가.      
   getById( _id ) : 아이디로 도형객체 반환
   removeById(_id) : 아이디로 도형객체 삭제      
   removeByObj(_obj) : 객체로 도형객체 삭제.
   show() : 도형 일괄 출력.
   showById(_id) : 아이디로 도형 검색 후 출력.
   hide() : 도형 일괄 숨김
   hideById(_id) : 아이디로 도형 검색 후 숨김.
  */


    

    
 </script>

</body>
</html>