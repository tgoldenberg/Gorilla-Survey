var BarChart = ReactD3.BarChart;
var Graph = React.createClass({
  render: function(){
    var data = [{
        label: this.props.question,
        values: [{x: this.props.answer1.content, y: this.props.answer1.count},
                {x:  this.props.answer2.content, y: this.props.answer2.count},
                {x: this.props.answer3.content, y: this.props.answer3.count}]
    }];

    return (
      <BarChart data={data} width={600} height={300} margin={{top: 10, bottom: 50, left: 50, right: 10}}/>
    );
  }
});
