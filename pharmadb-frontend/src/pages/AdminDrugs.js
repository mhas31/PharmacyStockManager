import React from 'react'
import {useHistory} from 'react-router-dom'
import NavBar from '../components/NavBar';
import DrugsList from '../components/drugs/DrugsList'

export default function AdminDrugs() {

    const history = useHistory();

    const gotoCompanies = () => {
        history.push("/admin/companies");
    }

    const gotoDrugs = () => {
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
            <DrugsList />
        </div>
    )
}
