<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>

<link rel="stylesheet" type="text/css" href="${bundle.packageLocation}/css/temp.css"/>

 <header class="header clearfix">
  <nav class="navbar navbar-default overlay mgn-bot-none">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
         <button id="navbar-3" type="button" class="navbar-toggle border-none mgn-none pad-10" data-toggle="collapse" data-target="#navbar-collapse-3" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class=" "><i class="fa fa-search fa-3x line-height-50"></i></span>
        </button>
        <a href="${bundle.spaceLocation}/${kapp.slug}" class="navbar-brand pad-none">
           <h1 class="pad-lft-10 font-thin white line-height-70 font-size-50">${kapp.getAttributeValue("Company Name")}</h1>
        </a>
      </div>
 
<!-- Collect the nav links, forms, and other content for toggling -->
<!-- Profile -->
      <div class="dropdown mgn-lft-10 mgn-top-10 pull-right">          
        <a href="#" class="dropdown-toggle pad-none" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
          <div class="avatar">
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
<!--        <div class="nav navbar-nav ">-->
          <div class="dropdown pull-right mgn-lft-10 mgn-top-10">          
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
          </div>
          <c:forEach var="kapps" items="${space.kapps}">
<!--            <li class="visible-xs"> 
              <a class="pad-none" href="/kinetic/${space.slug}/${kapps.slug}">
                <i class="fa ${kapps.getAttributeValue("FA Logo")} fa-1x white pad-rgt-10"></i>
                <div class="pull-right white">${kapps.name}</div>
              </a>
            </li>-->
          </c:forEach>
<!--        </div>-->
<!-- search -->
        <div class="collapse navbar-collapse pull-right" id="navbar-collapse-3"> 
         <div class="visible-xs"
           <form role="form"> 
             <div class="form-group has-feedback">
               <input type="text" class="form-control" placeholder="search"/>
             </div>
           </form>
         </div>
        </div>
    </div>
  </nav>
</header>

