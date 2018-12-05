import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('reqBtn');
  const date = swalButton.dataset.date;
  console.log(date);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: `Confirm request to  ${date}?`,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Cancel',
        // timer: 5000,
        confirmButtonText: 'Yes'
        }).then((result) => {
          if (result.value) {
            swal(
              'Deleted!',
              'Your file has been deleted.',
              'success'
            )
          }
        })
      // swal({
      //   title: "Are you sure you want to proceed?",
      //   showCloseButton: true,
      //   showCancelButton: true,
      //   confirmButtonText: 'Yes'
      //   icon: "success"
      document.querySelector('.swal-button.swal-button--confirm').addEventListener('click', function(){
        document.getElementById('sweet-alert').click()
      })
      });
    };

  }


bindSweetAlertButtonDemo();

// export { bindSweetAlertButtonDemo };
