<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src=
"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js">
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

                       <div class="container">
						    <canvas id="myChart" width="200px" height="200px"></canvas>
						</div>
						<script type="text/javascript">
						var ctx = document.getElementById('myChart').getContext('2d');
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: [${date.firstday_date}, '6일전', '08-14', '목', '금', '토','일'],
						        datasets: [{
						            label: '지난 7일간 달린거리',
						            data: [${graph.firstday}, ${graph.secondday}, ${graph.thirdday}, ${graph.fourthday}, ${graph.fifthday}, ${graph.sixthday},${graph.seventhday}],
						            backgroundColor: [
						                'rgba(216, 27, 96, 0.6)',
						                'rgba(3, 169, 244, 0.6)',
						                'rgba(255, 152, 0, 0.6)',
						                'rgba(29, 233, 182, 0.6)',
						                'rgba(156, 39, 176, 0.6)',
						                'rgba(84, 110, 122, 0.6)'
						            ],
						            borderColor: [
						                'rgba(216, 27, 96, 1)',
						                'rgba(3, 169, 244, 1)',
						                'rgba(255, 152, 0, 1)',
						                'rgba(29, 233, 182, 1)',
						                'rgba(156, 39, 176, 1)',
						                'rgba(84, 110, 122, 1)'
						            ],
						            borderWidth: 1
						        }]
						    },
						    options: {
						        legend: {
						            display: false
						        },
						        title: {
						            display: true,
						            text: 'Life Expectancy by Country',
						            position: 'top',
						            fontSize: 16,
						            padding: 20
						        },
						        scales: {
						            yAxes: [{
						                ticks: {
						                	
						                    min: 75
						                }
						            }]
						        }
						    }
						});
						</script>

</body>
</html>