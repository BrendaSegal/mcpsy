import React from 'react';
import Option from './option.js';

export default class Select extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      value: this.props.defaultValue || '',
    }
  }

  handleChange = (e) => {
    this.setState({value: e.currentTarget.value});
  }

  renderOptions = (options) => {
    let optionsToRender = [<Option key='default' text='' value='' />];

    for (var key in options) {
        if (options.hasOwnProperty(key)) {
          optionsToRender.push(<Option key={key} text={key} value={options[key]} />);
        }
    }

    return optionsToRender;
  }

  render() {
    return (
      <select
        className={!!this.state.value ? 'material-input__select has-value' : 'material-input__select'}
        onChange={this.handleChange}
        name={this.props.name}
        value={this.state.value}
      >

        {this.renderOptions(this.props.options)}

      </select>
    )
  }
}
