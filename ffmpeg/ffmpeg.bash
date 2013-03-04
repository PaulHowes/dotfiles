alias convert2qt="~/.dotfiles/ffmpeg/convert2qt"
# Converts an audio file to ALAC format.
function alac()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
    -codec:a alac \
    "${name}.m4a"
}

# Converts an MKV file to M4V format.  This assumes the video is already in
# H.264 and the audio is AC3, which is true of most TV shows.
function mkv2m4v()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
  -map_chapters -1 \
  -map 0:v:0 -map 0:a:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -metadata:s:2 language=eng \
  -codec:v copy \
  -codec:a:0 libfaac -ar:a:0 48k -ab:a:0 160k -ac:a:0 2 \
  -codec:a:1 copy \
  "${name}.m4v"
}

function mkvdts2m4v()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
  -map_chapters -1 \
  -map 0:v:0 -map 0:a:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -metadata:s:2 language=eng \
  -codec:v copy \
  -codec:a:0 libfaac -ar:a:0 48k -ab:a:0 160k -ac:a:0 2 \
  -codec:a:1 ac3 -ar:a:1 48k -ab:a:1 448k -ac:a:1 6 \
  "${name}.m4v"
}

function movaac2m4v()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
  -map_chapters -1 \
  -map 0:v:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -codec:v copy \
  -codec:a copy \
  "${name}.m4v"
}

# Recodes a media file with ffmpeg into a format that QuickTime is happy with.
# The first argument ($1) is the name of the file to convert.  The name of the
# output file the same as the input file, but with an ".m4v" extension.
function any2qt()
{
  name=${1%\.*}
  ffmpeg -i "$1" \
  -map_chapters -1 \
  -map 0:v:0 -map 0:a:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -metadata:s:2 language=eng \
  -codec:v libx264 -preset:v slow -profile:v main -crf:v 18 -threads:v 0 \
  -codec:a:0 libfaac -ar:a:0 48k -ab:a:0 160k -ac:a:0 2 \
  -codec:a:1 ac3 -ar:a:1 48k -ab:a:1 448k -ac:a:1 6 \
  "${name}.m4v"
}

# Same as above, but forces 720p
function any2qthd()
{
  name=${1%\.*}
  ffmpeg -i "$1" \
  -map_chapters -1 \
  -map 0:v:0 -map 0:a:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -metadata:s:2 language=eng \
  -codec:v libx264 -preset:v slow -profile:v main -crf:v 18 -threads:v 0 \
  -vf scale=1920:-1 \
  -codec:a:0 libfaac -ar:a:0 48k -ab:a:0 160k -ac:a:0 2 \
  -codec:a:1 ac3 -ar:a:1 48k -ab:a:1 448k -ac:a:1 6 \
  "${name}.m4v"
}

# Converts MPEG4 (DivX or Xvid) files to quicktime.  Single video and audio
# converted to H.264 and AAC with languages set to English.
function avi2qt()
{
  name=${1%\.*}
  ffmpeg -i "$1" \
  -map 0:v:0 -map 0:a:0 \
  -metadata:s:0 language=eng -metadata:s:1 language=eng \
  -codec:v libx264 -preset:v slow -profile:v main -crf:v 18 -threads:v 0 \
  -codec:a libfaac -ar:a 48k -ab:a 160k -ac:a 2 -vol:a 768 \
  "${name}.m4v"
}

# Transcodes a file as above but with a frame size specifed:
#   transcode_with_size file.mkv 1280x582 file.m4v
function transcode_with_size()
{
  ffmpeg -i "$1" \
  -vcodec libx264 -vpre slow -vpre main -crf 18 -s $2 -threads 0 \
  -acodec libfaac -ar 48000 -ab 160000 -ac 2 "$3"
  #-acodec ac3 -ar 48000 -ab 448000 -ac 6 -newaudio
}

# Converts an HD QuickTime file to SD (853x480)  and eliminates all but the
# primary audio track so that the file works better on an iPad or iPhone.
function qt2sd()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
  -map 0:v:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -codec:v libx264 -preset:v slow -profile:v main -crf:v 18 -threads:v 0 \
  -vf scale=854:-1 \
  -codec:a:0 copy \
  "${name}_sd.m4v"
}

function mov2m4v()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
  -map_chapters -1 \
  -map 0:v:0 -map 0:a:0 -map 0:a:0 \
  -metadata:s:0 language=eng \
  -metadata:s:1 language=eng \
  -metadata:s:2 language=eng \
  -codec:v copy \
  -codec:a:0 copy \
  -codec:a:1 copy \
  "${name}.m4v"
}
