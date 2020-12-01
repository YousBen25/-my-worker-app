import flatpickr from "flatpickr";



const injectThings = (time) => {
  const input = document.querySelector('#available')
  input.insertAdjacentHTML("afterbegin", `<p>${time}</p>`)
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
        debugger
        const times = selectedDates[0].getDay()
        availabilities[`${times}`].forEach((time) => {
          injectThings(time);
        })
      }
    });
  }
}

export { initFlatpickr };



