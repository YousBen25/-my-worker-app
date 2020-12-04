// app/javascript/plugins/init_autocomplete.js
import places from 'places.js'

const initAutocomplete = () => {
  const addressInputSearch = document.getElementById("booking-address-home");
  const addressInputWorker = document.getElementById("worker_profile_address");
  const addressInputBooking = document.getElementById("booking_address");
  
  if (addressInputSearch ) {
    places({ container: addressInputSearch  });
  }

  if (addressInputWorker) {
    places({ container: addressInputWorker });
  }

  if (addressInputBooking) {
    places({ container: addressInputBooking });
  }
};


export { initAutocomplete };

