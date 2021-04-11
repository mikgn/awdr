// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// hide checkout button by checking out
document.addEventListener("DOMContentLoaded", function(event) {
  let form  = document.getElementsByClassName('order-form').length > 0;
  let button = document.getElementsByClassName("checkout-btn").item(0);

  if (form) {
    button.hidden = true;
  } else {
    button.hidden = false;
  };
});
