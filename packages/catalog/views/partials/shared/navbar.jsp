<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>
 <link rel="stylesheet" type="text/css" href="${bundle.packageLocation}/css/temp.css"/>
<header class="header margin-bottom-40">
      <div class="overlay">
        <div class="container">
          <div class="row">
            <div id="logo" class="col-xs-6 col-sm-6 col-md-8 col-lg-9">
              ${kapp.getAttributeValue("Company Name")}
            </div>
            <div class="col-sm-4 col-md-3 col-lg-2 hidden-xs identity-block">
              <div class="row">
                <div class="col-sm-4 col-xs-4">
                  <a class="profile" href="javascript:void(0)" data-target="div.user-card">
                    <i class="gravatar-icon">
                      <img src="https://lh4.googleusercontent.com/-6RDPOohcFhI/AAAAAAAAAAI/AAAAAAAAAAw/3xMmdleVrLU/photo.jpg?sz=50" alt="Profile Image" class="avatar">
                    </i>
                  </a>
                </div>
                <div class="col-sm-8 col-xs-8">
                  <p class="navName">Hello Mike</p>
                  <div class="navAccount"><a href="#">Your Account</a></div>
                </div>
              </div>
            </div>
            <div class="dropdown">
              <div class=" dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                <div class="col-xs-6 col-sm-2 col-md-1 col-lg-1">
                  <i class="fa fa-th fa-3x pull-right"></i>
                </div>
              <span class="caret"></span>
              </div>
              <ul class="dropdown-menu pull-right" aria-labelledby="dropdownMenu1">
                <c:forEach items="${space.kapps}" var="kappX">
                  <li class="visible-xs-inline-block"> 
                    <div>${kappX.name}
                  </li>
                </c:forEach>
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
        </div>
      </div>
    </header>

