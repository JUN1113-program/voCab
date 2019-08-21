$(function(){
  var ctx = $("#myChart")[0];
  var myChart = new Chart(ctx, {
      type: 'line',
  // グラフの土台を作成する
  function appendHTML(id){
    var HTML = `
    <div class = "wrapar">
      <canvas id='myChart${id}'></canvas>
    </div>
    `
    $(".charts--empty").append(HTML);
  }
      data: {
          labels: [1,2,3,4,5],
          datasets: [{
              label: "テスト結果",
              data: [Math.random(),Math.random(),Math.random(),Math.random(),Math.random()],
              backgroundColor: 'rgba(255, 99, 132, 1.0)',
              borderColor: 'rgba(255, 50, 132, 1.0)',
              fill: true
          }]
      },
      options: {
          title:  {
            display: true,
            text: "ここがタイトルだよ"
          },
          tooltips: {
            mode: 'point'
        }
      }
  });
});


