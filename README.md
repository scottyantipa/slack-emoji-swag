# Make Custom Swag From Your Team's Custom Slack Emojis

Use this repo to fetch all of the custom emojis for your slack team and transform them into variosu patterns for SWAG!

Some helpful commands

Center an image within another image and output a composite.  Note that the output doesn't require a file extension.
```
composite -gravity center path/to/image path/to/background path/to/output
```

Convert a gif to a sequence of pngs and scale them all to 100x100 pixels (preserving aspect ratio).
Note that the name of the pngs will be something like meme.gif --> [meme-1.png, meme-2.png, ... meme-N.png]
```
convert path/to/meme.gif -scale 100X100 path/to/output/meme.png
```
