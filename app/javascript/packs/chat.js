function toggleChat() {
  document.getElementById('chatbox').classList.toggle('hidden');
  // $("#chatbox").classList.toggle('hidden');
}

const button = document.getElementById('message');
button.addEventListener("click", toggleChat);
// $(document).ready(function(){
//   setTimeout(toggleChat, 1);
// });