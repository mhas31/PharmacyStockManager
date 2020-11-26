import React, {useState} from 'react'
import {
    Dialog,
    DialogActions,
    DialogContent,
    DialogTitle, 
    TextField, 
    IconButton,
    Grid
} from '@material-ui/core'
import UpdateIcon from '@material-ui/icons/Update'
import Axios from 'axios';




export default function UpdateDialogForm2(props) {

    const [open, setOpen] = useState(false);
    const [qty, setQty] = useState(props.drug.quantity);
    const [price, setPrice] = useState(props.drug.price);

    const handleQty = (e) => {
        setQty(e.target.value);
    }

    const handlePrice = (e) => {
        setPrice(e.target.value);
    }

    const update = (e) => {
        const drug = props.drug;

        //update teh drug object
        drug.quantity = qty;
        drug.price = price;

        //send put request
        Axios.put("http://localhost:8081/pharmacy2/items", drug)
        .then(res => {
            props.callback();
        }).catch(err => {
            console.log(err);
        })

        setOpen(false);
        props.callback();
    }

    const close = (e) => {
        setQty(0);
        setPrice(0);
        setOpen(false);
    }

    const launch = (e) => { 
        setOpen(true);
    }

    return (
        <div>
            <IconButton>
                <UpdateIcon color="primary" onClick={launch}/>
            </IconButton>
            <Dialog open={open} onBackdropClick={close}>
                <DialogTitle>Update Item</DialogTitle>
                <DialogContent>
                    <Grid container spacing = {2}>
                    <Grid item sm={5}>
                            <TextField 
                                id="Quantity"
                                label="Set Quantity"
                                defaultValue={props.drug.quantity}
                                onChange={handleQty}
                            />
                        </Grid> 
                        <Grid item sm={5}>
                            <TextField 
                                id="Price"
                                label="Set Price"
                                defaultValue={props.drug.price}
                                onChange={handlePrice}
                            />
                        </Grid> 
                    </Grid>
                </DialogContent>
                <DialogActions>
                    <IconButton onClick={update}>
                        <UpdateIcon color="primary"/>
                    </IconButton>
                </DialogActions>
            </Dialog>
        </div>
    )
}
