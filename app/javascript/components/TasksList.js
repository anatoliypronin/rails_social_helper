import React from "react"
import PropTypes from "prop-types"

class TasksList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { tasks: [] }
  };

  fetchTasks() {
    fetch("/api/v1/tasks")
      .then(response => response.json())
      .then(result => this.setState({tasks: result}))
  };

  componentDidMount() {
    this. fetchTasks()
  };

  render () {
    return (
      <React.Fragment>
        <h1>Задачи</h1>
        <table className="table table-hover">
          <tr>
            <th> Названивае </th>
            <th> Описание </th>
            <th> Город </th>
            <th> Район </th>
            <th> Адрес </th>
            <th> Служба </th>
          </tr>
          {this.state.tasks && this.state.tasks.map(task => (
            <tr>
              <td>{task.title}</td>
              <td>{task.description}</td>
              <td>{task.city_id}</td>
              <td>{task.district_id}</td>
              <td>{task.address}</td>
              <td>{task.service_id}</td>
            </tr>
          ))}
        </table>
      </React.Fragment>
    );
  }
}

export default TasksList
