import React from 'react'
import {useHistory} from 'react-router-dom'
import NavBar from '../components/NavBar';
import Pharm2List from '../components/pharmacy2/Pharm2List'

export default function AdminDrugs() {

    const history = useHistory();

 

    const pages = [
        {
            name: 'Inventory',
            callback: () => {history.push('/pharmacy2/inventory')}
        },
        {
            name: 'Drugs',
            callback: () => {history.push('/pharmacy2/drugs')}
        },
        {
            name: 'Logout',
            callback: ()=>{history.push('/')}
        }
    ]
    return (
        <div>
            <NavBar pages={pages}/>
            <Pharm2List />
        </div>
    )
}
