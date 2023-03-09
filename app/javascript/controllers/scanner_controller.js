import { Controller } from "@hotwired/stimulus"
import {Html5QrcodeScanner} from "html5-qrcode"

export default class extends Controller {
  connect() {
    console.log("Hello World scanner !")
    this.html5QrcodeScanner = new Html5QrcodeScanner(
      "reader",
      { fps: 10, qrbox: {width: 250, height: 250} }
    );
    this.html5QrcodeScanner.render(this.onScanSuccess, this.onScanFailure);
  }

  onScanSuccess(decodedText, decodedResult) {
    // handle the scanned code as you like, for example:
    console.log(`Code matched = ${decodedText}`, decodedResult);
    window.location = decodedText;
  }

  onScanFailure(error) {
    // handle scan failure, usually better to ignore and keep scanning.
    // for example:
    console.warn(`Code scan error = ${error}`);
  }

}
