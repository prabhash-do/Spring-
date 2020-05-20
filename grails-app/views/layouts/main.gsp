<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body class="w3-light-grey">

<div class="w3-bar w3-top w3-blue w3-large" style="z-index:4">

    <span class="w3-bar-item w3-left"><a class="navbar-brand"
                                         href="${g.createLink(controller: "secured")}"><asset:image src="file.jpg"
                                                                                                    alt="Files Logo"/></a>
    </span>
    <span class="w3-bar-item w3-right">
        <div class="w3-right" aria-expanded="false" style="height: 0.8px; alignment: right" id="navbarContent">
            <sec:ifLoggedIn>
                <span>Welcome, <strong>
                <sec:username/>
            </sec:ifLoggedIn></strong></span><br>
            <sec:ifLoggedIn>
                <div class="w3-col s8 w3-bar">
                    <a href="${g.createLink(controller: "myProfile", action: "showProfileDetails")}"
                       class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
                    <a href="${g.createLink(controller: "logout", action: "logout")}"
                       class="w3-bar-item w3-button"><asset:image src="logout.png" alt="Image"/></a>
                </div>
            </sec:ifLoggedIn>
        </div>
    </span>
</div>
<sec:ifLoggedIn>
    <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
        <hr>

        <div class="w3-container" style="margin-top: 100px;">
            <h5>Dashboard</h5>
        </div>

        <div class="w3-bar-block" style="margin-top: 5px;">
            <a id="overview" name="overview" href="<g:createLink controller='secured' action='index'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-users fa-fw"></i>  Overview
            </a>
            <a id="upload" name="upload" href="<g:createLink controller='insert' action='insert'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-eye fa-fw"></i>  Upload</a>
            <a id="users" name="users" href="<g:createLink controller='userManagement'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a id="delete" name="delete" href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
        </div>
    </nav>
</sec:ifLoggedIn>
<g:layoutBody/>

<asset:javascript src="application.js"/>
</body>
</html>
