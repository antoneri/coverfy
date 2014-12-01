#!/usr/bin/osascript
(*
 * Based on "Spotify info on the Desktop via NerdTool" by drdrang
 * http://www.leancrew.com/all-this/2011/07/spotify-info-on-the-desktop-via-nerdtool/
 *
 * by Anton Eriksson
 * http://www.github.com/antoneri/coverfy
 *)

set doDropShadow to true -- Set this to 'false' if you don't have ImageMagick

set composite to "/usr/local/bin/composite -gravity center"

tell application "Finder"
	set outputDir to ((container of (path to me)) as text) & "output:"
end tell

set artworkFile to outputDir & "spotify.tiff"

set pArtworkFile to the quoted form of POSIX path of artworkFile
set blankFile to the quoted form of POSIX path of (outputDir & "blank.tiff")
set outputFile to the quoted form of POSIX path of (outputDir & "output.tiff")
set dropShadow to the quoted form of POSIX path of (outputDir & "shadow.tiff")

set displayArt to false
set playerState to false

tell application "System Events"
	if exists process "Spotify" then
		tell application "Spotify"
			set playerState to player state as string
			set artworkData to artwork of current track
		end tell -- Spotify
		tell current application
			try
				set fileRef to (open for access artworkFile with write permission)
				write artworkData to fileRef
				close access fileRef
				set displayArt to true
			on error message
				log message
			end try
		end tell -- current application
	end if -- exists process
end tell -- System Events

if displayArt is true and playerState is "playing" then
	if doDropShadow is true
		do shell script composite & space & pArtworkFile & space & dropShadow & space & outputFile
	else
		do shell script "ditto -rsrc " & pArtworkFile & space & outputFile
	end if
else
	do shell script "ditto -rsrc " & blankFile & space & outputFile
end if

