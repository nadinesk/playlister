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
			'</a><div><input data-id="' + this.id  +  '"id="target" data-price = "' + this.price + '" data-title = "' + this.title + '" type="button", value="Add to Playlist"></input> </div><br>' 
		})		

		return tvshowList	
		
		
}

Tvshow.prototype.showNewShow = function() {

  var newShow = '<li><a href=/tvshows/' + this.id + '">' + this.title + '</a>' + ' - $' + (this.price/100) + '</li>'
               $('.result').html(newShow);
               //location.reload(); 
}
 	


$(document).ready(function() {
  //load index with AJAX
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
      var mood = new Mood(id=data["id"], title = data["title"]);
      //debugger
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
   
 $(".moodTvshow").on('click', '#target',function(event) {
   	event.preventDefault(); 

   	tvshowId = $(this).attr("data-id") 
   	tvshowPrice = $(this).attr("data-price") 
   	tvshowTitle = $(this).attr("data-title") 
   	
   	$.ajax({
        url:'/showlines',
        type:'POST',
        datatype:'json',
        data:{
            tvshow_id: tvshowId,  
            tvshowPrice: tvshowPrice, 
            tvshowTitle: tvshowTitle, 
            authenticity_token: window._token            
        },

        success:function(response){
             window.location = "/playlists";
        },
        error:function(data){
        	alert('n');
           
        }
    });
   	
   });

 $("#blabla").on('submit', function(event) {
    
    var form = document.getElementById("blabla");
    
     $.ajax({
               type: ($("input[name='_method']").val() || this.method),
               datatype: 'json',
               url: this.action,
               data: $(this).serialize(), // either JSON or querystring serializing
               success: function(response){

              tvshow = new Tvshow(id=response["id"], title=response["title"], price=response["price"], time_commitment=response["time_commitment"], suspense_level = response["suspense_level"])
              tvshow.showNewShow(); 
               form.reset(); 

              }

        }); 
      event.preventDefault();

 }); 
	


});

