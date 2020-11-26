import React from 'react'
import {useHistory} from 'react-router-dom'
import NavBar from '../components/NavBar';
import DrugInfo1 from '../components/pharmacy1/DrugInfo1'

export default function AdminDrugs() {

    const history = useHistory();

 

    const pages = [
        {
            name: 'Inventory',
            callback: () => {history.push('/pharmacy1/inventory')}
        },
        {
            name: 'Drugs',
            callback: () => {history.push('/pharmacy1/drugs')}
        },
        {
            name: 'Logout',
            callback: ()=>{history.push('/')}
        }
    ]
    return (
        <div>
            <NavBar pages={pages}/>
            <DrugInfo1 />
        </div>
    )
}
