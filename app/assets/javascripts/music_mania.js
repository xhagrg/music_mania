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
      console.log(song);
      var $video_player = _V_(document.getElementById('video_container'), { 'techOrder': ['youtube'] });
      $video_player.ready(function() {
        $video_player.src(song.src);
//        $video_player.play();
        $video_player.on('ended', function() {
          VideoHandler.fetchNext();
        });
      });

    },
    fetchNext: function() {
      window.location.href = '/#/songs/current';
      // var $app_holder = $('#music_mania');
      // var $app = angular.element($app_holder);
      // var $injector = $app.injector();
      // var $scope = $app.scope();
      // var $location = $injector.get('$location');
      // $location.url("/songs/current");
      // $scope.$apply();
    }
  };
  return VideoHandler;
}(jQuery));

