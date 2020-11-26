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
import CreateCompanyForm from './createCompanyForm';
import DeleteIcon from '@material-ui/icons/Delete'

export default class CompanyList extends Component {
    
    constructor() {
        super();
        this.state = {
            companies : []
        };
    }

    componentDidMount () {
        axios.get(`http://localhost:8081/admin/companies`)
        .then( res => {
            const companies = res.data;
            this.setState({companies});
            //console.log({companies});
        }).catch( err => {
            console.log(err);
        });
    }

    search = (searchBy) => {
            const url = `http://localhost:8081/admin/companies/${searchBy}`;
            //console.log(searchBy);
            axios.get(url)
            .then( res => {
                const companies = res.data;
                this.setState({companies});
            }).catch( err => {
                console.log(err);
            });
            
    }

    create = (company_name, company_code) => {
        if(company_name === ''){
            alert("Name can not be empty");
            return;
        }
        if(company_code === ''){
            alert("company code can not be emoty");
            return;
        }
        const oldNames = this.state.companies.map(company => company.company_name);
        const oldCodes = this.state.companies.map(company => company.company_code);
        
        if(oldNames.includes(company_name)){
            alert("Name already exists");
            return;
        }
        if(oldCodes.includes(company_code)){
            alert("Code already exists");
            return;
        }
        const company = {
            company_name: company_name,
            company_code: company_code
        }

        axios.post(`http://localhost:8081/admin/companies`, company)
        .then(res => {
            this.reset();
        }).catch(err => {
            console.log(err);
        })

    }

    reset = () => {
        axios.get(`http://localhost:8081/admin/companies`)
        .then( res => {
            const companies = res.data;
            this.setState({companies});
            
        }).catch( err => {
            console.log(err);
        });
    }
   
    delete = (e) => {
        let id = e.currentTarget.id;
        const url = `http://localhost:8081/admin/companies`;

        const comp = this.state.companies.filter(d => (d.company_code == id))[0];
        //console.log(id);

        axios.delete(url, {data: comp})
        .then( res => {
        
           this.reset();
        }).catch(err => {
            console.log(err);
        }); 

    }

    render() {
        const {companies} = this.state;
        return (
           
            <Grid container
                direction='column'
                alignItems='center'
                component={Paper}
                justify='space-around'
                spacing={3}>
                <Grid item xs={12}><Toolbar/></Grid>
                
                <Grid conatainer>
                    <Grid item><CreateCompanyForm callback={this.create}/></Grid>
                    
                </Grid>
                <Grid item><SearchBar callback={this.search}/></Grid>
                <Grid item sm={12}  >
                    <TableContainer component={Paper} style={{minWidth: 600}} elevation={8} >
                        <Table>
                            <TableHead>
                                <TableRow>
                                    <TableCell align="center" colSpan={5}>Companies</TableCell>
                                </TableRow>
                                <TableRow>
                                    <TableCell>Name</TableCell>
                                    <TableCell>Company Code</TableCell>
                                    <TableCell></TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {companies.map((company, index) => (
                                    <TableRow key={company.company_code}>
                                        <TableCell>{company.company_name}</TableCell>
                                        <TableCell>{company.company_code}</TableCell>
                                        <TableCell>
                                            <IconButton id={company.company_code} onClick={this.delete}>
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
            //     {this.state.companies.map(company => <li key={company.company_name}>{company.company_name}</li>)}
            // </ul>