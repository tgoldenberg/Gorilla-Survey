var PossibleAnswer = React.createClass({
  handleClick: function(event) {
    event.preventDefault();
    answerID = this.props.answer.id;
    letter = $(event.target).parent().children().first().html();
    name = $(event.target).parent().parent().next().html();
    this.props.handleAnswer(answerID, letter, name);
  },
  render: function() {
    var letters = ["A", "B", "C"];
    var letter = letters[this.props.id];
    return (
      <tr>
        <th className="form-letter"><a onClick={this.handleClick} href="#" className="letter-anchor">{letter}. </a></th>
        <th>{this.props.answer.content}</th>
      </tr>
    );
  }
});
