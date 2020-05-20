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
%{--<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="${g.createLink(controller: "secured")}"><asset:image src="file.jpg" alt="Files Logo"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent"
            aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>--}%

%{-- <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">
     <ul class="nav navbar-nav ml-auto">
         <g:pageProperty name="page.nav"/>
         <sec:ifLoggedIn>
             <li>
             <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
             <g:message code="default.dropdown.choose.action"></g:message>
             </a>
             <div class="dropdown-menu navbar-dark">
             <g:form controller="myProfile" action="showProfileDetails">
                 <input type='submit' id="submit" value="${message(code: 'default.button.myprofile')}"/>
             </g:form>
             <g:form controller="logout">
                 <input type='submit' id="submit" value="${message(code: 'default.button.logout')}"/>
             </g:form>
             </div>
             </li>
         </sec:ifLoggedIn>
     </ul>
 </div>--}%

%{--</nav>--}%

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
            <a href="#" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>  Overview
            </a>
            <a href="<g:createLink controller='insert' action='insert'/>"
               class="w3-bar-item w3-button w3-padding "><i class="fa fa-eye fa-fw"></i>  Upload</a>
            <a href="<g:createLink controller='userManagement'/>" class="w3-bar-item w3-button w3-padding"><i
                    class="fa fa-diamond fa-fw"></i>  List Users</a>
            <a href="<g:createLink controller='deleteAll' action='doAllDelete'/>"
               class="w3-bar-item w3-button w3-padding"><i class="fa fa-bullseye fa-fw"></i>  Delete All Files</a>
        </div>
    </nav>
</sec:ifLoggedIn>
<g:layoutBody/>
<asset:javascript src="application.js"/>
</body>
</html>
