import std.algorithm;
import std.conv;
import std.file;
import std.net.curl;
import std.stdio;
import std.string;

/**

	@file    slomograb.d
	@author  Sean Charles   <sean lives-at objitsu dot com>
	@licence MIT spread it around!

  A simple frame grabber tool for use with IPWebcam Remote (Android).

*/

void main(string[] args)
{
	captureFrame(args[1]);
}


void captureFrame(string cameraIp)
{
	download(
		format("http://%s/photo.jpg", cameraIp),
		format("f%08d.jpg", findHighestFrame()+1));
}


char[] grabImage(string camera_ip)
{
	return get(format("%s/photo.jpg",camera_ip));
}


int findHighestFrame()
{
	int max = 0;
	auto frames = dirEntries(".", "f*.jpg", SpanMode.shallow, false);

	foreach(frame; frames)
	{
		auto frameStr = chompPrefix(chomp(frame.name, ".jpg"), "./f");
		int frameNum = to!(int)(frameStr);

		if (frameNum > max) {
			max = frameNum;
		}
	}
	return max;
}

