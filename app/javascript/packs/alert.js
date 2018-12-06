import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('reqBtn');
  const date = swalButton.dataset.date;
  const name = swalButton.dataset.name;
  console.log(date);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: `Confirm you want ${name} to assist you on ${date} ?`,
        // icon: 'info',
        content: {
          element: "input",
          attributes: {
            placeholder: `Add a nice description and offer ${name} a little incentive to help you out...`,
            icon: "message",
          },
        },
        buttons: {
          cancel: true,
          confirm: "Accept",
        },
        // confirmButtonColor: '#3085d6',
        // cancelButtonColor: '#d33',
        // cancelButtonText: 'Cancel',
        //cancelButtonText: '<i class="fa fa-thumbs-down"></i>',
        confirmButtonText: 'Yes'
        })
        document.querySelector('.swal-button.swal-button--confirm').addEventListener('click', function(){
        document.getElementById('sweet-alert').click()
      })
      });
    };

  }


bindSweetAlertButtonDemo();

// export { bindSweetAlertButtonDemo };
