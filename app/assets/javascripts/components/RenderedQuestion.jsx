var RenderedQuestion = React.createClass({
  render: function() {
    return (
      <div className="renderedQuestion">
        <div className="questionField">
          <p className="form-label">Your survey question: </p>
          <div className="form-group flex">
            <p>{this.props.question}</p>
          </div>
        </div>
        <div className="form-wrapper">
          <table className="table table-striped table-bordered">
            <tr>
              <th className="form-letter"> A </th>
              <th>{this.props.answer1}</th>
            </tr>
            <tr>
              <th className="form-letter"> B </th>
              <th>{this.props.answer2}</th>
            </tr>
            <tr>
              <th className="form-letter"> C </th>
              <th>{this.props.answer3}</th>
            </tr>
          </table>
        </div>
      </div>
    );
  }
});
