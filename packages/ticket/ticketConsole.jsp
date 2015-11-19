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
      <div>
        <div class="btn-group" role="group" aria-label="...">
          <button type="submit" class="btn btn-info">My Own
            <span class="badge">4</span>
          </button>
          <button type="submit" class="btn btn-default">My Groups
            <span class="badge">16</span>
          </button>
          <button type="submit" class="btn btn-default">Unassigned
            <span class="badge">7</span>
          </button>
        </div>
        <button type="submit" class="btn btn-default">Submit New</button>
      </br></br></br>
        <div class="col-sm-5 leftside">
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
            <div>
                <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                <center>
                  <a href="${bundle.spaceLocation}/${kapp.slug}/my-requests">VIEW MORE</a>
                </center>
            </div>
          </div>

          </div>
        <div class="col-sm-7">
          <div class="panel panel-default">
            <div class="panel-heading background-tertiary">
              <div class="panel-title"><h4>DETAILS</h4></div>
            </div>
            <div class="panel-body">
              <div>
                <ul id="ticketDetailTabs" class="nav nav-tabs">
                  <li role="presentation" class="active">
                    <a id="detail-tab" href="#detail" role="tab" data-toggle="tab" aria-controls="detail" aria-expanded="true">Detail</a>
                  </li>
                  <li role="presentation">
                    <a id="notes-tab" href="#notes" role="tab" data-toggle="tab" aria-controls="notes">Notes</a></li>
                  <li role="presentation">
                    <a id="resolution-tab" href="#resolution" role="tab" data-toggle="tab" aria-controls="resolution">Resolution</a></li>
                  <li role="presentation">
                    <a id="related-tab" href="#related" role="tab" data-toggle="tab" aria-controls="related">Related</a></li>
                </ul>
                </br>
              </div>
              <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="detail" aria-labelledby="detail-tab">
                  Dtail content
                </div>
                <div role="tabpanel" class="tab-pane fade" id="notes" aria-labelledby="notes-tab">
                  Notes content
                </div>
                <div role="tabpanel" class="tab-pane fade" id="resolution" aria-labelledby="resolution-tab">
                  Resolution content
                </div>
                <div role="tabpanel" class="tab-pane fade" id="related" aria-labelledby="related-tab">
                  Related Content
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


    <app:bodyContent/>
</bundle:layout>
