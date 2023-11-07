#!/bin/bash

# When i get an audio book on CD, I like to copy it to mp3 files
# so that I can then put them on my mp3 player/car radio for listening.
# So I typically use OS tools to dump each CD track to a WAV file,
# under a directory for each CD.
# I then use this script to convert all the wav files into MP3 format,
# using ffmpeg.

printf "Name of book?: "
read BOOK

printf "Disc number e.g. 01, 04, 10...?: "
read DISCNUM

for i in $(ls)
do
  echo "Working on..."
  echo "$i"
  A="$(cut -d. -f1 <<<"$i")"
  echo "$A"

  B="$(cut -dk -f2 <<<"$A")"
  echo "$B"

  C="${BOOK} - D${DISCNUM}T${B}.mp3"

  echo "Input = $i, Output = $C"
  ffmpeg -i $i -metadata title="${BOOK} - D${DISCNUM}T${B}" -metadata album="${DISCNUM}" -metadata track="${B}" "${C}"
  printf "Complete.\n\n\n"


done

mv *.mp3 ../. 


