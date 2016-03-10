$(document).ready(function() {


  $("#phoneUS").mask("999-999-9999");

  $("#signup").validate({rules: {
    // #phone-login
    phoneUS: "required"
  }})

  $("#myonoffswitch").change(function(event){
    // event.preventDefault
    console.log($("#myonoffswitch").serialize())
    if ($("#myonoffswitch").serialize() == "onoffswitch=on")
      {var formData = "subscription=true"}
    else
      {var formData = "subscription=false"}
    console.log(formData)
    //Get data from dropdown

    var checkbox = $.ajax({
      url: "/settings",
      type: "POST",
      data: formData,
      datatype: 'json'
    })
    checkbox.done(function(ajaxResults){
    // console.log(ajaxResults)
    })
  });

  

});
