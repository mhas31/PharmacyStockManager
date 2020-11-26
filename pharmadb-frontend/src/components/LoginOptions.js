import React from 'react'
import {
    Grid,
    Paper,
    makeStyles

} from '@material-ui/core'
import LoginCard from './LoginCard'
import {useHistory} from 'react-router-dom';


const useStyle = makeStyles({
    cont: {
        margin: 30,
        padding: 30,
    }
});

export default function LoginOptions() {

    const classes = useStyle();
    const history = useHistory();
    const adminDescription = 'login as admin and get priviliges to view all drugs and companies, create new drugs and companies, as well as delete existing drugs and companies from the database';
    const pharmacy1Desc = 'login as pharmacy1 and get priviliges to creat, read, update, and delete pharmacy 1\'s medicine stock. you can also view details about each drug';
    const pharmacy2Desc = 'login as pharmacy1 and get priviliges to creat, read, update, and delete pharmacy 2\'s medicine stock. you can also view details about each drug';
    //callbacks for each card
    const adminLogin = () => {
        history.push("/admin/drugs");
    }
    const pharmacy1Login = () => {
        history.push("/pharmacy1/inventory");
    }
    const pharmacy2Login = () => {
        history.push("/pharmacy2/inventory");
    }

    return (
        <Grid container 
            className={classes.cont}
            direction='row'
            spacing={2}
            justify="center"
            alignContent="space-around"
            alignItems="space-around"
            >

            <Grid item xs={12} md={4} >
                <LoginCard name='Admin' description={adminDescription} callback={adminLogin} />
            </Grid>

            <Grid item xs={12} md={4} >
                <LoginCard name='Pharmacy1' description={pharmacy1Desc} callback={pharmacy1Login} />
            </Grid>
            
            <Grid item xs={12} md={4} >
                <LoginCard name='Pharmacy2' description={pharmacy2Desc} callback={pharmacy2Login} />
            </Grid>

        </Grid>
    )
}
