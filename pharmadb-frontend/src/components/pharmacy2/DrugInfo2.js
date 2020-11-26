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

export default class DrugInfo2 extends Component {
    
    constructor() {
        super();
        this.state = {
            drugs : []
        };
    }

    componentDidMount () {
        axios.get(`http://localhost:8081/pharmacy1/drugInfo`)
        .then( res => {
            const drugs = res.data;
            this.setState({drugs});
            console.log({drugs});
        }).catch( err => {
            console.log(err);
        });
    }

    search = (searchBy) => {
            const url = `http://localhost:8081/pharmacy1/drugInfo/${searchBy}`;
            
            axios.get(url)
            .then( res => {
                const drugs = res.data;
                this.setState({drugs});
            }).catch( err => {
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
                
               
                <Grid item><SearchBar callback={this.search}/></Grid>
                <Grid item sm={12}  >
                    <TableContainer component={Paper} style={{minWidth: 600}} elevation={8}>
                        <Table>
                            <TableHead>
                                <TableRow>
                                    <TableCell align="center" colSpan={6}>Drug Info</TableCell>
                                </TableRow>
                                <TableRow>
                                    <TableCell>ID</TableCell>
                                    <TableCell>Name</TableCell>
                                    <TableCell>Generic Name</TableCell>
                                    <TableCell>Purpose</TableCell>
                                    <TableCell>Company Name</TableCell>
                                    <TableCell>Company Code</TableCell>
                                  
                                    <TableCell></TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {drugs.map((drug, index) => (
                                    <TableRow key={drug[0]}>
                                        <TableCell>{drug[0]}</TableCell>
                                        <TableCell>{drug[1]}</TableCell>
                                        <TableCell>{drug[2]}</TableCell>
                                        <TableCell>{drug[3]}</TableCell>
                                        <TableCell>{drug[4]}</TableCell>
                                        <TableCell>{drug[5]}</TableCell>
                                       
                                        
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