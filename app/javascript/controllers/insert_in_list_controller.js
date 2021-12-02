import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['items2', 'form2'];
  send(event) {
    event.preventDefault();
    console.log('whatever2');

    fetch(this.form2Target.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.form2Target)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.items2Target.insertAdjacentHTML('beforeend', data.inserted_item);
        }
        this.form2Target.outerHTML = data.form;
      });
      }
  }
