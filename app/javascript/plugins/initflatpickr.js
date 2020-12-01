import flatpickr from "flatpickr";


const initFlatpickr = () => {
  const input = document.querySelector('#booking_date')
  if(input){
    const availabilities = JSON.parse(document.querySelector("#working-days").dataset.workingdays)
    const workingdays = Object.keys(availabilities).map(num => parseInt(num))

    flatpickr(input, {
      minDate: "today",
      dateFormat: "Y-m-d",
      enable: [
        function(date) {
            // return true to disable
            return workingdays.includes(date.getDay());
        }
    ],

    });
  }
  input.onChange(alert("Handler for .change() called."));
}

export { initFlatpickr };



