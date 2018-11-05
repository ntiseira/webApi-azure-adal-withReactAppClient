import React, { Component } from 'react';
import './App.css';
import axios from 'axios';


// Import React Table
import ReactTable from "react-table";
import "react-table/react-table.css";

export const requestData = (page,  sorted, filtered) => {
  return new Promise((resolve, reject) => {
  
    var requestCriteria = {
      PageNumber: page +1, //Add 1 becasuse react table initialize and manage page number starting by zero //(page > 0 ? page : 1 ),  
      Filter: (filtered.length > 0 ) ? filtered[0].value : "",
      OrderAsc: (sorted.length > 0 ) ? !sorted[0].desc : "" ,
      OrderBy:  (sorted.length > 0 ) ? sorted[0].id : ""
       };

       axios({
        method: 'post',
        url: 'http://localhost:51590/api/Order/PostGetOrders',
        data: requestCriteria
      })
      .then(function (response){     
        resolve(response);
        })        
      .catch(function (error) {
        console.log(error); //TODO: Revisar el manejo de excepciones
      });
  });
};


class App extends Component {
  constructor() {
    super();
  
    this.state = {
      data: [],
      pages: null,
      loading: true,
      page: 1,
      sorted: "",
      filtered: ""
    };

this.fetchData = this.fetchData.bind(this);

}



fetchData(state, instance) {
  // Whenever the table model changes, or the user sorts or changes pages, this method gets called and passed the current table model.
  // You can set the `loading` prop of the table to true to use the built-in one or show you're own loading bar if you want.
  this.setState({ loading: true });
  // Request the data however you want.  Here, we'll use our mocked service we created earlier
  
     requestData(   
      state.page,
      state.sorted,
      state.filtered 

    ).then(response => {
      // Now just get the rows of data to your React Table (and update anything else like total pages or loading)
      this.setState({
        data: response.data.CurrentPageItems,
        pages: response.data.TotalPages,
        loading: false
      });
  });
    

}



render() {

  let data = this.state.data;
  let pages = this.state.pages;

   const columns = [{
    Header: 'Id',
    accessor: 'Id' // String-based value accessors!
  }, {
    Header: 'Customer',
    accessor: 'OrderCustomer.ContactName'
    //, Cell: props => <span className='number'>{props.value}</span> // Custom cell components!
  }, {
    Header: 'Adress',
    accessor: 'shipAdress' // String-based value accessors!
  }, {
    Header: 'City',
    accessor: 'shipCity' // String-based value accessors!
  },
  {
    Header: 'PostalCode',
    accessor: 'shipPostalCode' // String-based value accessors!
  }  ,
  {
    Header: 'Country',
    accessor: 'shipCountry' // String-based value accessors!
  }  ,
  {
    Header: 'Total Amount',
    accessor: 'TotalAmount' // String-based value accessors!
  } 
];
 
  return (
    <div>
    <ReactTable
      data={data}
      pages={pages} // Display the total number of pages
      columns={columns}    
      defaultPageSize={10}
      className="-striped -highlight"
      manual // informs React Table that you'll be handling sorting and pagination server-side
      onFetchData={this.fetchData} // Request new data when things change
      filterable
    />
    <br />

  </div>
        
        );
  
 
}


}

export default App;
