// const btnSubmitIndex = document.querySelector(".btn-submit-index")
// const loaderContainer = document.querySelector(".loader-container")

// btnSubmitIndex.addEventListener("click",function(){
//   loaderContainer.style.display = "block";
//   loaderContainer.style.opacity = 1;
// })


function hideLoading() {
  // const loader = document.getElementById("loading-buddy");
  // loader.classList.add('disabled');
  // const showContainer = document.getElementById("show-container");
  // showContainer.classList.remove('hidden');
  // showContainer.classList.add('active');

  $("#loading-buddy").fadeOut("slow");
  $("#show-container").removeClass('hidden');
}

$(document).ready(function(){
  setTimeout(hideLoading, 4000);
});
