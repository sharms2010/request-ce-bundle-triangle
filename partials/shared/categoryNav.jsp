<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>

<div id="tealnav">
  <div class="container">
    <div class="row">
        <ul>
          <c:forEach items="${kapp.categories}" var="category">
            <li>
                <span class="fa-stack fa-2x center-block hidden-xs">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
              <a class="white hidden-xs" href="${bundle.spaceLocation}/${kapp.slug}/categories?category=${category.name}">${category.name} </a>
            </li>
          </c:forEach>
     	</ul>
    </div>
  </div>
</div>


         