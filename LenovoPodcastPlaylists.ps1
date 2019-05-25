############################################################

# Run from powershell with
# powershell.exe C:\Users\a55do\Desktop\NewPodcastPlaylists.ps1

# Documentation:
# http://www.joshkunz.com/iTunesControl/interfaceIiTunes.html#z5_2
# http://www.joshkunz.com/iTunesControl/interfaceIITTrackCollection.html

############################################################

# iTunes COM object; opens application
$itunes = New-Object -ComObject iTunes.Application

# iPod
$ipod = $itunes.Sources.ItemByName('Tobys_iPod')

# iPod playlists
$playlists = $ipod.Playlists

# Find names of all playlists that start with "Jill"
$to_delete = @()
foreach ($playlist in $playlists) {
    $title = $playlist.Name -split " "
    $title = $title[0]
    if ($title.CompareTo('Jill') -eq 0) {
        $to_delete += $playlist.Name
    }
}

# Delete all playlists that start with "Jill"
for ($i = 0; $i -lt $to_delete.length; $i++) {
    $playlist = $playlists.ItemByName($to_delete[$i])
    $playlist.Delete()
}

# Podcast playlist on iPod
$podcasts = $playlists.ItemByName('Podcasts')

# Podcasts
$tracks = $podcasts.Tracks

# For each track in podcasts playlist
foreach ($track in $tracks) {
    
    # Create playlist name
    $date = $track.ReleaseDate -split " "
    $date = $date[0]
    $name = "Jill $date " + $track.Name

    # Create playlist with $name containing $track
    $new_playlist = $itunes.CreatePlaylistInSource($name, $ipod)
    $new_playlist.AddTrack($track)

}