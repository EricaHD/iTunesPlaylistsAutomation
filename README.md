# iTunesPlaylistsAutomation

Powershell script creates one playlist for each podcast on a device's podcast list.  Each playlist contains exactly one podcast, and the playlist shares its name with the podcast episode inside it.

### Why would anybody want that?

Well, it's my mom.  She's kinda nuts.

When she listens to podcasts, she prefers to select just one, then have the device turn off after that episode comes to an end.  Her iPod, however, will work its way through the entire podcast list before stopping and turning off.  She hates that.

One solution to this conundrum is to put each podcast into its own playlist.  That way she can select a playlist, play the podcast it contains, then the device will automatically stop when it reaches the end of that episode since there are no other episodes in that playlist.

But my mom is not the most technologically advanced, you see.  It's tough for her to create, delete, and maintain all these playlists.  (Really, it's tough.  It's even tougher to try and teach her, which I have also attempted.)  So this script runs through the podcasts on her device and creates a separate playlist for each one.

Yes, that makes for a lot of playlists, each containing only one item.  So in addition, every time the device syncs with the 10 most recent episodes, it deletes all the old playlists and makes 10 new ones.  Not the most efficient, but there you have it.

### Usage & Usefulness

The Lenovo version is both more recent and more robust, so feel free to take a look at that.

These scripts are merely examples of how to access and manipulate iTunes from powershell.  They would have to be heavily customized according to your specific iTunes needs.

Enjoy.
