import React from 'react'
import {useHistory} from 'react-router-dom'
import NavBar from '../components/NavBar';

import CompanyList from '../components/companies/companyList';

export default function AdminCompanies() {

    const history = useHistory();

    function gotoCompanies() {
        history.push("/admin/companies");
        console.log("history");
    }

    function gotoDrugs() {
        history.push("/admin/drugs");
    }
    

    const pages = [
        {
            name: 'Companies',
            callback: gotoCompanies
        },
        {
            name: 'Drugs',
            callback: gotoDrugs
        },
        {
            name: 'Logout',
            callback: ()=>{history.push('/')}
        }
    ]
    return (
        <div>
            <NavBar pages={pages}/>
            <CompanyList />
        </div>
    )
}
