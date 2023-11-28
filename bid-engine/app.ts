import express, { Request, Response } from 'express';
import { db } from './knexfile';

const app = express();

// /auctions
app.get('/auctions', async (request: Request, response: Response) => {
  try {
    const auctions = await db.raw(
        'SELECT * FROM auctions'
    );
    response.json(auctions.rows);
  } 
  catch (error) {
    console.error(error);
    response.status(500).json({ message: error });
  }
});

// Show the bids for a given auction.
app.get('/auctions/:id/bids', async (request: Request, response: Response) => {
    try {
      const auctions = await db.raw(
        'SELECT * FROM bids where bids.auction_id = ?', 
        [ request.params.id ] 
      );
      response.json(auctions.rows);
    } 
    catch (error) {
      console.error(error);
      response.status(500).json({ message: error });
    }
  });
  
  
// What the console does (in the background).
app.listen(3000, () => {
  console.log('Server is running on port 3000');
});