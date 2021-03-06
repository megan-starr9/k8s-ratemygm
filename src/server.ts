import express, { Request, Response } from 'express';
import session from 'express-session';

/*import {
  submitAuth,
  viewAuth,
  destroyAuth,
  submitRegister,
  viewRegister,
} from '@techofmany/user';*/

const app = express();
const port = 3002;

// Set render engine
app.set( 'view engine', 'twig' );
app.use(session({
  secret: 'test',
}))

app.get('/', (req: Request, res: Response) => {
  res.send('ratemygamemaster.com')
});
/*app.post('/login', submitAuth);
app.use('/login', viewAuth);
app.post('/register', submitRegister);
app.use('/register', viewRegister);
app.get('/logout', destroyAuth);*/

app.listen(port, () => {
  console.log(`Example app listening at on port ${port}`)
})
