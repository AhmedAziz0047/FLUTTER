const express = require('express');
const router = express.Router();
const {getReservById,getReservations,deleteReservations,createReservation,updateReservations}=require('./../Controller/Reservations')

router.get('/api/getReservations',getReservations);
router.post('/api/addReservations',createReservation);
router.get('/api/getReservbyid/:id',getReservById);
router.delete('/api/deleteReservations/:id',deleteReservations);
router.put('/api/editReservations/:id', updateReservations);
// router.delete('/dr:id',deleteReservations);



module.exports=router;
