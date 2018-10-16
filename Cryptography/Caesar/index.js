
const plaintext = ' abcdefghijklmnopqrstuvwxyz'
const cyphertext = plaintext.toUpperCase()

const mod = (x, n) => (x % n + n) % n

function getText() {
  var textElem = document.getElementById('text')
  return (textElem != null) ?  textElem.value : ''
}

function getKey() {
  var keyElem = document.getElementById('key')
  return (keyElem != null) ? parseInt(keyElem.value) : NaN
}

function crypt() {
  var text = getText()
  var key = getKey()

  var result = ''

  for (index in text) {
    console.log(mod((plaintext.indexOf(text[index]) + key), (plaintext.length)))
    result += cyphertext[mod((plaintext.indexOf(text[index]) + key), (plaintext.length))]
  }

  document.getElementById('text').value = result
  validateInputs()
}

function decrypt() {
  var text = getText()
  var key = getKey()

  var result = ''

  for (index in text) {
    result += plaintext[mod((cyphertext.indexOf(text[index]) - key), (cyphertext.length))]
  }

  document.getElementById('text').value = result
  validateInputs()
}

function validateInputs() {
  deactivateButtons()

  text = getText()
  key = getKey()

  var containsPlainChars = false
  var containsCypherChars = false
  var containsIllegalChars = false

  for (index in text) {
    if (plaintext.includes(text[index])) {
      containsPlainChars = true
    }else if (cyphertext.includes(text[index])) {
      containsCypherChars = true
    }else {
      containsIllegalChars = true
    }
  }

  if (text === '') {
    setAlert('Text is empty!')
  }else if (isNaN(key)) {
    setAlert('Key is not set!')
  } else if (containsIllegalChars) {
      setAlert('Text contains illegal characters!')
    } else if (containsPlainChars && containsCypherChars) {
        setAlert('Do not mix plaintext and cyphertext!')
      }else if (containsPlainChars) {
        hideAlert()
        activateCryptButton()
      }else {
        hideAlert()
        activateDecryptButton()
      }
}

function activateCryptButton() {
  document.getElementById('crypt-btn').classList.remove('disabled');
}

function deactivateCryptButton() {
  document.getElementById('crypt-btn').classList.add('disabled');
}

function activateDecryptButton() {
  document.getElementById('decrypt-btn').classList.remove('disabled');
}

function deactivateDecryptButton() {
  document.getElementById('decrypt-btn').classList.add('disabled');
}

function deactivateButtons() {
  deactivateCryptButton()
  deactivateDecryptButton()
}

function setAlert(text) {
  document.getElementById('danger-alert').style.display = 'block'
  document.getElementById('danger-alert').innerHTML = text
}

function hideAlert() {
  document.getElementById('danger-alert').innerHTML = ''
  document.getElementById('danger-alert').style.display = 'none'
}

validateInputs()
