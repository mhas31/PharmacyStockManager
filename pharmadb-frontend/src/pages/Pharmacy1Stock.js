import React from 'react'
import {useHistory} from 'react-router-dom'
import NavBar from '../components/NavBar';
import Pharm1List from '../components/pharmacy1/Pharm1List'

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
            <Pharm1List />
        </div>
    )
}
