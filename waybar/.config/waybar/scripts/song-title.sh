
#!/bin/bash

max_length=10

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

if [ -z "$title" ] && [ -z "$artist" ]; then
  echo ""
  exit 0
fi

separator=" - "

# If full fits, print as is
full="$title$separator$artist"
if [ ${#full} -le $max_length ]; then
  echo "$full"
  exit 0
fi

# Truncate artist first
max_artist_length=$((max_length - ${#title} - ${#separator}))
if [ $max_artist_length -lt 0 ]; then
  max_artist_length=0
fi

if [ ${#artist} -gt $max_artist_length ]; then
  if [ $max_artist_length -gt 1 ]; then
    truncated_artist=$(echo "$artist" | cut -c1-$((max_artist_length - 1)))…
  else
    truncated_artist=""  # too small space, no artist shown
  fi
else
  truncated_artist=$artist
fi

# Decide if separator is needed
if [ -z "$truncated_artist" ]; then
  truncated="$title"
else
  truncated="$title$separator$truncated_artist"
fi

# If still too long, truncate title without ellipsis
if [ ${#truncated} -gt $max_length ]; then
  if [ -z "$truncated_artist" ]; then
    max_title_length=$max_length
  else
    max_title_length=$((max_length - ${#separator} - ${#truncated_artist}))
  fi
  if [ $max_title_length -lt 0 ]; then
    max_title_length=0
  fi
  truncated_title=$(echo "$title" | cut -c1-$max_title_length)
  if [ -z "$truncated_artist" ]; then
    truncated="$truncated_title"
  else
    truncated="$truncated_title$separator$truncated_artist"
  fi
fi

echo "$truncated"
#!/bin/bash

# Max total character limit
max_length=10

# Get metadata
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

# Default if nothing is playing
if [ -z "$title" ] && [ -z "$artist" ]; then
  echo ""
  exit 0
fi

separator=" - "
full="$title$separator$artist"

# If it fits, print as-is
if [ ${#full} -le $max_length ]; then
  echo "$full"
  exit 0
fi

# Truncate artist first
max_artist_length=$((max_length - ${#title} - ${#separator}))
if [ $max_artist_length -lt 0 ]; then
  max_artist_length=0
fi

if [ ${#artist} -gt $max_artist_length ]; then
  # Leave room for ellipsis (1 char)
  if [ $max_artist_length -gt 1 ]; then
    truncated_artist=$(echo "$artist" | cut -c1-$((max_artist_length - 1)))…
  else
    truncated_artist="…"  # too small space, just ellipsis
  fi
else
  truncated_artist=$artist
fi

truncated="$title$separator$truncated_artist"

# If still too long (title too long), truncate title without ellipsis
if [ ${#truncated} -gt $max_length ]; then
  max_title_length=$((max_length - ${#separator} - ${#truncated_artist}))
  if [ $max_title_length -lt 0 ]; then
    max_title_length=0
  fi
  truncated_title=$(echo "$title" | cut -c1-$max_title_length)
  truncated="$truncated_title$separator$truncated_artist"
fi

echo "$truncated"
