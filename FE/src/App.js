import React, { Component } from 'react';
import './App.css';
import ReactTable from "react-table";
import "react-table/react-table.css";
import { adalApiFetch } from './AdalReact/adalConfig';

 


export const requestData = (page,  sorted, filtered) => {
  return new Promise((resolve, reject) => {
  
    var requestCriteria = {
      PageNumber: page +1, //Add 1 becasuse react table initialize and manage page number starting by zero //(page > 0 ? page : 1 ),  
      Filter: (filtered.length > 0 ) ? filtered[0].value : "",
      OrderAsc: (sorted.length > 0 ) ? !sorted[0].desc : "" ,
      OrderBy:  (sorted.length > 0 ) ? sorted[0].id : ""
       };
     
    const headersToSend = {
        "Accept": "application/json",
    "Content-Type": "application/json"   
    };

    const url = 'http://localhost:51590/api/Order/PostGetOrders';

    adalApiFetch(fetch, url, {method: 'POST',  body: JSON.stringify(requestCriteria) , headers: headersToSend,   cache: 'no-cache'})
      .then(response => response.json())
      .then((response) => {

        resolve(response);   
      })
      .catch((error) => {

        console.error(error);
      }) 
    });
};

export const UpdateDataDetails = (detail) => {
  return new Promise((resolve, reject) => {
 
    const headersToSend = {
      "Accept": "application/json",
  "Content-Type": "application/json"   
  };

  const url = 'http://localhost:51590/api/Order/PostEditOrderDetail';

  adalApiFetch(fetch, url, {method: 'POST',  body: JSON.stringify(detail) , headers: headersToSend,   cache: 'no-cache'})
    .then(response => response.json())
    .then((response) => {

      resolve(response);   
    })
    .catch((error) => {

      console.error(error);
    }) 
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

this.renderEditable = this.renderEditable.bind(this);
this.onKeyPressed = this.onKeyPressed.bind(this);
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
        data: response.CurrentPageItems,
        pages: response.TotalPages,
        loading: false
      });
  });
}

onKeyPressed =(event)=>{
 
  var key = window.event ? event.keyCode : event.which;
  if (event.keyCode === 8 || event.keyCode === 46) {
    console.log("true"); 
    return true;
  } else if ( key < 48 || key > 57 ) {
    console.log("false");
    event.stopPropagation();

      return false;
  } else {
    console.log("true ult else"); 
      return true;
  }

}

isNumberKey(evt){
  var charCode = (evt.which) ? evt.which : evt.keyCode
  return !(charCode > 31 && (charCode < 48 || charCode > 57));
}


renderEditable = cellInfo => {


  return (
    <div
    
      onKeyDown={this.onKeyPressed}
      onKeyPress={this.onKeyPressed}
      onKeyUp={this.onKeyPressed}
      //pattern="[0-9]*"
      style={{ backgroundColor: "#fafafa" }}
      contentEditable
      suppressContentEditableWarning
      onBlur={e => {
        const data = [...this.state.data];
        
        //Validate if field changed to call BE to update orderDetail Item
        if (data.find(a=> a.Id === cellInfo.original.OrderId).Details[cellInfo.index][cellInfo.column.id].toString() !== e.target.innerHTML)
        {
            data.find(a=> a.Id === cellInfo.original.OrderId).Details[cellInfo.index][cellInfo.column.id] = e.target.innerHTML;

            UpdateDataDetails(data.find(a=> a.Id === cellInfo.original.OrderId).Details[cellInfo.index]).then(response => {
          
              this.setState({ data });
          });     
        } 

        
      }}
      dangerouslySetInnerHTML={        
      {        
        __html: cellInfo.value 
      }}
    />
  );
}


getOrderColumnsTable()
{


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

return OrderColumns;

}

getOrderDetailsColumnsTable()
{

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

return OrderDetailColumns;
}


render() {

  let data = this.state;
  let pages = this.state.pages;

  return (
    <div>
      <h1>Orders </h1>
      <br/>
      <br/>
    <ReactTable
      
      data={data.data}
      pages={pages} // Display the total number of pages
      columns={this.getOrderColumnsTable()}    
      defaultPageSize={10}
      showPageSizeOptions = {false}
      className="-striped -highlight"
      manual // informs React Table that you'll be handling sorting and pagination server-side
      onFetchData={this.fetchData} // Request new data when things change
      filterable
      freezeWhenExpanded={true}
      defaultSorted={[
        {
          id: "Id",
          desc: false
        }
      ]}
      SubComponent={row => {
        return (
          <div style={{ padding: "20px" }}>
            <em>
            <h3> Order Details</h3>
            </em>
            <br />
            <br />
            <ReactTable         
              data={row.original.Details}
              columns={this.getOrderDetailsColumnsTable()}
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
