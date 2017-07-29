class Mood {
  constructor(id,title) {    
    this.id = id; 
    this.title= title;    
    this.tvshow = [] 
	}
}

class Tvshow {
	constructor(id, title, price){
		this.id = id; 
		this.title = title; 
		this.price = price; 
	}
}

Mood.prototype.showMoods = function() {
		var moodList = ''; 
		moodList += '<li class="js-mood" data-id="' + this.id + '">' + '<a href="moods/' + this.id+ '">'  +  this.title + '</a>' + '</li>'; 
		return moodList
}

Tvshow.prototype.showTvshows = function() {
		
		var tvshowList = ''; 
		tvshowList += '<li class="js-order" data-id="' + this.id + '">' + ' - ' + this.title+ '</li>'
		return tvshowList
}
 	


$(document).ready(function() {
  $.get("/moods.json", function(data) {
 		var moods = '' 		
 		$.each(data, function(index, value){        
        var mood = new Mood(id= data[index].id, title= data[index].title);
        moods += mood.showMoods();
      });
 		$("#ml").html(moods);
 	})

    $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    
    $.get("/moods/" + nextId + ".json", function(data) {
      var mood = new Mood(id=data["id"], title = data["title"], tvshow = data["tvshows"]);
      
      var mood_shows =[]
      data["tvshows"].forEach(function(element) {
    		mood_shows.push(element)
	  });

	  mood.tvshows = mood_shows; 
      
      var ts_list = ''

      $.each(mood_shows, function(index, value){
      	var ts = new Tvshow(id=mood_shows[index].id, title = mood_shows[index].title);     
      	ts_list += ts.showTvshows(); 
      })
      
    
      $(".moodTitle").text(mood.title);
        $(".moodTvshow").html(ts_list);
      $(".js-next").attr("data-id", mood.id);
    })
    .fail(function() {
      alert("You have reached the end of the Moods list"); 
    })
  });

});

