#!/bin/bash

# Input: Directory of emojis
# Output: A .png of concentric circles of all the emojis in the input dir

# Note that this assumes the user passes dir names with a trailing /
EMOJI_DIR=$1
IMAGE_OUT_PATH=$2
NUM_EMOJIS_IN_PERIOD=$3

echo "Borrowing emojis from ${EMOJI_DIR}"
echo "And making concentric circles with them in ${IMAGE_OUT_PATH}"

TRIG_ARG="(t/${NUM_EMOJIS_IN_PERIOD})*2*pi"

START_RADIUS='300'
MULTIPLIER="(${START_RADIUS}*floor(t/${NUM_EMOJIS_IN_PERIOD})+${START_RADIUS})"

convert $EMOJI_DIR*.png -set page \
  "+%[fx:${MULTIPLIER}*cos(${TRIG_ARG})]+%[fx:${MULTIPLIER}*sin(${TRIG_ARG})]" \
  -background white \
  -layers merge +repage \
  $IMAGE_OUT_PATH.png
