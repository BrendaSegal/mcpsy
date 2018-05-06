import React from 'react';

export default class Input extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      value: this.props.defaultValue,
    }
  }

  handleChange = (e) => {
    this.setState({value: e.currentTarget.value});
  }

  render() {
    return (
      <input
        className={!!this.state.value ? 'material-input__input has-value' : 'material-input__input'}
        onChange={this.handleChange}
        value={this.state.value}
        type={this.props.type}
        name={this.props.name}
        id={this.props.name}
      />
    )
  }
}
