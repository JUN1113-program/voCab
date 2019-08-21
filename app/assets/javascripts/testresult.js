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

  function createColors(num = 1){
    var colors = []
    if(num == 1){
      color = "rgba(" + (~~(256 * Math.random())) + ", " + (~~(256 * Math.random())) + ", " + (~~(256 * Math.random())) + ", 0.7)";
      return color
    }
    for(num; num > 0; num--){
      color = "rgba(" + (~~(256 * Math.random())) + ", " + (~~(256 * Math.random())) + ", " + (~~(256 * Math.random())) + ", 0.7)";
      colors.push(color)
    }
    console.log(colors);
    return colors;
  }

  // グラフを作成する
  function createChart(ctx = $("#myChart")[0], labels = [1,2,3,4,5], label = "タイトル",data = [1,2,3,4,5], type = "line", axes = 1,labeldisplay = 0,backgroundColor = "rgba(255, 99, 132, 0.7)",borderColor = "rgba(255, 50, 132, 1.0)"){
    ctx.height = 200;
    new Chart(ctx, {
      type: type,
      data: {
          labels: labels,
          datasets: [{
              label: label,
              data: data,
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              fill: true
          }]
      },
      options: {
          title:  {
            display: labeldisplay,
            text: label
          },
          tooltips: {
            mode: 'point'
        },
        scales: {
          yAxes: [{
            display: axes,
            scaleLabel: {
                display: false,
                labelString: '得点',
                fontSize: 18
            },
            ticks: {
                min: 0,
                max: 110,
                fontSize: 18,
                stepSize: 10
            },
          }],
          xAxes: [{
            display: axes,
            scaleLabel: {
                display: false,
                labelString: '回数',
                fontSize: 18
            },
            ticks: {
                min: 0,
                max: labels.length,
                fontSize: 18,
                stepSize: 2
            },
          }]
        }
      }
    });
  }


