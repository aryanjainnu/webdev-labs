let fontSize = 1.4;

const makeBigger = () => {
   fontSize += 0.1
   setFontSize();
};

const makeSmaller = () => {
   fontSize -= 0.1
   setFontSize();
};

const setFontSize = () => {
   document.querySelector(".content").style.fontSize = `${fontSize}em`
   document.querySelector("h1").style.fontSize = `${fontSize + 0.6}em`
}

document.querySelector("#a1").addEventListener('click', makeBigger);
document.querySelector("#a2").addEventListener('click', makeSmaller);
