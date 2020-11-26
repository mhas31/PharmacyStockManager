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

    const [brand_name, setbrand_name] = useState('');
    const [generic_name, setgeneric_name] = useState('');
    const [purpose, setpurpose] = useState('');
    const [company_code, setcompany_code] = useState(0);

    const handleChange = (e) => {
        const field = e.target.id;
        const value = e.target.value;
        if(field == 'brand_name'){
           setbrand_name(value);
        }
        else if(field == 'generic_name'){
            setgeneric_name(value);
        }
        else if(field == 'purpose'){
            setpurpose(value);
        }
        else if(field == 'company_code'){
           setcompany_code(value);
        }
       
    }

    const handleClick = () => {
        props.callback(brand_name, generic_name, purpose, company_code);
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
                    Add New Drug
                </Typography>
                
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='brand_name'
                label="Name"
                className={classes.textField}
                onChange={handleChange}
                />
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='generic_name'
                label="Generic Name"
                className={classes.textField}
                onChange={handleChange}
                />
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='purpose'
                className={classes.textField}
                label="Purpose"
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
