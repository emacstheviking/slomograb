# Simple frame grabber using IPWebcam Remote Camera (Android)

My son (and myself) both love trying to make stop-motion Lego movies but there
is an absolute dearth of good free applications out there.  I aim to remedy
that will a cross-platform binary (under development) that uses D-lang and
Vibe.d, this little utility was a proof of concept to get me into learning the
libraries more and also to prove that I could actually grab an image from
IPWebcam Remote.

# Building it

Build the binary as shown, this is for OS X:

    dmd -L/usr/lib/libcurl.dylib main.d

You may have to fiddle with that to work on other systems.

Once it is built, copy it somewhere that it can be found on the system file
path, on my iMac that is /usr/local/bin/slomograb

# Using it.

Having copied it on the path, you should then run IPCamera and note the address
it gives you: for me that usually turns out to be something like:
http://192.168.0.8:8080

You can then do: slomograb 192.168.0.8:8080

This will take a high-resolution picture using the settings you have in effect
and save it in the current working directory. The filename will be
fNNNNNNNN.jpg and it will automatically find the largest of frames before
saving it. Each invocation produces a higer frame:

    f00000001.jpg
    f00000002.jpg
    f00000003.jpg
      :

What you do with it after that is up to you, I use ffmpeg to stitch them
together into the final sequence for now and then the clip is imported into
iMovie for editing. The script "stitch" is also in this project and shows how
to use ffmpeg to do just that, again on OSX. Again, copy `stitch` into a
place like `usr/local/bin` so it can be run from anywhere.

# Working Practice

For each sequence / scene you are going to shoot, create a folder called
"scene_NAME", then I "cd" into that and get ready for a shoot... when
everything is ready, issue the command to gram a frame, rinse and repeat.

At any time you can just use the "stitch" command and then wathc it, I do it like this:

     $ stitch && open clip.mp4

Which on my Mac will glue them and then open Quicktime for playback.

So, there we have it, the beginnings of a simple stop-motion tool chain that is
in theory at least, cross platform thanks to the power of D-lang.

