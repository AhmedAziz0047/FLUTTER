const express = require('express');
const router = express.Router();
const {getFlightByCountry,getFlightById,getFlights,updateFlight,createFlight,deleteFlight}=require('./../Controller/Flights')



router.get('/api/getFlights',getFlights);
router.get('/api/getFlightbyid/:id',getFlightById);

router.post('/api/addFlight',createFlight);
router.delete('/api/deleteFlight/:id',deleteFlight);
router.put('/api/editFlight/:id', updateFlight);
router.get('/api/getFlightByCountryAndDate/:country',getFlightByCountry);


module.exports=router;
