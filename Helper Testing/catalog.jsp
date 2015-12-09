<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<bundle:layout page="views/layouts/packageLayout.jsp">
  <bundle:variable name="head">
      <title>Kinetic Data ${app:escape(kapp.name)}</title>
  </bundle:variable>
    <div class="container">
        <div class="row">
            <c:forEach var="form" items="${kapp.forms}">
                <c:if test="${form.type.name == "Template"}">
                    <a href="${bundle.spaceLocation}/${kapp.slug}/${form.slug}">
                        <h1>Alert & Outages submission form</h1>
                    </a>
                </c:if>
            </c:forEach>
        </div>
    </div>
</bundle:layout>