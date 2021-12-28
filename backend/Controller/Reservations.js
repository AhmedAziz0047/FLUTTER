
const Reservation=require('./../models/Reservation');

exports.getReservations=(req, res)=>{
  Reservation.find()
  .then(Reservation=>res.status(200).json(Reservation))
  .catch(err=>res.status(400).json({error: err.message}))
}
exports.getReservById=(req, res)=>{
  Reservation.findOne({_id: req.params.id})
  .then(reservation=>res.send(reservation))
  .catch(err=>res.status(400).json({error: err.message}))
}
exports.createReservation = (req, res, next) => {
  const reservation = new Reservation({
    ...req.body
  });
  reservation.save()
    .then(() => res.status(201).json({ message: 'Reservation created  !'}))
    .catch(error => res.status(400).json({ error }));
};
exports.deleteReservations=(req, res)=>{
  Reservation.deleteOne({ _id: req.params.id })
  .then(() => res.status(200).json({ message: 'Reservation deleted !'}))
  .catch(error => res.status(400).json({ error }));
}

exports.updateReservations  = (req, res, next) => {
  Reservation.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Reservation updated !'}))
    .catch(error => res.status(400).json({ error }));
};

