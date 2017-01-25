#!/bin/bash

EMOJI_DIR=$1
IMAGE_OUT_PATH=$2

# pixels
ASSUMED_IMAGE_SIDE_LENGTH=100
IMAGE_GUTTER_LEFT=25
IMAGE_GUTTER_TOP=200

# Tweak NUM_COLUMNS for various grid dimensions (num rows is dependent on the num cols and num images)
NUM_COLUMNS=15
NUM_ROWS_EXP="(floor(t/${NUM_COLUMNS}))"
NUM_COL_EXP="(t-(${NUM_ROWS_EXP}*${NUM_COLUMNS}))"

ROW_PX_EXP="(${NUM_ROWS_EXP}*${ASSUMED_IMAGE_SIDE_LENGTH})"
COL_PX_EXP="(${NUM_COL_EXP}*${ASSUMED_IMAGE_SIDE_LENGTH})"

LEFT_GUTTER_EXP="(${NUM_COL_EXP}*${IMAGE_GUTTER_LEFT})"
TOP_GUTTER_EXP="(${NUM_ROWS_EXP}*${IMAGE_GUTTER_TOP})"

convert $EMOJI_DIR*.png -set page \
  "+%[fx:${COL_PX_EXP}+${LEFT_GUTTER_EXP}]+%[fx:${ROW_PX_EXP}+${TOP_GUTTER_EXP}]" \
  -background white \
  -layers merge +repage \
  $IMAGE_OUT_PATH.png
