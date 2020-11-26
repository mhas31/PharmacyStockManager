import React from 'react'
import LoginOptions from '../components/LoginOptions'
import NavBar from '../components/NavBar'

export default function Login() {
    return (
        <div>
            <NavBar pages={[]} />
            <LoginOptions/>
        </div>
    )
}
