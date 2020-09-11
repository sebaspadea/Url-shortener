// Creo un input temporal para poder traerme el valor a copiar al clipboard
const setClipboard = (value) => {
  var tempInput = document.createElement("textarea");
  tempInput.style = "position: absolute; left: -1000px; top: -1000px";
  tempInput.value = value;
  document.body.appendChild(tempInput);
  tempInput.select();
  document.execCommand("copy");
  document.body.removeChild(tempInput);
}

const copyText = () => {

  const copyButton = document.getElementById("copy");
  // Accedo al texto dentro del id para poder copiarlo
  const link = document.getElementById("text-copy").innerText

  if (copyButton) {
    copyButton.addEventListener('click', (e) => {
      e.preventDefault();
      setClipboard(link);
    });
  }
}

export { copyText };