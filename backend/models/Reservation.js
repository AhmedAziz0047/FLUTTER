const mongoose = require('mongoose');
const reservationsSchema = new mongoose.Schema({
  country: {type: String, required: true},
  nomclient: {type: String, required: true},
  prenomclient: {type: String, required: true},
  email: {type: String, required: true}
});
module.exports = mongoose.model('Reservation', reservationsSchema);
