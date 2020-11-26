import React, { useState } from 'react'
import {
    IconButton,
    Paper,
    makeStyles,
    InputBase,
    Divider 

} from '@material-ui/core'
import SearchIcon from '@material-ui/icons/Search'

const useStyles = makeStyles((theme) => ({
    root: {
      padding: '2px 4px',
      display: 'flex',
      alignItems: 'center',
      width: 600,
    },
    input: {
      marginLeft: theme.spacing(1),
      flex: 1,
    },
    iconButton: {
      padding: 10,
    },
    divider: {
      height: 28,
      margin: 4,
    },
  }));

function SearchBar(props) {
    const classes = useStyles();
     const [searchBy, setSearchBy] = useState('');

    const handleClick = () => {
        //this.props.search();
        props.callback(searchBy);
        //console.log(1);
    }

    const handleChange = (e) => {
        setSearchBy(e.target.value);
        
    }

    const keyPress = (e) => {
        if(e.keyCode == 13){
            handleClick();
        }
    }

    return (
        <Paper component="form" className={classes.root} elevation={8}>
          
          <InputBase
            className={classes.input}
            placeholder="Search for drugs by name or purpose"
            onChange={handleChange}
            onKeyDown={keyPress}
          />
          <Divider className={classes.divider} orientation="vertical" />
          <IconButton  className={classes.iconButton} aria-label="search" onClick={handleClick}>
            <SearchIcon color='primary' />
          </IconButton>
          
        </Paper>
      );
}

export default SearchBar
