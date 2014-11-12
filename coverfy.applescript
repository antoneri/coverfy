(*
 * Based on "Spotify info on the Desktop via NerdTool" by drdrang
 * http://www.leancrew.com/all-this/2011/07/spotify-info-on-the-desktop-via-nerdtool/
 *
 * by Anton Eriksson
 * http://www.github.com/antoneri/coverfy
 *)

tell application "Finder"
    set outputDir to (container of (path to me)) as text & "output:"
end tell

set blankFile to outputDir & "blank.tiff"
set outputFile to outputdir & "output.tiff"
set spotifyOutput to outputDir & "spotify.tiff"

set posixBlank to the quoted form of POSIX path of blankFile
set posixOutput to the quoted form of POSIX path of outputFile
set posixSpotify to the quoted form of POSIX path of spotifyOutput

set displayArt to "blank"

tell application "System Events"
    if exists process "Spotify" then
        tell application "Spotify"
            set artworkData to artwork of current track
        end tell -- Spotify
        tell current application
            try
                set fileRef to (open for access spotifyOutput with write permission)
                write artworkData to fileRef
                close access fileref
                set displayArt to "spotify"
            on error message
                log message
            end try
        end tell -- current application
    end if -- exists process
end tell -- System Events

if displayArt is "spotify" then
    do shell script "ditto -rsrc " & posixSpotify & space & posixOutput
else
    do shell script "ditto -rsrc " & posixBlank & space & posixOutput
end if

