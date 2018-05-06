import React from 'react';
import dateFormat from 'dateformat';
import Select from './select.js';
import Input from './input.js';
import Label from './label.js';

export default class Questionnaire extends React.Component {
  constructor(props) {
    super(props);
  }

  getForm(formToUse) {
    return this.props.forms.find(form => {
      return form.formName === formToUse;
    });
  }

  renderChildren = (parentInput, forms, idx) => {
    const parentValue = this.props.questionnaireDetails.values[parentInput.name];

    let children = [];

    if ( typeof parentValue === 'string' ) {
      const form = forms.find((form) => form.parentValue === parentValue );

      if (form) {
        children.push(
          <div key={`child-${idx}-${i}`}
            className="questionnaire__child">

            {this.renderForm(form.childForm)}
          </div>
        );
      }
    }

    if ( typeof parseInt( parentValue ) === 'number' && parentValue ) {
      for (var i = 0; i < parentValue; i++) {
        children.push(
          <div key={`child-${idx}-${i}`}
            className="questionnaire__child">

            {this.renderForm(forms[0].childForm, i)}
          </div>
        );
      }
    }


    return children;
  }

  renderForm(formTouse = this.props.questionnaireDetails.questionnaireName, parentFormIndex = false) {
    return this.getForm(formTouse).inputs.map((input, idx) => {
      if (!!input.children) {
        return (
          <div className="questionnaire__combination" key={`combo-${idx}`}>
            <div key={`parent-${idx}`} className="questionnaire__parent">{this.renderInput(input, idx, parentFormIndex)}</div>
            {this.renderChildren(input, input.children, idx)}
          </div>
        )
      }

      return this.renderInput(input, idx, parentFormIndex);
    })
  }

  renderInput = (input, idx, parentFormIndex = false) => {
    let inputToRender;
    let inputName = parentFormIndex === false || parentFormIndex === undefined ? input.name : `${input.name}-${parentFormIndex}`;
    const value = this.props.questionnaireDetails.values[inputName];

    switch (input.type) {
      case 'select':
        inputToRender = (
          <Select
            name={inputName}
            defaultValue={value}
            key={`input-${idx}`}
            options={input.options}
          />
        );
        break;

      default:
        inputToRender = (
          <Input
            type={input.type}
            defaultValue={value}
            name={inputName}
            key={`input-${idx}`}
          />
        );
        break;
    }

    return (
      <div className="questionnaire__input-wrapper" key={`wrapper-${idx}`}>
        <div className="material-input" key={`material-${idx}`}>
          {inputToRender}
          <Label for={input.name} textContent={input.label} key={`label-${idx}`} />
        </div>
      </div>
    )
  }

  handleChange = (e) => {
    this.props.handleChange(e, this.props.questionnaireDetails.questionnaireKey);
  }

  render() {
    return (
      <form className="questionnaire" onChange={this.handleChange}>
        <h2 className="questionnaire__title">{dateFormat(this.props.questionnaireDetails.date, "dddd, mmmm dS, yyyy")}</h2>
        {this.renderForm()}
      </form>
    )
  }
}
