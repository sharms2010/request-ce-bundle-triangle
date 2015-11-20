<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>
<header class="header">
  <nav class="navbar navbar-default overlay mgn-none">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class=" "><i class="fa fa-th fa-3x"></i></span>
        </button>
      </div>

<!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav pull-right">
          <li>
            <a class="profile" href="javascript:void(0)" data-target="div.user-card">
              <div class="avatar">
                <bundle:gravatar email="${identity.username}" sz="48" >
                </bundle:gravatar>
              </div>
            </a>
          </li>
          <li> 
            <p class="navName font-medium white">Hello ${identity.username}</p>
            <div class="navAccount font-medium"><a href="${bundle.spaceLocation}/${kapp.slug}/profile-page">Your Account</a></div>
          </li>
          <li class="dropdown">          
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
              <i class="fa fa-th fa-3x"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <c:forEach var="kapps" items="${space.kapps}">
                <li> 
                  <a href="/kinetic/${space.slug}/${kapps.slug}">
                    <i class="fa ${kapps.getAttributeValue("FA logo")} fa-1x pull-left"></i>
                    <div class="pull-right">${kapps.name}</div>
                  </a>
                </li>
              </c:forEach>
            </ul>
          </li>
           <li class="visible-xs-inline-block"> 
                <form role="form"> 
                  <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="search"/>
                  </div>
                </form>
              </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

