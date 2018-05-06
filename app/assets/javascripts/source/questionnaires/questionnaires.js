import React from 'react';
import Questionnaire from './questionnaire.js';
import Title from './title.js';
import uuid from 'uuid';

export default class Questionnaires extends React.Component {
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
