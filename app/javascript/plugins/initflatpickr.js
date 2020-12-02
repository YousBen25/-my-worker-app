import flatpickr from "flatpickr";



const injectThings = (availabilities, times) => {
  const list = availabilities[`${times}`].map((time) =>`<li>Availability: ${time}</li>` )
  const input = document.querySelector('#availabilities')
  input.innerHTML = list.join("")
}

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
      onChange: (selectedDates) => {
        const times = selectedDates[0].getDay()
        injectThings(availabilities, times)
      }
    });
  }
}

export { initFlatpickr };



