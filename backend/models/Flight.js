const mongoose = require('mongoose');
const FlightsSchema = new mongoose.Schema({
  country: {type: String, required: true},
  date_aller: {type: String, required: true},
  date_retour: {type: String, required: true},
  prix: {type: Number, required: true},
  places_left: {type: Number, required: true},
  photo: {type: String, required: true},
});
module.exports = mongoose.model('Flight', FlightsSchema);
