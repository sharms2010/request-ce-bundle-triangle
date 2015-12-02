<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>
 <link rel="stylesheet" type="text/css" href="${bundle.packageLocation}/css/temp.css"/>
<header class="header clearfix">
  <nav class="navbar navbar-default overlay mgn-bot-none">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle mgn-bot-none border-none mgn-top-10 pad-10" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class=" "><i class="fa fa-th fa-3x"></i></span>
        </button>
        <a href="${bundle.spaceLocation}/${kapp.slug}" id="logo" class="navbar-brand font-thin white">${kapp.getAttributeValue("Company Name")}</a>
      </div>

<!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav pull-right">
          <li class="display-inl-blk">
            <a class="profile" href="javascript:void(0)" data-target="div.user-card">
              <div class="avatar">
                <bundle:gravatar email="${identity.username}" sz="48" >
                </bundle:gravatar>
              </div>
            </a>
          </li>
          <li class="display-inl-blk pos-top-10"> 
            <p class="font-medium white mgn-bot-none">Hello ${identity.username}</p>
            <div class="navAccount font-medium"><a href="${bundle.spaceLocation}/${kapp.slug}/profile-page">Your Account</a></div>
          </li>
          <li class="dropdown hidden-xs mgn-lft-10 mgn-top-10">          
            <a href="#" class="dropdown-toggle pad-none" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
              <i class="fa fa-th fa-3x pad-10"></i>
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
          </li>
          <c:forEach var="kapps" items="${space.kapps}">
            <li class="visible-xs"> 
              <a href="/kinetic/${space.slug}/${kapps.slug}">
                  <div class="pull-right">${kapps.name}</div>
                <i class="fa ${kapps.getAttributeValue("FA Logo")} fa-1x pull-right"></i>
                
              </a>
            </li>
          </c:forEach>
          <li class="visible-xs"> 
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

