import React from "react"
import MaterialTable from 'material-table';
import PropTypes from "prop-types"

class TasksList extends React.Component {
  constructor(props) {
    super(props)
    this.state = { tasks: [],  columns: [
      { title: 'Название', field: 'title' },
      { title: 'Описание', field: 'description' },
      { title: 'Город', field: 'city.name' },
      { title: 'Район', field: 'district.name' },
      { title: 'Адрес', field: 'address' },
      { title: 'Служба', field: 'services'}]
    }
  }

  fetchTasks() {
    fetch("/api/v1/tasks")
      .then(response => response.json())
      .then(result => this.setState({tasks: result}))
  };
    
  componentDidMount() {
    console.log(this.fetchTasks)
    this.fetchTasks()
  };

  render () {
    return (
      <React.Fragment>
        <MaterialTable
        title="Задачи"
        columns={this.state.columns}
        data={this.state.tasks}
        onRowClick={((evt, selectedRow) => this.setState({ selectedRow }))}
        detailPanel={rowData => {
          return (
            <iframe
              width="100%"
              height="315"
              frameBorder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
            />
          )
        }}
        ></MaterialTable>
      </React.Fragment>
    );
  }
}

export default TasksList
