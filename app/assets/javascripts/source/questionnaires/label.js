import React from 'react';

export default class Label extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <label className="material-input__label" htmlFor={this.props.htmlFor}>
        {this.props.textContent}
      </label>
    )
  }
}
