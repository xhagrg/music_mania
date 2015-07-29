var MM = MM || {};

MM.VideoHandler = (function($) {
  VideoHandler = { 
    videos: [],
    onReady: function(videos) {
      VideoHandler.setVideos(videos);
      VideoHandler.playVideo();
    },
    setVideos: function(videos) {
      VideoHandler.videos = videos;
    },
    playVideo: function() {
      videojs(document.getElementById("video_container"), 
              { "techOrder": ["youtube"], 
                "children": 
                  { "controlBar": 
                      { "children": 
                          { "muteToggle": false } 
                      } 
                  } 
              }, function() {
                   var self = this,
                     videos = VideoHandler.videos;
                   var index = (getCookie("current_index") || 1) - 1;
                   self.src(videos[index]);

                   self.on('ended', function() {
                     if ( index == videos.length -1 ) 
                       index = 0;
                     self.src(videos[index]);
                     setCookie(++index);
                   });
      }); 
    }    
  };
  return VideoHandler;
}(jQuery));

function setCookie(current_index, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+d.toUTCString();
  document.cookie = "current_index=" + current_index + "; " + expires;
}

function getCookie(current_index) {
  var index = current_index + "=";
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1);
      if (c.indexOf(index) == 0) return c.substring(index.length,c.length);
  }
  return "";
}


