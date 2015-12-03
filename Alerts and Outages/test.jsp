<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<% 
    java.util.Map<String,String[]> searchOptions = new java.util.HashMap<>();
    searchOptions.put("end", new String[] {"2015-12-30T21:00:00.000Z"} );
    searchOptions.put("start", new String[] {"2015-11-01T21:00:00.000Z"} );
    searchOptions.put("limit", new String[] {"1"} );
    request.setAttribute("searchOptions", searchOptions); 
    
 %>


<c:forEach items="${submissions.searchByKapp(kapp,searchOptions)}" var="submission">
   <p>${submission.submittedAt}</p>
   <div>${submission.getValue('Details').value}</div>
</c:forEach>
