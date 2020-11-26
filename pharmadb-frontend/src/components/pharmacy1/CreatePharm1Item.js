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

function CreatePharm1Item(props) {

    const [id, setid] = useState('');
    const [brand_name, setbrand_name] = useState('');
    const [quantity, setquantity] = useState('');
    const [price, setprice] = useState(0)
    

    const handleChange = (e) => {
        const field = e.target.id;
        const value = e.target.value;
        if(field == 'id'){
           setid(value);
        }
        else if(field == 'brand_name'){
            setbrand_name(value);
        }
        else if(field == 'quantity'){
            setquantity(value);
        }
        else if(field == 'price'){
           setprice(value);
        }
       
    }

    const handleClick = () => {
        props.callback(id, brand_name, quantity, price);
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
                    Add New Item
                </Typography>
                
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='id'
                label="ID"
                className={classes.textField}
                onChange={handleChange}
                />
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
                id='quantity'
                className={classes.textField}
                label="quantity"
                onChange={handleChange}
                />
            </Grid>
            <Grid item sm={6}>
                <TextField
                id='Price'
                label="Price"
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

export default CreatePharm1Item;
