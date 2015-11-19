<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>

  <bundle:scriptpack>
      <bundle:script src="${bundle.packagePath}/js/catalog.js" />
  </bundle:scriptpack>

<div id="tealnav">
  <div class="container">
    <div class="row">
        <ul>
          <c:forEach items="${kapp.categories}" var="category">
            <li>
              <a class="white hidden-xs" href="${bundle.spaceLocation}/${kapp.slug}/categories?category=${category.name}">${app:escape(category.name)} </a>
            </li>
          </c:forEach>
     	</ul>
    </div>
  </div>
</div>


         