import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'url' ];

  connect() {
  }

  copy() {
    const setClipboard = (value) => {
      var tempInput = document.createElement("textarea");
      tempInput.style = "position: absolute; left: -1000px; top: -1000px";
      tempInput.value = value;
      document.body.appendChild(tempInput);
      tempInput.select();
      document.execCommand("copy");
      document.body.removeChild(tempInput);
    }
    let link = this.urlTarget.innerText
    console.log(link)
    setClipboard(link);
  }
}