function toggleChat() {
  document.getElementById('chatbox').classList.toggle('hidden');
  // $("#chatbox").classList.toggle('hidden');
}

const button = document.getElementById('message');

if (button) {
button.addEventListener("click", toggleChat);
}
// $(document).ready(function(){
//   setTimeout(toggleChat, 1);
// });
