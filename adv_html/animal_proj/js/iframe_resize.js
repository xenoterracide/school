function adjustIFrameSize(id) {
	var myIframe = document.getElementById(id);
	if (myIframe) {
		if (myIframe.contentDocument
			&& myIframe.contentDocument.body.offsetHeight) {
		// W3C DOM (and Mozilla) syntax
			myIframe.height = 
				myIframe.contentDocument.body.offsetHeight;
		}
		else if (myIframe.Document &&
			myIframe.Document.body.scrollHeight) {
		// IE DOM syntax
			myIframe.height = myIframe.Document.body.scrollHeight;
		}
	}
}
