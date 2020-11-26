import React, { Component } from 'react'
import {
    Divider,
    Drawer,
    List, 
    ListItem, 
    ListItemText,
    makeStyles,
    Paper,
    Toolbar
} from '@material-ui/core'

const useStyles = makeStyles((theme) => ({
    drawer: {
        width: '150px'
    },
    container: {
        display: 'flex'
    },
    drawerPaper: {
        width: '150px',
        //zIndex: 1300
    }
}));

export function MuiDrawer()  {   
        
    const classes = useStyles();

    return (
        <div >
            <Drawer container={Paper} 
            className={classes.drawer} 
            variant='permanent' 
            classes={{
                paper: classes.drawerPaper
            }}>
                <Toolbar/>
                <List>
                    {['Drugs', 'Companies'].map( (text) => (
                        <ListItem button key={text}>
                            <ListItemText>{text}</ListItemText>
                        </ListItem>
                    ))}
                </List>
            </Drawer>
        </div>
    )
    
}

export default MuiDrawer
