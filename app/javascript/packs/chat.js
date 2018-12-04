function toggleChat() {
  document.getElementById('chatbox').classList.toggle('hidden');
}

function closeChat() {
  document.getElementById('chatbox').classList.add('hidden');
}

const button = document.getElementById('message');

if (button) {
button.addEventListener("click", toggleChat);
}
// $(document).ready(function(){
//   setTimeout(toggleChat, 1);
// });
const btnClose = document.getElementById('close-btn');
btnClose.addEventListener("click",closeChat);

const msgOpen = document.querySelectorAll('#open-message');

if (msgOpen) {
  for (var i = 0; i < msgOpen.length; i++) {
    msgOpen[i].addEventListener("click", toggleChat())
    event.preventDefault();
  }
}
