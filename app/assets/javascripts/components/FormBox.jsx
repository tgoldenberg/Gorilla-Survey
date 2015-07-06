var FormBox = React.createClass({
  getInitialState: function() {
    return {title: "", questions: []};
  },
  submitSurvey: function(event) {
    event.preventDefault();
    var questions = this.state.questions;
    var title = this.state.title;
    $.ajax({
      url: "/surveys",
      method: "post",
      dataType: "json",
      data: {title: title, questions: questions},
      success: function(data) {
        window.location = "/surveys/" + data;
      },
      error: function(err) {
        console.log(err);
      }.bind(this)
    });
  },
  changeTitle: function() {
    this.setState({title: event.target.value});
  },
  pushQuestion: function(data) {
    var prevQuestions = this.state.questions;
    prevQuestions.push({data});

    this.setState({questions: prevQuestions });
    return false;
    console.log(this.state)
  },
  render: function() {
    var questionLength = this.state.questions.length;
    var submittedQuestions = [];
    var questions = this.state.questions;
    for (i=0; i< questionLength; i++) {
      var question = questions[i].data.question;
      var answer1 = questions[i].data.answer1;
      var answer2 = questions[i].data.answer2;
      var answer3 = questions[i].data.answer3;
      submittedQuestions.push(<RenderedQuestion question={question} key={i} answer1={answer1} answer2={answer2} answer3={answer3} />);
    }
    var renderedQuestions = submittedQuestions.map(function(question) {
      return question;
    });

    return (
      <div className="container">
        <div className="well">
          <h1>Create a new survey!</h1>
        </div>
        <form action="/surveys" method="post" className="form-horizontal">
          <div className="form-group">
            <p className="form-label">Title: </p>
            <input type="text" onChange={this.changeTitle} value={this.state.title} id="title_field" className="form-control input-field" name="title"/><br/>
          </div>
          {renderedQuestions}
          <QuestionForm addQuestion={this.pushQuestion} />
          <button className="btn btn-success btn-lg hidden" id="survey_submit" onClick={this.submitSurvey}>Create Survey</button>
        </form>
      </div>
    );
  }
});
