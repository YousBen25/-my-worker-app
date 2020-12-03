// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById("booking-address-home");
  const addressInputWorker = document.getElementById("worker_profile_address");
  if (addressInput) {
    places({ container: addressInput });
  }

  if (addressInputWorker) {
    places({ container: addressInputWorker });
  }
};

export { initAutocomplete };