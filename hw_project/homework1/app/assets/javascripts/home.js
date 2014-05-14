var when_page_is_ready = function(){

  $(document).ready(function() {
    $('[data-toggle=offcanvas]').click(function() {
      $('.row-offcanvas').toggleClass('active');
    })
  })

  $(".courseboxes").hide()
    $(".location_checkbox").change(function(){
      
      var location_id = $(this).attr("location_id")
        $(".location_" + location_id).show()
    })


  $("p.alert").fadeOut(2000)
  $("p.notice").fadeOut(2000)

  $(document.body).on("click", ".change_workflow", function(){
    $.ajax({
      type: "PATCH",
      url: $(this).attr("submission_url"),
      dataType: "script"
    })
  })


  // if $(".locationboxes") = val("Charleston"),
  //   $(".locationboxes").hide()
  //   $(".").show()
  // else if $(".locationboxes") == val("Atlanta");
  //   $(".locationboxes").hide();
  //   $(".").show()


}
$(document).ready(when_page_is_ready);
$(document).on("page:load", when_page_is_ready);