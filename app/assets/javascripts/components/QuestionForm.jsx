var QuestionForm = React.createClass({
  getInitialState: function() {
    return {question: "", answer1: "", answer2: "", answer3: ""};
  },
  submitQuestion: function(e) {
    e.preventDefault();
    if (this.state.question != "" && this.state.answer1 != "" && this.state.answer2 != "" && this.state.answer3 != "") {
      this.props.addQuestion(this.state);
      this.setState({question: "", answer1: "", answer2: "", answer3: ""});
      $('.hidden-fields').toggleClass('hidden');
      if ($('.btn-success').hasClass('hidden')) {
        $('.btn-success').removeClass('hidden');
      }
    }
  },
  handleClick: function() {
    if (this.state.value != "") {
      $(event.target).parent().parent().parent().next().toggleClass('hidden');
    } else {
      console.log("Must submit a question");
    }
  },
  handleChange: function() {
    var fieldId = $(event.target).attr('id');
    switch(fieldId) {
      case "question":
        this.setState({question: event.target.value});
        break;
      case "a":
        this.setState({answer1: event.target.value});
        break;

      case "b":
        this.setState({answer2: event.target.value});
        break;
      case "c":
        this.setState({answer3: event.target.value});
        break;
    }
  },
  render: function() {
    return (
      <div className="questionForm">
        <div className="questionField">
          <p className="form-label">Your survey question: </p>
          <div className="form-group flex">
            <input type="text" id="question" name="question_prompt" onChange={this.handleChange} className="form-control input-field" value={this.state.question} />
            <a href="#" onClick={this.handleClick}><span className="glyphicon glyphicon-plus"></span></a>
          </div>
        </div>
        <div className="hidden-fields hidden">
          <table className="table table-striped table-bordered">
            <tr>
              <th className="form-letter"> A </th>
              <th>
                <input type="text" name="possible_answer" id="a" onChange={this.handleChange} value={this.state.answer1} className="form-control input-field" placeholder="answer 1" />
              </th>
            </tr>
            <tr>
              <th className="form-letter"> B </th>
              <th>
                <input type="text" name="possible_answer" id="b" onChange={this.handleChange} value={this.state.answer2} className="form-control input-field" placeholder="answer 1" />
              </th>
            </tr>
            <tr>
              <th className="form-letter"> C </th>
              <th>
                <input type="text" name="possible_answer" id="c" onChange={this.handleChange} value={this.state.answer3} className="form-control input-field" placeholder="answer 1" />
              </th>
            </tr>
          </table>
          <button className="btn btn-primary btn-lg" onClick={this.submitQuestion}>Create question</button>
        </div>
      </div>
    );
  }
});
