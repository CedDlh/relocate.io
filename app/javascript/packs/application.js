import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker",{
    // enableTime: true,
    dateFormat: "d-m-Y",
    "locale": {"firstDayOfWeek": 1}
}
);

import "bootstrap";
import "./loader";

