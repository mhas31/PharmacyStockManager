import React, {useState} from 'react'
import {
    IconButton,
    Paper,
    makeStyles,
    Grid, 
    TextField,
    Typography,
    Divider

} from '@material-ui/core'
import AddIcon from '@material-ui/icons/Add'

const useStyles = makeStyles({
    root: {
        width: 600,
        height: 250
    },
    textField: {
        width: 250,
        margin: 10
    }
})

function CreateDrugForm(props) {

    const [company_name, setcompany_name] = useState('');
    const [company_code, setcompany_code] = useState(0);

    const handleChange = (e) => {
        const field = e.target.id;
        const value = e.target.value;
        if(field == 'company_name'){
           setcompany_name(value);
        }
        else if(field == 'company_code'){
           setcompany_code(value);
        }
       
    }

    const handleClick = () => {
        props.callback(company_name, company_code);
    }

    const classes = useStyles();
    return (
        <Grid container 
            className={classes.root} 
            component={Paper}
            justify='flex-start'
            elevation={8}
            >
            <Grid item sm={12}>
                <Typography align='center' color='primary' >
                    New Company Form
                </Typography>
                
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='company_name'
                label="Company name"
                className={classes.textField}
                onChange={handleChange}
                />
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='company_code'
                label="company code"
                className={classes.textField}
                onChange={handleChange}
                />
            </Grid>
            <Grid item sm={6}>
               <IconButton onClick={handleClick} color='primary' >
                   <AddIcon />
               </IconButton>
            </Grid>
        </Grid>
    )
}

export default CreateDrugForm
