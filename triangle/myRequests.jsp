<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>
<%
    com.kineticdata.core.authentication.Identity identity = 
        (com.kineticdata.core.authentication.Identity) request.getAttribute("identity");
    java.util.Map<String,String[]> searchOptions = new java.util.HashMap<>();
    searchOptions.put("createdBy", new String[] {identity.getUsername()});
    request.setAttribute("searchOptions", searchOptions);
    searchOptions.put("end", new String[] {"2015-11-30T21:00:00.000Z"} );
    searchOptions.put("start", new String[] {"2015-11-01T21:00:00.000Z"} );
    String view = "submissions";
    request.setAttribute("view", view);
%>
<bundle:layout page="layouts/layout.jsp">
    <c:import url="${bundle.packagePath}/views/partials/shared/categoryNav.jsp" charEncoding="UTF-8"/>
    <bundle:scriptpack>
        <bundle:script src="${bundle.packagePath}/js/myRequests.js" />
    </bundle:scriptpack>
    <bundle:stylepack>
        <bundle:style src="${bundle.packagePath}/css/myRequests.css "/>
    </bundle:stylepack>
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>
    <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
    <app:bodyContent/>
</bundle:layout>
