var MM = MM || {};

MM.VideoHandler = (function($) {
    VideoHandler = {
        videos: [],
        onReady: function(song) {
          VideoHandler.viewSong(song);
        },
        setVideos: function(videos) {
          VideoHandler.videos = videos;
        },
        viewSong: function(song) {
          var $video_player = videojs(document.getElementById('video_container'), { 'techOrder': ['youtube'] });
          $video_player.src(song.src);
          $video_player.on('ended', function() {
            VideoHandler.fetchNext();
          });
        },
        fetchNext: function(song) {
          var nextId = song.index + 1;
          window.location = '/#/songs/current/' + nextId;
        }
    };
    return VideoHandler;
}(jQuery));

