<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>



 <header class="header clearfix">
  <nav class=" overlay m-b-0">
    <div class="container">
<!-- logo -->
        <a href="${bundle.spaceLocation}/${kapp.slug}" class="navbar-brand p-a-0">
           <h1 class="p-l-1 font-thin white line-height-70 font-size-50">${kapp.getAttributeValue("Company Name")}</h1>
        </a>
<!-- Profile -->
      <div class="dropdown pull-right border-none m-a-0 p-a-1">          
        <a id="profile" href="#" class="dropdown-toggle p-a-0" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
          <div class="avatar line-height-50">
            <bundle:gravatar email="${identity.username}" sz="48" >
            </bundle:gravatar>
          </div>
        </a>
        <div class="dropdown-menu dropdown-menu-right p-a-1">
            <p class="font-medium m-b-0">${identity.username}</p>
            <div class="navAccount font-medium">
                <a href="${bundle.spaceLocation}/${kapp.slug}/profile-page">Your Account</a>
            </div>
        </div>
      </div>
<!-- categories -->
        <div class="dropdown pull-right border-none m-a-0 p-a-1">          
          <a id="categories" href="#" class="dropdown-toggle p-a-0" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
            <i class="fa fa-th fa-3x line-height-50"></i>
          </a>
          <ul class="dropdown-menu dropdown-menu-right">
            <c:forEach var="kapps" items="${space.kapps}">
              <li> 
                <a href="/kinetic/${space.slug}/${kapps.slug}">
                  <i class="fa ${kapps.getAttributeValue("fa-logo")} fa-1x pull-left"></i>
                  <div class="pull-right">${kapps.name}</div>
                </a>
              </li>
            </c:forEach>
          </ul>
        </div>
    </div>
  </nav>
</header>

