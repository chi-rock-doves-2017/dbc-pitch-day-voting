// before to up vote something
// whereToMove.before(thingToMove)
// after to down vote something
// whereToMove.after(thingToMove)
$(function(){
  $(".votes-list").on('submit', '.up-vote-button', function(event){
    event.preventDefault();
    var $this = $(this)
    var url = $this.attr('action')
    var method = $this.attr('method')
    var data = $this.serialize()

    // console.log(url, method, $this, data)
    $.ajax({
      url: url,
      type: method,
      data: data,
    })
    .done(function(response) {
      console.log("success", response);
    })
    .fail(function() {
      console.log("error");
    })
  })
  $(".votes-list").on('submit', '.down-vote-button', function(event){
    event.preventDefault();
    var $this = $(this)
    var url = $this.attr('action')
    var method = $this.attr('method')
    var data = $this.serialize()

    console.log(url, method, $this, data)
    // $.$.ajax({
    //   url: url,
    //   type: method,
    //   dataType: 'default: Intelligent Guess (Other values: xml, json, script, or html)',
    //   data: {param1: 'value1'},
    // })
    // .done(function() {
    //   console.log("success");
    // })
    // .fail(function() {
    //   console.log("error");
    // })
  })
})
