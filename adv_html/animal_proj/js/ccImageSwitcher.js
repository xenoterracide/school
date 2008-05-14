/* create image array */
var aryImages = new Array();

/* define images in array */
aryImages[1] = "images/platypus1.jpg";
aryImages[2] = "images/platypus2.jpg";

for (i=0; i < aryImages.length; i++) {
	var preload = new Image();
	preload.src = aryImages[i];
}

function swap( imgIndex, imgTarget) {
	document[imgTarget].src = aryImages[imgIndex];
}
