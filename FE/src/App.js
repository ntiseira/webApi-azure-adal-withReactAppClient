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


export const UpdateDataDetails = (idOrder, details) => {
  return new Promise((resolve, reject) => {
  
    var requestPost = {
      Id: idOrder,
      Details: details
       };

       //requestPost.Details[0] =  details;

       axios({
        method: 'post',
        url: 'http://localhost:51590/api/Order/PostEditOrder',
        data: requestPost
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
      filtered: "",
      lastOrderSelected: null
    };

this.fetchData = this.fetchData.bind(this);

this.renderEditable = this.renderEditable.bind(this);
this.setLastOrderSelected = this.setLastOrderSelected.bind(this);
this.getLastOrderSelected = this.getLastOrderSelected.bind(this);

}

setLastOrderSelected(id)
{
  this.setState({
    lastOrderSelected: id
  });


}

getLastOrderSelected()
{

  return this.state.lastOrderSelected;
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


renderEditable = cellInfo => {
let dataTest = this.getLastOrderSelected();

  return (
    <div
      style={{ backgroundColor: "#fafafa" }}
      contentEditable
      suppressContentEditableWarning
      onBlur={e => {
        const data = [...this.state.data];
        
        //data[cellInfo.index][cellInfo.column.id] = e.target.innerHTML;
        if (data[dataTest].Details.find(a=> a.Id = cellInfo.row._original.Id)[cellInfo.column.id].toString() !== e.target.innerHTML)
        {
        this.setState({ data });
     
        console.log(dataTest);

       UpdateDataDetails(cellInfo.row._original.OrderId,  data.find(x => x.Id === cellInfo.row._original.OrderId).Details).then(response => {
                          
          this.setState({ data });
      });
 
}
      }}
      dangerouslySetInnerHTML={{
        __html: cellInfo.value
      }}
    />
  );
}

render() {

  let data = this.state;
  let pages = this.state.pages;


   const OrderColumns = [{
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
    Header: 'Postal Code',
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


const OrderDetailColumns = [{
  Header: 'Id',
  accessor: 'Id' // String-based value accessors!
}, {
  Header: 'Description',
  accessor: 'ProductName'
  //, Cell: props => <span className='number'>{props.value}</span> // Custom cell components!
}, {
  Header: 'Quantity',
  accessor: 'Quantity' // String-based value accessors!
  ,Cell: this.renderEditable
  //, Cell: row => ( row.value )
}, {
  Header: 'Discount',
  accessor: 'Discount' // String-based value accessors!
  //, Cell: row => ( row.value )
 , Cell: this.renderEditable


}
];
 
  return (
    <div>
      <h1>Orders </h1>
      <br/>
      <br/>
    <ReactTable

      data={data.data}
      pages={pages} // Display the total number of pages
      columns={OrderColumns}    
      defaultPageSize={10}
      showPageSizeOptions = {false}
      className="-striped -highlight"
      manual // informs React Table that you'll be handling sorting and pagination server-side
      onFetchData={this.fetchData} // Request new data when things change
      filterable
      freezeWhenExpanded={true}

      SubComponent={row => {
        return (
          <div style={{ padding: "20px" }}>
            <em>
            <h3> Order Details</h3>
            </em>
            <br />
            <br />
            <ReactTable
              getTdProps={(state, rowInfo, column, instance) => {
                return {
                  onClick: (e, handleOriginal) => {
                    console.log("A Td Element was clicked!");
                    console.log("it produced this event:", e);
                    console.log("It was in this column:", column);
                    console.log("It was in this row:", rowInfo);
                    console.log("It was in this table instance:", instance);


                    this.setLastOrderSelected(rowInfo.index);
                    
            
                    // IMPORTANT! React-Table uses onClick internally to trigger
                    // events like expanding SubComponents and pivots.
                    // By default a custom 'onClick' handler will override this functionality.
                    // If you want to fire the original onClick handler, call the
                    // 'handleOriginal' function.
                    if (handleOriginal) {
                     handleOriginal();
                    }
                   
                   

                  }
                };
              }}
              data={row.original.Details}
              columns={OrderDetailColumns}
              showPagination={false}                            
              filterable
              defaultSorted={[
                {
                  id: "Id",
                  desc: false
                }
              ]}
              noDataText= {'No rows found'}

            />
          </div>
        );
      }}
    />
    <br />

  </div>
        
        );
  
 
}


}

export default App;
