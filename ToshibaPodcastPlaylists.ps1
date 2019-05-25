############################################################

#iTunes Powershell Interface:
# http://www.joshkunz.com/iTunesControl/interfaceIiTunes.html

############################################################

# iTunes COM object; opens application
$itunes = New-Object -ComObject iTunes.Application

# Sources that make up iTunes: library, radio, connected device (e.g. ipod), etc.
$sources = @($itunes.Sources)

# iPod (plugged in and registered)
$ipod = $sources | Where {
    $_.Kind -eq 2
}

# All playlists (music, movies, TV shows, podcasts, audiobooks, owner's iPod, my top rated)
$playlists = @($ipod.Playlists)

# Podcasts playlist
$podcasts = $playlists[3]

# Array of tracks in podcasts playlist
$podcast_tracks = @($podcasts.Tracks)

# For each track in podcasts playlist
foreach ($podcast in $podcast_tracks) {
    
    # Is there already a playlist with name $podcast.Name?
    $playlist_exists = $false
    foreach ($playlist in $playlists) {
        if (!($podcast.Name.CompareTo($playlist.Name))) {
            $playlist_exists = $true
        }
    }
    Write-Host $podcast.Name " exists? ..... " $playlist_exists

    # If not, create a playlist for this podcast with same name as podcast
    if (!($playlist_exists)) {
        $test_playlist = $itunes.CreatePlaylistInSource($podcast.Name, $ipod)
        $test_playlist.AddTrack($podcast)
        #$test_playlist.AddTrack
    }
}