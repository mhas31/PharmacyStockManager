import React from 'react';

import {makeStyles} from '@material-ui/core/styles'

import Login from './pages/Login';
import { Route, Switch } from 'react-router-dom';
import AdminDrugs from './pages/AdminDrugs';
import AdminCompanies from './pages/AdminCompany';
import Pharmacy1Drugs from './pages/Pharmacy1Drug';
import Pharmacy1Stock from './pages/Pharmacy1Stock';
import Pharmacy2Drugs from './pages/Pharmacy2Drug';
import Pharmacy2Stock from './pages/Pharmacy2Stock';


const useStyles = makeStyles((theme) => ({
  container: {
      display: "flex"
  },
  appbar: {
    zIndex: theme.zIndex.drawer + 1
  }

}));

function App() {

  const classes = useStyles();

  return (
    <div  >
      
      <Switch>
        <Route path="/" component={Login} exact />
        <Route path="/admin/drugs" component={AdminDrugs} exact />
        <Route path="/admin/companies" component={AdminCompanies} exact />
        <Route path="/pharmacy1/inventory" component={Pharmacy1Stock} exact />
        <Route path="/pharmacy1/drugs" component={Pharmacy1Drugs} exact />
        <Route path="/pharmacy2/inventory" component={Pharmacy2Stock} exact />
        <Route path="/pharmacy2/drugs" component={Pharmacy2Drugs} exact />
        
      </Switch>
      
    </div>
  );
}

export default App;
