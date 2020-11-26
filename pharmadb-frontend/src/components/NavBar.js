import React from 'react';
import {AppBar, Toolbar, Typography, Button} from '@material-ui/core';
import {makeStyles} from '@material-ui/core/styles'

const useStyles = makeStyles((theme) => ({
  container: {
      display: "flex"
  },
  appbar: {
    zIndex: 1400,
    width: '100%'
  },
  Grow: {
      flexGrow: 1
  }

}));

const NavBar = (props) => {
    
    const classes = useStyles();
    const pages = props.pages;

    return(
        <div>
            <AppBar className={classes.appbar} position="fixed"  >
                
                <Toolbar >
                    
                    <Typography variant="h5" color="inherit" align='left' className={classes.Grow} edge='start' >
                        Pharmacy Stock Manager
                    </Typography>
                    {pages.map( page => {
                        const callback = page.callback;
                        return (
                            <Typography>
                                <Button variant='text' color='inherit' onClick={page.callback} >
                                    {page.name}
                                </Button>
                            </Typography>
                        )
                    })}
                    
                </Toolbar>
            </AppBar>
            <Toolbar/>
        </div>
    );
}
export default NavBar;