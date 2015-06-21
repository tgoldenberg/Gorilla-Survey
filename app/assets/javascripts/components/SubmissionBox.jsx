var SubmissionBox = React.createClass({
  createSubmission: function(event) {
    event.preventDefault();
    answerIDs = [];
    $.each($('.answers'), function(idx, ele) {
      answerIDs.push($(ele).html());
    });
    $.ajax({
      url: "/submissions",
      method: "post",
      dataType: "json",
      data: {answerIDs: answerIDs, surveyId: this.state.data.survey_id },
      success: function(data) {
        console.log(data);
        window.location = "/submissions/" + data;
      },
      error: function(err) {
        console.log(err);
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: this.props, answers: []};
  },
  render: function() {
    console.log(this.state);
    var questions = this.state.data.questions;
    var renderQuestions = questions.map(function(question) {
      return <Question question={question} />
    })

    return (
      <div className="container">
        <div className="well">
          <p>Survey created by: { this.props.username }</p>
          <h1>{ this.state.data.title }</h1>
        </div>

        <form action="/submissions" method="post">
          {renderQuestions }
        </form>
        <button className="btn btn-lg btn-success" onClick={this.createSubmission} >Submit survey</button>
      </div>
    );
  }
});
