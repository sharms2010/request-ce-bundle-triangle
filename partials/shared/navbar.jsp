<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>

<link rel="stylesheet" type="text/css" href="${bundle.location}/css/temp.css"/>

 <header class="header clearfix">
  <nav class=" overlay mgn-bot-none">
    <div class="container">
<!-- logo -->
        <a href="${bundle.spaceLocation}/${kapp.slug}" class="navbar-brand pad-none">
           <h1 class="pad-lft-10 font-thin white line-height-70 font-size-50">${kapp.getAttributeValue("Company Name")}</h1>
        </a>
<!-- Profile -->
      <div class="dropdown pull-right border-none mgn-none pad-10">          
        <a id="profile" href="#" class="dropdown-toggle pad-none" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
          <div class="avatar line-height-50">
            <bundle:gravatar email="${identity.username}" sz="48" >
            </bundle:gravatar>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-right pad-10">
            <p class="font-medium mgn-bot-none">${identity.username}</p>
            <div class="navAccount font-medium">
                <a href="${bundle.spaceLocation}/${kapp.slug}/profile-page">Your Account</a>
            </div>
        </div>
      </div>
<!-- categories -->
        <div class="dropdown pull-right border-none mgn-none pad-10">          
          <a id="categories" href="#" class="dropdown-toggle pad-none" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
            <i class="fa fa-th fa-3x line-height-50"></i>
          </a>
          <ul class="dropdown-menu dropdown-menu-right">
            <c:forEach var="kapps" items="${space.kapps}">
              <li> 
                <a href="/kinetic/${space.slug}/${kapps.slug}">
                  <i class="fa ${kapps.getAttributeValue("FA Logo")} fa-1x pull-left"></i>
                  <div class="pull-right">${kapps.name}</div>
                </a>
              </li>
            </c:forEach>
          </ul>
        </div>
    </div>
  </nav>
</header>

