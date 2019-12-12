class APODItem {
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  APODItem({this.date,this.explanation,this.hdurl,this.mediaType,this.serviceVersion,this.title,this.url});

  factory APODItem.fromJson(Map<String, dynamic> json){
    return APODItem(
      date: json['date'],
      explanation: json['explanation'],
      hdurl: json['hdurl'],
      mediaType: json['media_type'],
      serviceVersion: json['service_version'],
      title: json['title'],
      url: json['url'],
    );
  }
}

/*
*
* Video data sample
* {
	"date": "2019-12-09",
	"explanation": "verybody sees the Sun. Nobody's been there. Starting in 2018 though, NASA launched the robotic Parker Solar Probe (PSP) to investigate regions near to the Sun for the first time. The PSP's looping orbit brings it yet closer to the Sun each time around -- every few months. The featured time-lapse video shows the view looking sideways from behind PSP's Sun shield during its first approach to the Sun a year ago -- to about half the orbit of Mercury.  The PSP's Wide Field Imager for Solar Probe (WISPR) cameras took the images over nine days, but they are digitally compressed here into about 14 seconds.  The waving solar corona is visible on the far left, with stars, planets, and even the central band of our Milky Way Galaxy streaming by in the background as the PSP orbits the Sun. PSP has found the solar neighborhood to be surprisingly complex and to include switchbacks -- times when the Sun's magnetic field briefly reverses itself. The Sun is not only Earth's dominant energy source, its variable solar wind compresses Earth's atmosphere, triggers auroras, affects power grids, and can even damage orbiting communication satellites.",
	"media_type": "video",
	"service_version": "v1",
	"title": "Looking Sideways from the Parker Solar Probe",
	"url": "https://www.youtube.com/embed/7w8szZ4TxCk?rel=0"
}
*
* Image data sample
*{
	"date": "2019-12-11",
	"explanation": "What has this supernova left behind?  As little as 2,000 years ago, light from a massive stellar explosion in the Large Magellanic Cloud (LMC) first reached planet Earth. The LMC is a close galactic neighbor of our Milky Way Galaxy and the rampaging explosion front is now seen moving out - destroying or displacing ambient gas clouds while leaving behind relatively dense knots of gas and dust.  What remains is one of the largest supernova remnants in the LMC: N63A.  Many of the surviving dense knots have been themselves compressed and may further contract to form new stars.  Some of the resulting stars may then explode in a supernova, continuing the cycle.  Featured here is a combined image of N63A in the X-ray from the Chandra Space Telescope and in visible light by Hubble.  The prominent knot of gas and dust on the upper right -- informally dubbed the Firefox -- is very bright in visible light, while the larger supernova remnant shines most brightly in X-rays.  N63A spans over 25 light years and lies about 150,000 light years away toward the southern constellation of Dorado.",
	"hdurl": "https://apod.nasa.gov/apod/image/1912/N63A_HubbleChandraSchmidt_1019.jpg",
	"media_type": "image",
	"service_version": "v1",
	"title": "N63A: Supernova Remnant in Visible and X-ray",
	"url": "https://apod.nasa.gov/apod/image/1912/N63A_HubbleChandraSchmidt_960.jpg"
}
*
* */