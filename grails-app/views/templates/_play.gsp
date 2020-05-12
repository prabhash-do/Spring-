<%--
  Created by IntelliJ IDEA.
  User: BSarkar00
  Date: 05-05-2020
  Time: 11:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Play video</title>
</head>

<body>
<asset:javascript src='jquery-3.3.1.min.js'/>
<fieldset>
    <g:if test="${videoflag}">
        <video id="video" controls preload="metadata" style="width:100%; height:100%">
        </video>
    </g:if>
</fieldset>

<script>
    function setVideoSource(selector, src) {

        var element = document.querySelector(selector);

        /*
        Check that element is video before proceeding
        */
        if (element.nodeName === 'VIDEO') {

            /*
            If element is a video, remove any source children if present
            */
            for (var source of element.querySelectorAll('source')) {
                element.removeChild(source);
            }

            /*
            Create a new source element and populate it with the src
            attribute
            */
            var source = document.createElement('source');
            source.setAttribute('src', src);

            /*
            Add source element to the video we're updating
            */
            element.appendChild(source);
        }
    }

    /*
    Adds a new video to the document under the first element matching the parentSelector
    */
    function addVideo(parentSelector, src, width, height) {

        var parent = document.querySelector(parentSelector);

        /*
        Check that parent exists before proceeding
        */
        if (parent) {

            /*
            Create new video element
            */
            var video = document.createElement('video');
            video.setAttribute('controls', true);

            if (width) {
                video.setAttribute('width', width);
            }

            if (height) {
                video.setAttribute('height', height);
            }

            /*
            Create a new source element and populate it with the src
            attribute
            */
            var source = document.createElement('source');
            source.setAttribute('src', src);

            /*
            Add source element to the video we're inserting and add
            the video element to the document element
            */
            video.appendChild(source);
            // parent.appendChild(video);
        }
    }

    // Update source of existing video
    setVideoSource('#video', '${resource(dir: 'upload/videos', file: filename)}')
</script>
</body>
</html>