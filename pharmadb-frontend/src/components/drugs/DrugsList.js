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
import CreateDrugForm from './CreateDrugForm';
import DeleteIcon from '@material-ui/icons/Delete'

export default class DrugsList extends Component {
    
    constructor() {
        super();
        this.state = {
            drugs : []
        };
    }

    componentDidMount () {
        axios.get(`http://localhost:8081/admin/drugs`)
        .then( res => {
            const drugs = res.data;
            this.setState({drugs});
            //console.log({drugs});
        }).catch( err => {
            console.log(err);
        });
    }

    search = (searchBy) => {
            const url = `http://localhost:8081/admin/drugs/${searchBy}`;
            
            axios.get(url)
            .then( res => {
                const drugs = res.data;
                this.setState({drugs});
            }).catch( err => {
                console.log(err);
            });
            
    }

    create = (brand_name, generic_name, purpose, company_code) => {
        if(brand_name === ''){
            alert("Name can not be empty");
            return;
        }
        const oldNames = this.state.drugs.map(drug => drug.brand_name);
        if(oldNames.includes(brand_name)){
            alert("Name already exists");
            return;
        }
        const drug = {
            brand_name: brand_name,
            generic_name: generic_name,
            purpose: purpose,
            company_code: company_code
        }

        axios.post(`http://localhost:8081/admin/drugs`, drug)
        .then(res => {
            this.reset();
        }).catch(err => {
            console.log(err);
        })

    }

    reset = () => {
        axios.get(`http://localhost:8081/admin/drugs`)
        .then( res => {
            const drugs = res.data;
            this.setState({drugs});
            
        }).catch( err => {
            console.log(err);
        });
    }
   
    delete = (e) => {
        let id = e.currentTarget.id;
        const url = `http://localhost:8081/admin/drugs`;

        const drug = this.state.drugs.filter(d => (d.brand_name === id))[0];

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
                spacing={3}
                >
                <Grid item xs={12}><Toolbar/></Grid>
                
                <Grid conatainer>
                    <Grid item><CreateDrugForm callback={this.create}/></Grid>
                    
                </Grid>
                <Grid item><SearchBar callback={this.search}/></Grid>
                <Grid item sm={12}  >
                    <TableContainer component={Paper} style={{minWidth: 600}} elevation={8} >
                
                        <Table>
                            <TableHead>
                                <TableRow>
                                    <TableCell align="center" colSpan={5}>Drugs Data</TableCell>
                                </TableRow>
                                <TableRow>
                                    <TableCell>Name</TableCell>
                                    <TableCell>Generic Name</TableCell>
                                    <TableCell>Purpose</TableCell>
                                    <TableCell>Company Code</TableCell>
                                    <TableCell></TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {drugs.map((drug, index) => (
                                    <TableRow key={drug.brand_name}>
                                        <TableCell>{drug.brand_name}</TableCell>
                                        <TableCell>{drug.generic_name}</TableCell>
                                        <TableCell>{drug.purpose}</TableCell>
                                        <TableCell>{drug.company_code}</TableCell>
                                        <TableCell>
                                            <IconButton id={drug.brand_name} onClick={this.delete}>
                                                <DeleteIcon color='error'  />
                                            </IconButton>
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
            //     {this.state.drugs.map(drug => <li key={drug.brand_name}>{drug.brand_name}</li>)}
            // </ul>