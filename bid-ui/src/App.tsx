import { useState, useEffect } from 'react'
import './App.css'

function App() {
  const [auctions, setAuctions] = useState<any[]>([])
  const [selectedAuction, setSelectedAuction] = useState<number | null>(null)
  const [bids, setBids] = useState<any[]>([])

  useEffect(() => {
    getAuctions()
  }, [])

  const getAuctions = async () => {
    try {
      const response = await fetch('http://localhost:3001/auctions')
      const data = await response.json()
      setAuctions(data)
    } catch (error) {
      console.error('Error fetching auctions:', error)
    }
  }

  const getBids = async (auctionId: number) => {
    try {
      const response = await fetch(`http://localhost:3001/auctions/${auctionId}/bids`)
      const data = await response.json()
      setBids(data)
    } catch (error) {
      console.error(`Error fetching bids for auction ${auctionId}:`, error)
    }
  }

  const auctionClick = (auctionId: number) => {
    setSelectedAuction(auctionId)   // set which one is active.
    getBids(auctionId)  // get those darned bids!
  }

  const asDollar = (amount: number) => {
    return '$' + Number(amount).toFixed(2);
  }

  return (
    <>
      <div className="main">
        <h1>Auctions</h1>

        {auctions.length > 0 ? (
          <ul className='semantic-list'>
            {auctions.map((auction: any) => (

              <li key={auction.id} onClick={() => auctionClick(auction.id)} className="auctionListItem">
                <div className="auctionImage"><img src={auction.image}/></div>
                <div className="auctionTitle">{auction.description}</div>
                <div className="startPrice">{asDollar(auction.start_price)}</div>

                {selectedAuction === auction.id && (
                  <ul>
                    {bids.map((bid: any) => (
                      <li key={bid.id} className="bidListItem semantic-list">{asDollar(bid.amount)}, </li>
                    ))}
                  </ul>
                )}

              </li>
            ))}

          </ul>
        ) : (
          <p>No auctions available</p>
        )}
      </div>
    </>
  )
}

export default App
