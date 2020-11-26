import React, {Component} from 'react'
import {
    Grid, 
    TableContainer,
    TableBody,
    TableCell,
    TableHead, 
    Table,
    TableRow,
    Paper,
    Toolbar,
    IconButton
    } 
from '@material-ui/core'
import axios from 'axios'
import SearchBar from '../SearchBar';
import CreatePharm1Item from './CreatePharm1Item';
import DeleteIcon from '@material-ui/icons/Delete'
import UpdateDialogForm from './UpdateDialogForm';

export default class Pharm1List extends Component {
    
    constructor() {
        super();
        this.state = {
            drugs : []
        };
    }

    componentDidMount () {
        axios.get(`http://localhost:8081/pharmacy1/items`)
        .then( res => {
            const drugs = res.data;
            this.setState({drugs});
            //console.log({drugs});
        }).catch( err => {
            console.log(err);
        });
    }

    search = (searchBy) => {
            const url = `http://localhost:8081/pharmacy1/items/${searchBy}`;
            
            axios.get(url)
            .then( res => {
                const drugs = res.data;
                this.setState({drugs});
            }).catch( err => {
                console.log(err);
            });
            
    }

    create = (id, brand_name, quantity, price) => {
        // if(id === ''){
        //     alert("ID can not be empty");
        //     return;
        // }
        const oldNames = this.state.drugs.map(drug => drug.id);
        if(oldNames.includes(id)){
            alert("id already exists");
            return;
        }
        const drug = {
            id: id,
            brand_name: brand_name,
            quantity: quantity,
            price: price,
           
        }

        axios.post(`http://localhost:8081/pharmacy1/items`, drug)
        .then(res => {
            this.reset();
        }).catch(err => {
            console.log(err);
        })

    }

    reset = () => {
        axios.get(`http://localhost:8081/pharmacy1/items`)
        .then( res => {
            const drugs = res.data;
            this.setState({drugs});
            
        }).catch( err => {
            console.log(err);
        });
    }
   
    delete = (e) => {
        let id = e.currentTarget.id;
        const url = `http://localhost:8081/pharmacy1/items`;

        const drug = this.state.drugs.filter(d => (d.id == id))[0];

        axios.delete(url, {data: drug})
        .then( res => {
        
           this.reset();
        }).catch(err => {
            console.log(err);
        }); 

    }

    render() {
        const {drugs} = this.state;
        return (
           
            <Grid container
                direction='column'
                alignItems='center'
                component={Paper}
                justify='space-around'
                spacing={3}>
                <Grid item xs={12}><Toolbar/></Grid>
                
                <Grid conatainer>
                    <Grid item><CreatePharm1Item callback={this.create}/></Grid>
                    
                </Grid>
                <Grid item><SearchBar callback={this.search}/></Grid>
                <Grid item sm={12}  >
                    <TableContainer component={Paper} style={{minWidth: 600}} elevation={8}>
                        <Table>
                            <TableHead>
                                <TableRow>
                                    <TableCell align="center" colSpan={6}>Pharmacy 1 Inventory</TableCell>
                                </TableRow>
                                <TableRow>
                                    <TableCell>ID</TableCell>
                                    <TableCell>Name</TableCell>
                                    <TableCell>Quantity</TableCell>
                                    <TableCell>Price</TableCell>
                                  
                                    <TableCell>Delete</TableCell>
                                    <TableCell>Update</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {drugs.map((drug, index) => (
                                    <TableRow key={drug.id}>
                                        <TableCell>{drug.id}</TableCell>
                                        <TableCell>{drug.brand_name}</TableCell>
                                        <TableCell>{drug.quantity}</TableCell>
                                        <TableCell>{drug.price}</TableCell>
                                       
                                        <TableCell>
                                            <IconButton id={drug.id} onClick={this.delete}>
                                                <DeleteIcon color='error'  />
                                            </IconButton>
                                            
                                        </TableCell>
                                        <TableCell>
                                            <UpdateDialogForm drug={drug} callback={this.reset}/>
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                </Grid>
            </Grid>
          
        );
    }

}
            // <ul>
            //     {this.state.drugs.map(drug => <li key={drug.id}>{drug.id}</li>)}
            // </ul>