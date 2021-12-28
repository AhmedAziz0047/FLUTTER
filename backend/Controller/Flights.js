const Flight=require('./../models/Flight');

exports.getFlights=(req, res)=>{
  Flight.find()
  .then(flight=>res.status(200).send(flight))
  .catch(err=>res.status(400).json({error: err.message}))
}

exports.getFlightById=(req, res)=>{
  Flight.findOne({_id: req.params.id})
  .then(flight=>res.send(flight))
  .catch(err=>res.status(400).json({error: err.message}))
}
exports.getFlightByCountry=(req, res)=>{
  Flight.findOne({_country: req.params.country})
  .then(flight=>res.send(flight))
  .catch(err=>res.status(400).json({error: err.message}))
}

exports.createFlight = (req, res, next) => {
  const flight = new Flight({
    ...req.body
  });
  flight.save()
    .then(() => res.status(201).json({ message: 'Flight created  !'}))
    .catch(error => res.status(400).json({ error }));
};
exports.deleteFlight=(req, res)=>{
  Flight.deleteOne({ _id: req.params.id })
  .then(() => res.status(200).json({ message: 'Flight deleted !'}))
  .catch(error => res.status(400).json({ error }));
}

exports.updateFlight  = (req, res, next) => {
  Flight.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Flight updated !'}))
    .catch(error => res.status(400).json({ error }));
};

