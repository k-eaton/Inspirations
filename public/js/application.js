$(document).ready(function() {




  $("#myonoffswitch").change(function(event){
    // event.preventDefault
    if ($("#myonoffswitch").serialize() == "onoffswitch=true")
      {var formData = $("#myonoffswitch").serialize() + "&subscribed=false"}
    else
      {var formData = $("#myonoffswitch").serialize() + "&subscribed=true"}
    console.log(formData)
    //Get data from dropdown

    // var checkbox = $.ajax({
    //   url: "/settings",
    //   type: "GET",
    //   data: formData,
    //   datatype: 'json'
    // })
    // checkbox.done(function(ajaxResults){
    // // console.log(ajaxResults)
    // })
  });

  // // Load the scores data. When the data comes back, create an overlay.

  //     // d3.json("/drugs", function(data){
  //       var overlay = new google.maps.OverlayView();
  //       // Add the container when the overlay is added to the map.
  //       overlay.onAdd = function(){
  //         var layer = d3.select(this.getPanes().overlayLayer)
  //                       .append("div")
  //                       .attr("class", "scores");
  //         // Draw each marker as a separate SVG element.
  //         // We could use a single SVG, but what size would it have?
  //         overlay.draw = function() {
  //           var projection = this.getProjection(),
  //               padding = 12;

  //           var marker = layer.selectAll("svg")
  //                             .data(d3.entries(ajaxResults))
  //                             .each(transform) // update existing markers
  //                             .enter().append("svg:svg")
  //                             .each(transform)
  //                             .attr("class", "marker")
  //                             .each(transform)


  //           var firstObject = Object.keys(ajaxResults)[0];
  //           var drugType = ajaxResults[firstObject][2]
  //           console.log(drugType);

  //           marker.append("svg:circle")
  //                 .attr("r", 4)
  //                 // .append("stop").attr("offset", "100%")
  //                 // .style("stop-color", function(d) { return styling(drugType); })
  //                 //             .append("radialGradient")
  //                 //             // .attr("gradientUnits", "userSpaceOnUse")
  //                 //             .attr("cx", padding)
  //                 //             .attr("cy", padding)
  //                 //             .attr("r", "40%")
  //                 //             .attr("id", function(d, i) { return "grad" + i; })
  //                 //             .style("stop-color", function(d) { return styling(drugType); })
  //                 .style("fill", function(d) { return styling(drugType) })
  //                 .style({'stroke': 'black', 'stroke-width': 0.2})
  //                 .attr("cx", padding)
  //                 .attr("cy", padding)

  //             // Add a label.
  //             // $("circle").on("click", function(){
  //               // marker.append("svg:text")
  //               //     .attr("x", padding + 7)
  //               //     .attr("y", padding)
  //               //     .attr("dy", ".31em")
  //               //     .text(function(d) { return d.value[2]; });
  //             // })




  //           function transform(d) {
  //             d = new google.maps.LatLng(d.value[1], d.value[0]);
  //             d = projection.fromLatLngToDivPixel(d);
  //             return d3.select(this)
  //                 .style("left", (d.x - padding) + "px")
  //                 .style("top", (d.y - padding) + "px");
  //           }
  //         }
  //       }
  //       overlay.setMap(map);
  //     // })


  //   })
  // })



});
