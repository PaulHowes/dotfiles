# Converts an audio file to ALAC format.
function alac()
{
  basename=`basename "${1}"`
  name=${basename%\.*}
  ffmpeg -i "$1" \
    -codec:a alac \
    "${name}.m4a"
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
