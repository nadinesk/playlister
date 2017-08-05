$(document).ready(function() {
    
  
  $('.ashow').on('click', "#delete", function(event) {
    
    const { parentElement, dataset: { url, method } } = this;
    var id = $(this).attr("id");
    var string = 'id='+ id ;
    $.ajax({
      data: string,
      type: method,      
      url: url,      
      success: function(response){                                          
        parentElement.remove()
      }
    }); 
        event.preventDefault();
  }); 

});

