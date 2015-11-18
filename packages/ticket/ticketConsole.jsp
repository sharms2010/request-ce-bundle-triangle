<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<% com.kineticdata.core.authentication.Identity identity = 
        (com.kineticdata.core.authentication.Identity) request.getAttribute("identity");
    java.util.Map<String,String[]> searchOptions = new java.util.HashMap<>();
    searchOptions.put("createdBy", new String[] {identity.getUsername()});
    searchOptions.put("end", new String[] {"2015-12-17T21:00:00.000Z"} );
    searchOptions.put("start", new String[] {"2015-10-05T21:00:00.000Z"} );
    request.setAttribute("searchOptions", searchOptions); 
    String view = "catalog";
    request.setAttribute("view", view);    
 %>

<bundle:layout page="views/layouts/packageLayout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
    </bundle:variable>
    <bundle:scriptpack>
    </bundle:scriptpack>
    <bundle:stylepack>
        <bundle:style src="${bundle.packagePath}/css/ticketConsole.css "/>
    </bundle:stylepack>


<div class="container hidden-xs mgn-bot-40 mgn-top-40 search-catalog">

    <div class="container mgn-bot-40">
      <div class="row">
        <div class="btn-group col-sm-12" role="group" aria-label="...">
          <button type="submit" class="btn btn-info">My Tickets</button>
          <button type="submit" class="btn btn-default">Group Tickets</button>
          <button type="submit" class="btn btn-default">Unassigned Tickets</button>
        </div></br></br></br>
        <div class="col-sm-4 leftside">
          <div class="panel panel-default">
            <div class="panel-heading background-tertiary">
              <div class="panel-title">
                <h4>
                  OPEN TICKETS
                <button class="btn btn-info btn-xs pull-right dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-sort-amount-desc" ></i></button>
                <button class="btn btn-info btn-xs pull-right dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-filter" ></i></button>
                <button class="btn btn-info btn-xs pull-right"><i class="fa fa-refresh"></i></button>
                </h4>
              </div>
            </div>
            <div class="panel-body">

              <table class="mgn-none">
                <thead>
                  <tr>
                  </tr>
                </thead>
                <tbody>
                  <c:set var="table" value="request" scope="session"/>
                  <h3>${app:escape(form.name)}</h3>
                  <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                </tbody>
                <tfoot>
                  <tr>
                    <td colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}/my-requests">VIEW MORE</a></center></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>

          </div>
        <div class="col-sm-8">
          <div class="panel panel-default">
            <div class="panel-heading background-tertiary">
              <div class="panel-title"><h4>DETAILS</h4></div>
            </div>
            <div class="panel-body">
              
            </div>
          </div>
        </div>
      </div>
    </div>


    <app:bodyContent/>
</bundle:layout>
