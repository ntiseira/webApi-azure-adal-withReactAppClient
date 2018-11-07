//import DashApp from './dashApp';
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
//import 'antd/dist/antd.css';
//import { runWithAdal } from 'react-adal';
//import { authContext } from './adal-config';
import * as serviceWorker from './serviceWorker';

ReactDOM.render(<App />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA



//import React from 'react';
//import ReactDOM from 'react-dom';

//import registerServiceWorker from './registerServiceWorker';

  /*
const DO_NOT_LOGIN = false;
runWithAdal(authContext, () => {
  ReactDOM.render(<DashApp />, document.getElementById('root'));
  // Hot Module Replacement API
  if (module.hot) {
    module.hot.accept('./dashApp.js', () => {
      const NextApp = require('./dashApp').default;
      ReactDOM.render(<NextApp />, document.getElementById('root'));
    });
  }
  
},DO_NOT_LOGIN);
  

*/
serviceWorker.unregister();

//registerServiceWorker();​