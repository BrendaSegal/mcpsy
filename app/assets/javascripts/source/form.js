import React from 'react';
import ReactDOM from 'react-dom';
import dateFormat from 'dateformat';
import uuid from 'uuid';

class Questionnaires extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      "visibleResponses": [
        {
          "date": "10-01-2018",
          "questionnaireResponseId": 204186,
          "questionnaireName": "Sleep - Night",
          "questionnaireKey": uuid(),
          "values": {
            "testingTextInput" : "test",
            "nightWakings" : 3,
          }
        },
        {
          "date": "10-01-2018",
          "questionnaireName": "Sleep - Night",
          "questionnaireKey": uuid(),
          "values": {
            "testingTextInput": "check it out!",
            "testingNumberInput": "5",
          }
        },
      ],
      "questionnaire": {
        "name": "Whatever",
        "parentForm": "Sleep - Night",
      },
      "forms": [
        {
          "formName": "Sleep - Night",
          "inputs": [
            {
              "name": "timeToSleep",
              "label": "Time they went to sleep",
              "type": "select",
              "options": {
                "9:30AM": "9:30AM",
              }
            },
            {
              "name": "testingTextInput",
              "label": "Testing Text Input",
              "type": "text",
            },
            {
              "name": "testingNumberInput",
              "label": "Testing Number Input",
              "type": "number",
            },
            {
              "name": "testingDateInput",
              "label": "Testing Date Input",
              "type": "date",
            },
            {
              "name": "whenTheyFellAsleep",
              "label": "When they fell asleep",
              "type": "select",
              "options": {
                "9:30AM": "9:30AM",
              }
            },
            {
              "name": "whenTheyWokeUp",
              "label": "When they woke up",
              "type": "select",
              "options": {
                "9:30AM": "9:30AM",
              }
            },
            {
              "name": "nightWakings",
              "label": "Number of Night Wakings",
              "type": "number",
              "children": [
                {
                  "childForm": "Night Wakings",
                },
              ]
            }
          ]
        },
        {
          "formName": "Night Wakings",
          "inputs": [
            {
              "name": "whenTheyWokeUp",
              "label": "When they woke up",
              "type": "select",
              "options": {
                "9:30PM": "21:30",
              }
            },
            {
              "name": "durationAwake",
              "label": "How long they were awake",
              "type": "select",
              "options": {
                "15 minutes": "15",
              }
            },
            {
              "name": "careGiverIntervention",
              "label": "Care Giver Intervention",
              "type": "select",
              "options": {
                "No Intervention": "No Intervention",
                "Feeding": "Feeding",
                "Parent Intervention w/o Feeding": "Parent Intervention w/o Feeding",
                "Other": "Other"
              },
              "children": [
                {
                  "childForm": "Night Wakings Feeding",
                  "parentValue": "Feeding",
                }
              ]
            },
          ]
        },
        {
          "formName": "Night Wakings Feeding",
          "inputs": [
            {
              "type": "select",
              "label": "Breastfeeding duration",
              "name": "breastFeedingDuration",
              "options": {
                "No breastfeeding": "0",
                "1 minute": "1",
                "2 minute": "2",
                "3 minute": "3",
                "4 minute": "4",
              }
            },
            {
              "type": "number",
              "label": "Quantity of formula",
              "defaultValue": 0,
              "name": "quantityOfFormula"
            },
            {
              "type": "select",
              "label": "unit",
              "name": "formulaUnit",
              "options": {
                "ml": "ml",
                "oz": "oz",
              }
            }
          ]
        }
      ]
    }
  }

  handleChange = (e, id) => {
    const visibleResponses = this.state.visibleResponses;

    visibleResponses[this.state.visibleResponses.findIndex((response) => {
      return response.questionnaireKey == id;
    })].values[e.target.name] = e.target.value;


    this.setState({visibleResponses});
  }

  handleRemoveVisible = () => {
    this.setState({visibleResponses: []});
  }

  handleAddNewQuestionnaire = () => {
    this.setState((prevState) => {
      let newVisibleResponses = [].concat(prevState.visibleResponses);

      newVisibleResponses.push({
        questionnaireName: this.state.questionnaire.parentForm,
        questionnaireKey: uuid(),
        values: {},
      });

      this.setState({visibleResponses: newVisibleResponses});
    });
  }

  buildQuestionnaires = () => {
    let questionnaires = [];

    this.state.visibleResponses.forEach((response, idx) => {
      questionnaires.unshift(<Questionnaire
        key={response.questionnaireKey}
        questionnaireDetails={response}
        forms={this.state.forms}
        handleChange={this.handleChange}
      />);
    });

    return questionnaires;
  }

  render() {
    return (
      <div>
        <Title title={this.state.questionnaire.name} />
        <button onClick={this.handleRemoveVisible}>Remove Visible Responses</button>
        <button onClick={this.handleAddNewQuestionnaire}>Add New Questionnaire</button>

        {this.buildQuestionnaires()}
      </div>
    )
  }
}

class Title extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <h1>{this.props.title}</h1>
    )
  }
}

class Questionnaire extends React.Component {
  constructor(props) {
    super(props);
  }

  getForm(formToUse) {
    return this.props.forms.find(form => {
      return form.formName === formToUse;
    });
  }

  renderChildren = (parentInput, form, idx) => {
    const count = this.props.questionnaireDetails.values[parentInput.name];
    let children = [];

    if ( typeof parseInt(count) === 'number' && count ) {
      for (var i = 0; i < count; i++) {
        children.push(<div key={`child-${idx}-${i}  `} className="questionnaire__child">{this.renderForm(form)}</div>);
      }

      return children;
    }

    return false;
  }

  renderForm(formTouse = this.props.questionnaireDetails.questionnaireName) {
    return this.getForm(formTouse).inputs.map((input, idx) => {
      if (!!input.children) {
        return (
          <div className="questionnaire__combination" key={`combo-${idx}`}>
            <div key={`parent-${idx}`} className="questionnaire__parent">{this.renderInput(input, idx)}</div>
            {this.renderChildren(input, input.children[0].childForm, idx)}
          </div>
        )
      }

      return this.renderInput(input, idx);
    })
  }

  renderInput = (input, idx) => {
    let inputToRender;
    const value = this.props.questionnaireDetails.values[input.name];

    switch (input.type) {
      case 'select':
        inputToRender = (
          <Select
            name={input.name}
            defaultValue={value}
            key={`input-${idx}`}
          />
        );
        break;

      default:
        inputToRender = (
          <Input
            type={input.type}
            defaultValue={value}
            name={input.name}
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

class Label extends React.Component {
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

class Input extends React.Component {
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

class Select extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      value: this.props.defaultValue || '',
    }
  }

  handleChange = (e) => {
    this.setState({value: e.currentTarget.value});
  }

  render() {
    return (
      <select
        className={!!this.state.value ? 'material-input__select has-value' : 'material-input__select'}
        onChange={this.handleChange}
        name={this.props.name}
        value={this.state.value}
      >

        <option value=""></option>
        <option value="hey">hey</option>
      </select>
    )
  }
}

export default () => { ReactDOM.render(<Questionnaires />, document.getElementById('form')); };
