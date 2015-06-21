var Question = React.createClass({
  changeAnswer: function(answerID, letter, name) {
    this.setState({answer: name, answerID: answerID, letter: letter+". "})
    console.log(answerID);
  },
  getInitialState: function() {
    return {answer: "", answerID: "", letter: ""}
  },
  render: function() {
    var answers = this.props.answers;
    var func = this.changeAnswer;
    var questionId = this.props.question.question.id;
    var prompt = this.props.question.question.prompt;
    var answers = this.props.question.answers;
    var renderedAnswers = answers.map(function(answer, idx) {
      return <PossibleAnswer answer={answer} id={idx} handleAnswer={func} />
    });

    return (
      <div className="renderedQuestion">
        <div className="questionField">
          <p className="form-label">Your survey question: </p>
          <div className="form-group flex">
            <p> { prompt }</p>
          </div>
        </div>
        <div className="form-wrapper">
          <table className="table table-striped table-bordered">
            {renderedAnswers}
          </table>
          <p className="user-answer">Your answer: {this.state.letter} { this.state.answer }</p>
          <p className="hidden answers">{ this.state.answerID }</p>
        </div>
      </div>
    );
  }
});
