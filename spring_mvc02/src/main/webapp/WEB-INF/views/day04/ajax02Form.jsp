<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한국환경공단_에어코리아_대기오염정보</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        font-family: 'Segoe UI', sans-serif;
        font-size: 14px;
    }
    

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: center;
    }

    th {
        background-color: #082567;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #e0f7fa;
    }

    h2 {
        color: #082567;
        font-size: 20px;
        margin-bottom: 10px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>한국환경공단_에어코리아_대기오염정보 (서울)</h2>
	<button id="btnXml">XML 데이터 불러오기</button>
	<button id="btnJson">Json 데이터 불러오기</button>
	
	<div id="result"></div>
	
	
	<!-- ajax는 일반적인 Controller로 가지 않는다. RestController로 간다. -->
	<script type="text/javascript">
		
		$("#btnXml").on("click", function() {
		    $("#result").html("<p>XML 데이터 로딩 중 ...</p>");
		    $.ajax({
		        url : "/weather2Xml",
		        method : "post",
		        dataType : "xml",
		        success : function(response) {
		            let table = "<h2>XML 결과</h2><table>";
		            table += "<thead><tr><th>측정일시</th><th>시도명</th><th>측정소명</th><th>일산화탄소 농도</th><th>아황산가스 농도</th><th>미세먼지(PM2.5)</th><th>미세먼지(PM10)</th></tr></thead><tbody>";

		            $(response).find("item").each(function () {
		                let dataTime = $(this).find("dataTime").text();
		                let sidoName = $(this).find("sidoName").text();
		                let stationName = $(this).find("stationName").text();
		                let coValue = $(this).find("coValue").text();
		                let so2Value = $(this).find("so2Value").text();
		                let pm25Value = $(this).find("pm25Value").text();
		                let pm10Value = $(this).find("pm10Value").text();

		                table += "<tr>";
		                table += "<td>" + dataTime + "</td>";
		                table += "<td>" + sidoName + "</td>";
		                table += "<td>" + stationName + "</td>";
		                table += "<td>" + coValue + "ppm</td>";
		                table += "<td>" + so2Value + "ppm</td>";
		                table += "<td>" + pm25Value + "㎍/㎥</td>";
		                table += "<td>" + pm10Value + "㎍/㎥</td>";
		                table += "</tr>";
		            });

		            table += "</tbody></table>";
		            $("#result").html(table); 
		        },
		        error : function() {
		            alert("가져오기 실패");
		        }
		    });
		});
		
		$("#btnJson").on("click", function () {
		    $("#result").html("<p>JSON 데이터 로딩 중 ...</p>");

		    $.ajax({
		        url: "/weather2Json",
		        method: "post",
		        dataType: "json",
		        success: function (response) {
		            const items = response.response?.body?.items;

		            if (!items || items.length === 0) {
		                $("#result").html("<p>데이터가 없습니다.</p>");
		                return;
		            }

		            let table = "<h2>JSON 결과</h2><table>";
		            table += "<thead><tr><th>측정일시</th><th>시도명</th><th>측정소명</th><th>일산화탄소 농도</th><th>아황산가스 농도</th><th>미세먼지(PM2.5)</th><th>미세먼지(PM10)</th></tr></thead><tbody>";

		            $.each(items, function (i, v) {
		                let dataTime = v.dataTime || "-";
		                let sidoName = v.sidoName || "-";
		                let stationName = v.stationName || "-";
		                let coValue = v.coValue ? v.coValue + "ppm" : "-";
		                let so2Value = v.so2Value ? v.so2Value + "ppm" : "-";
		                let pm25Value = v.pm25Value ? v.pm25Value + "㎍/㎥" : "-";
		                let pm10Value = v.pm10Value ? v.pm10Value + "㎍/㎥" : "-";

		                table += "<tr>";
		                table += "<td>" + dataTime + "</td>";
		                table += "<td>" + sidoName + "</td>";
		                table += "<td>" + stationName + "</td>";
		                table += "<td>" + coValue + "</td>";
		                table += "<td>" + so2Value + "</td>";
		                table += "<td>" + pm25Value + "</td>";
		                table += "<td>" + pm10Value + "</td>";
		                table += "</tr>";
		            });

		            table += "</tbody></table>";
		            $("#result").html(table);
		        },
		        error: function (xhr, status, error) {
		            console.error("❌ 오류 발생:", error);
		            console.log("응답 내용:", xhr.responseText);
		            alert("가져오기 실패 (JSON)");
		        }
		    });
		});
	</script>
</body>
</html>