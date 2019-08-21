$(function(){
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

  //初期のテスト結果グラフを出力する
  function outputchart(){
    var user_id = $(".main--indexTestresult")[0].dataset.id;
    var url = `/users/${user_id}/api/testresults`;
    $.ajax({
      url: url
    })
    .done(function(testresults){
      testresults.forEach(function(testresult){
        appendHTML(testresult.id);
        createChart($(`#myChart${testresult.id}`)[0], testresult.labels, testresult.label, testresult.data, "line");
      });
    })
    .fail(function(testresults){
      window.alert("グラフの生成に失敗しました");
    });
  }

  // 初期のハイスコアグラフとアベレージスコアグラフを出力する
  function putscorechart(){
    var user_id = $(".main--indexTestresult")[0].dataset.id;
    var url = `/users/${user_id}/api/testresults/new`;
    $.ajax({
      url: url
    })
    .done(function(score){
      var color = createColors(score.labels.length)
      createChart($(`#chart__highScore`)[0], score.labels, "最高得点", score.high_scores, "polarArea", 0, 1,color,color);
      createChart($(`#chart__averageScore`)[0], score.labels, "平均点", score.average_scores, "polarArea", 0, 1,color,color);
    })
    .fail(function(){
      window.alert("グラフの生成に失敗しました");
    });
  }

  if (window.location.pathname.match("/users/.+/testresults")){
    outputchart();
    putscorechart();
  }

  // ボタンが押された際にグラフの種類を変更する
  $("button").on("click", function(){
    var color = createColors();
    var type = $(this).text();
    var axes = type == "radar" ? 0 : 1 ;
    var user_id = $(".main--indexTestresult")[0].dataset.id;
    var url = `/users/${user_id}/api/testresults`;
    $.ajax({
      url: url
    })
    .done(function(testresults){
      $(".charts--empty").html("");
      testresults.forEach(function(testresult){
        appendHTML(testresult.id);
        createChart($(`#myChart${testresult.id}`)[0], testresult.labels, testresult.label, testresult.data, type, axes, 0, color,color);
      });
    })
    .fail(function(data){
      window.alert("グラフの生成に失敗しました");
    });
  });
});