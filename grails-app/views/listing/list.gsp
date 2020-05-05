<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${message(code: 'perform.file.listing')}</title>

    <style>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0, 0, 0); /* Fallback color */
        background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
    </style>

</head>

<body>
<g:render template="/templates/grailstemplates"/>
<asset:javascript src='jquery-3.3.1.min.js'/>

<div id="content" role="main">
    <content tag="nav">
        <g:link controller="secured">
            <span class="bold-txt" title="${message(code: 'title.home.tooltip')}"><g:message
                    code="default.home.page"></g:message></span>
        </g:link>
    </content>
    <section class="row colset-2-its">
        <h1>${message(code: 'check.remote.files')}</h1>
    </section>
</div>

<div id="design" role="main">
    <g:each in="${remotelist}">
        <ul>
            <li>
                <div class="row">
                    <div class="column">
                        ${it}
                    </div>

                    <div>
                        <g:link controller="delete" action="doDelete" params="[filename: it]"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><g:message
                                code="default.delete.label"/></g:link>


                        %{--                        <button type="button" id="put" onclick="click()">Preview</button>--}%
                        <button id="myBtn">Preview</button>

                        <!-- The Modal -->
                        <div id="myModal" class="modal">

                            <!-- Modal content -->
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                %{--                                <p>Vedio will play here....</p>--}%
                                <input type="file" id="uploadVideoFile" accept="video/*"/>

                                <div id="videoSourceWrapper">
                                    <video style="width: 100%;" controls>
                                        <source id="videoSource"/>
                                    </video>

                                    <div id="uploadVideoProgressBar"
                                         style="height: 5px; width: 1%; background: #2781e9; margin-top: -5px;"></div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </li>
        </ul>
    </g:each>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <h1>${message(code: 'check.database.files')}</h1>
    </section>
</div>

<div id="design" role="main">

    <g:if test="${dblist}">
        <g:each in="${dblist}" var="Uploadfile">
            <ul>
                <li>
                    <div class="row">
                        <div class="column">
                            ${Uploadfile.fileName}
                        </div>

                        <div>
                            ${Uploadfile.status}
                        </div>
                    </div>
                </li>
            </ul>
        </g:each>
    </g:if>
</div>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function () {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }



    $(document).ready(function(){
        $("#videoSourceWrapper").show();
    });


    $('#uploadVideoFile').on('change',
        function() {
            var fileInput = document.getElementById("uploadVideoFile");
            console.log('Trying to upload the video file: %O', fileInput);

            if ('files' in fileInput) {
                if (fileInput.files.length === 0) {
                    alert("Select a file to upload");
                } else {
                    var $source = $('#videoSource');
                    console.log('1111111111111', $source)
                    $source[0].src = URL.createObjectURL(this.files[0]);
                    console.log("222222", $source[0].src)
                    console.log('333333333', this.files[0])
                    $source.parent()[0].load();
                    $("#videoSourceWrapper").show();
                    UploadVideo(fileInput.files[0]);
                }
            } else {
                console.log('No found "files" property');
            }
        }
    );

    function UploadVideo(file) {
        var loaded = 0;
        var chunkSize = 500000;
        var total = file.size;
        var reader = new FileReader();
        var slice = file.slice(0, chunkSize);

        // Reading a chunk to invoke the 'onload' event
        reader.readAsBinaryString(slice);
        console.log('Started uploading file "' + file.name + '"');
        $('#uploadVideoProgressBar').show();

        reader.onload = function (e) {
            //Just simulate API
            setTimeout(function(){
                loaded += chunkSize;
                var percentLoaded = Math.min((loaded / total) * 100, 100);
                console.log('Uploaded ' + Math.floor(percentLoaded) + '% of file "' + file.name + '"');
                $('#uploadVideoProgressBar').width(percentLoaded + "%");

                //Read the next chunk and call 'onload' event again
                if (loaded <= total) {
                    slice = file.slice(loaded, loaded + chunkSize);
                    reader.readAsBinaryString(slice);
                } else {
                    loaded = total;
                    console.log('File "' + file.name + '" uploaded successfully!');
                    $('#uploadVideoProgressBar').hide();
                }
            }, 250);
        }
    }



    // function PostChunk(){
    //     //Send the sliced chunk to the REST API
    //     $.ajax({
    //         url: "http://api/url/etc",
    //         type: "POST",
    //         data: slice,
    //         processData: false,
    //         contentType: false,
    //         error: (function (errorData) {
    //             console.log(errorData);
    //             alert("Video Upload Failed");
    //         })
    //     }).done(function (e) {
    //         //The chunk is successfully uploaded!
    //         loaded += chunkSize;
    //         var percentLoaded = Math.min((loaded / total) * 100, 100);
    //         console.log('Uploaded ' + Math.floor(percentLoaded) + '% of file "' + file.name + '"');
    //         $('#uploadVideoProgressBar').width(percentLoaded + "%");
    //
    //         //Read the next chunk and call 'onload' event again
    //         if (loaded <= total) {
    //             slice = file.slice(loaded, loaded + chunkSize);
    //             isFirstChunk = false;
    //             reader.readAsBinaryString(slice);
    //         } else {
    //             loaded = total;
    //             console.log('File "' + file.name + '" uploaded successfully!');
    //             $('#uploadVideoProgressBar').hide();
    //         }
    //     });
    // }

</script>

</body>
</html>