<%@page pageEncoding="UTF-8" contentType="text/plain" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>
<%@page import="com.kineticdata.bundles.*"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.util.Date"%>
<%
    // Set the helper
    request.setAttribute("time", new TimeHelper());
    // Create the JSP variables
    Date date = new Date(0);
    Instant instant = Instant.EPOCH;
    String string = "1970-01-01T00:00:00Z";
    ZoneId zoneId = ZoneId.of("America/Chicago");
    // Create the JSTL variables
    request.setAttribute("zoneId", zoneId);
    request.setAttribute("date", date);
    request.setAttribute("instant", instant);
    request.setAttribute("string", string);
%>
<%----%>
add(Instant instant, long number, String unit, ZoneId timeZone): ${time.add(instant, 1, "day", zoneId)} - <%= Time.add(instant, 1, "day", zoneId).toString() %>
add(Instant instant, long number, String unit, String timeZoneString): ${time.add(instant, 1, "day", "America/Chicago")} - <%= Time.add(instant, 1, "day", "America/Chicago").toString() %>
add(Date date, long number, String unit, ZoneId timeZone): ${time.add(date, 1, "day", zoneId)} - <%= Time.add(date, 1, "day", zoneId).toString() %>