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
   $(this).after(setTimeout(hideLoading, 4000));

}


  $("#match-button").click(function() {
    event.preventDefault();
   $("#show-container").fadeOut(500);
   $("#loading-buddy").fadeIn(3500).removeClass('hidden');
   setTimeout(function()
    { window.location = $("#match-button > a").attr('href'); }, 3000);
   //$("#loading-buddy").fadeOut(5000).addClass('hidden');
   //
});

//function start() {$(document).ready(function(){
 // $("#match-button").mouseup(function(){
   // $(this).after(setTimeout(hideLoading, 2000));
  //});
//});
//};
//setTimeout(start, 1000)
