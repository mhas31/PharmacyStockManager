import React from 'react'
import {
    makeStyles,
    Typography,
    Card,
    CardActionArea,
    Divider
} from '@material-ui/core'
import { Height } from '@material-ui/icons';

const useStyles = makeStyles({
    root: {
        maxWidth: 250,
        height: 200,
    },
    title: {
        fontSize: 14
    },
    card: {
        maxWidth: 250,
        height: 200,
        padding: 5  
    }
});

export default function LoginCard(props) {
    const classes = useStyles();
    const loginAs = props.name;
    const description = props.description;
    const handleClick = props.callback;

    return (
        <Card className={classes.root} raised>
            <CardActionArea onClick={handleClick} className={classes.card}>
                <Typography className={classes.title} color='textSecondary'>
                    Login as
                </Typography>
                <Typography variant="h5" component="h2" >
                    {loginAs}
                </Typography>
                <br/>
                <Divider/>
                <br/>
                <Typography variant="body2" component="p">
                    {description}
                </Typography>
            </CardActionArea>
        </Card>
    );
}
