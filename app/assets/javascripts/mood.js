class Mood {
  constructor(id,title) {    
    this.id = id; 
    this.title= title;    
    this.tvshow = [] 
	}
}

class Tvshow {
	constructor(id, title, price, suspense_level, time_commitment){
		this.id = id; 
		this.title = title; 
		this.price = price; 
    this.time_commitment = time_commitment; 
    this.suspense_level = suspense_level; 
	}
} 

Mood.prototype.showMoods = function() {
		var moodList = ''; 
		moodList += '<li class="js-mood" data-id="' + this.id + '">' + '<a href="moods/' + this.id+ '">' 
     +  this.title + '</a>' + '</li>'; 
		return moodList
}

Mood.prototype.showTvshows = function() {
		var moodId = this.id
		var tvshowList = ''; 
		
		$.each(this.tvshows, function(index, value) {			
			
			tvshowList += '<li class="js-order" data-id="' + this.id + '">' + '<a href="' + moodId+ '/tvshows/' + this.id + '">'  + this.title + 
			'</a> - $' + (this.price/100) + '<br>' 
		})		

    tvshowList += '<div class="test" data-moodId="' + this.id + '">'

		return tvshowList	
		
}



Tvshow.prototype.showNewShow = function() {

  var newShow = '<li><a href=/tvshows/' + this.id + '">' + this.title + '</a>' + ' - $' + (this.price/100) + '</li>'
               $('.result').html(newShow);               

  $('.test').html(newShow); 
}
 	


$(document).ready(function() {
  
  //add moods to moods/index from moods.json created from AMS
  //Each one will be passed to the $.each function
  //Create class object from the id and titel of each mood
  //call method prototype constructor to add html and formatting
  //put that call into a variable
  //append that variable to #ml id on page
  $.get("/moods.json", function(data) {
 		
 		var moods = '' 		
 		$.each(data, function(index, value){        
        var mood = new Mood(id= data[index].id, title= data[index].title);
        moods += mood.showMoods();
      });
 		
    $("#ml").html(moods);
 	})

  
  //Next ID link
  //Get the next ID from the data-id (data-id = @mood.id)+ 1 
  //Get the JSON for the next mood, it's now in the data argument/param
  //Create a new Mood object from the mood class constructor
  //Create an array with all of the mood's tv shows
  //Add those tvshows to the new mood object
  //call showTvshows prototype constructor method (creates html to add it to the nested tvshow list, and id attribute to be used laster on); put results in a variable.
  //append the mood title, tvshows list, and data-id for next mood, to the page

  $(".js-next").on("click", function() {
    
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    
    $.get("/moods/" + nextId + ".json", function(data) {
      var mood = new Mood(id=data["id"], title = data["title"]);      
      var mood_shows =[]
      data["tvshows"].forEach(function(element) {
    		mood_shows.push(element)
	    });

      mood.tvshows = mood_shows; 
      ts_list = mood.showTvshows()
    
      $(".moodTitle").text(mood.title);
      $(".moodTvshow").html(ts_list);      
      $(".js-next").attr("data-id", mood.id);
    })

    .fail(function() {
      alert("You have reached the end of the Moods list"); 
    })

  });

  //Get the form 
  //Get the form action (url to post to)
  //Get the id of the mood
  //If there is a mood ID (it was added via AJAX), get the url to post to; if not, then use the current url
  //AJAX post request
    //type post
    //data - turn form into string
  //response is tvshow json
  //get those values and turn into new tvshow object
  //call constructor method on new tvshow object
  
  $("#blabla").on('submit', function(event) {
    
    var form = document.getElementById("blabla");
    var act = this.action
    var moodStuff = $('.test').attr("data-moodid")

    function urlStuff() {
      if (moodStuff) {
        return '/moods/' + moodStuff + '/tvshows'
      }
      else {
        return act 
      }
    }
    
     $.ajax({
        type: ($("input[name='_method']").val() || this.method),
        datatype: 'json',
        url: urlStuff(),
        data: $(this).serialize(),
        success: function(response){                            
          tvshow = new Tvshow(id=response["id"], title=response["title"], price=response["price"], time_commitment=response["time_commitment"], suspense_level = response["suspense_level"])
          tvshow.showNewShow();           
          form.reset(); 

        }
      }); 
      
      event.preventDefault();

 }); 
	


});

