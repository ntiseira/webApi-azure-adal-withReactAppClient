import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import ReactNestedTable from 'react-nested-table';


class App extends Component {
  constructor() {
    super();
  
  this.state = {
    data : [
        {id : 1, date : "2014-04-18", total : 121.0, status : "Shipped", name : "A", points: 5, percent : 50},
        {id : 2, date : "2014-04-21", total : 121.0, status : "Not Shipped", name : "B", points: 10, percent: 60},
        {id : 3, date : "2014-08-09", total : 121.0, status : "Not Shipped", name : "C", points: 15, percent: 70},
        {id : 4, date : "2014-04-24", total : 121.0, status : "Shipped", name : "D", points: 20, percent : 80},
        {id : 5, date : "2014-04-26", total : 121.0, status : "Shipped", name : "E", points: 25, percent : 90},
    ],
    expandedRows : []
};

}

handleRowClick(rowId) {
  const currentExpandedRows = this.state.expandedRows;
  const isRowCurrentlyExpanded = currentExpandedRows.includes(rowId);
  
  const newExpandedRows = isRowCurrentlyExpanded ? 
currentExpandedRows.filter(id => id !== rowId) : 
currentExpandedRows.concat(rowId);
  
  this.setState({expandedRows : newExpandedRows});
}

   
renderItem(item) {
  const clickCallback = () => this.handleRowClick(item.id);
  const itemRows = [
<tr onClick={clickCallback} key={"row-data-" + item.id}>
    <td>{item.date}</td>
    <td>{item.total}</td>
    <td>{item.status}</td>			
</tr>
  ];
  
  if(this.state.expandedRows.includes(item.id)) {
      itemRows.push(      
      <tr>
            <td colSpan={2}>
                <table >
                    <tbody>
                      <tr >
                        <td>Id Product</td>
                        <td>Description</td>
                        <td>Quantity</td>
                        <td>Discount</td>

                      </tr>

          <tr contenteditable key={"row-expanded-" + item.id}>
              <td>{item.name}</td>
              <td>{item.points}</td>
              <td>{item.percent}</td>
          </tr>
       
                    </tbody>
                </table>
            </td>
        </tr>
           
           
      );
  }
  
  return itemRows;    
}


render() {
  let allItemRows = [];

  this.state.data.forEach(item => {
    const perItemRows = this.renderItem(item);
  allItemRows = allItemRows.concat(perItemRows);
   });

  return (
    <div>
        <table >
            <thead>
            <tr>
                <th>Id</th>
                <th>Customer</th>
                <th>Adress</th>
                <th>City</th>
                <th>PostalCode</th>
                <th>Country</th>
                <th>Total Amount</th>
            </tr>
            </thead>
            <tbody>
              
         { allItemRows}
         
                </tbody>
            </table>
        </div>
        
        );
  
 
}


}

export default App;
