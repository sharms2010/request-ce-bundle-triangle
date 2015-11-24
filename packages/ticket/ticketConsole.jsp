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
        <bundle:script src="${bundle.packagePath}/js/ticketConsole.js "/>
    </bundle:scriptpack>
    <bundle:stylepack>
        <bundle:style src="${bundle.packagePath}/css/ticketConsole.css "/>
    </bundle:stylepack>


<div class="container mgn-bot-40 mgn-top-40 search-catalog">

    <div class="container mgn-bot-40">
      <div>

        <div class="col-sm-5 leftside">
        <div class="btn-group" role="group" aria-label="">
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
        </br></br>
          <div class="panel panel-default">
            <div class="panel-heading background-tertiary">
              <div class="panel-title">
                <h4>
                  TICKETS
                <button class="btn btn-info btn-xs btn-filter pull-right"><i class="fa fa-sort-amount-desc" ></i>
                </button>
                <div class="btn-group btn-filter pull-right">
                <button class="btn btn-info btn-xs btn-filter pull-right dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-filter" ></i></button>
                    <ul class="dropdown-menu pull-right ticket-sort" role="menu" aria-labelledby="ticketListSort">
                        <form>
                          <li role="presentation" class="form-group">
                            <label for="ticketStatus">Status</label>
                            <select name="ticketStatus" class="form-control">
                              <option value="All">All</option>
                              <option value="Unassigned">Unassigned</option>
                              <option value="Assigned">Assigned</option>
                              <option value="Working">Working</option>
                              <option value="Waiting">Waiting</option>
                              <option value="Resolved">Resolved</option>
                              <option value="Completed">Completed</option>
                            </select>
                          </li>
                          <li role="separator" class="divider"></li>
                           <li role="presentation" class="form-group">
                            <label for="ticketAge">Age</label>
                            <select name="ticketAge" class="form-control">
                              <option value="All">All</option>
                              <option value="Today">Today</option>
                              <option value="This Week">This Week</option>
                              <option value="Last Week">Last Week</option>
                              <option value="This Month">This Month</option>
                              <option value="Last Month">Last Month</option>
                              <option value="Older">Older</option>
                            </select>
                          </li>
                          <li>
                            <button class="btn btn-info">Reset</button>
                          </li>
                        </form>
                    </ul>
                </div>
                <button class="btn btn-info btn-xs btn-filter pull-right"><i class="fa fa-refresh"></i></button>
                </h4>
              </div>
            </div>
            <div>
                <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
            </div>
          </div>

          </div>
        <div class="col-sm-7">
        <button id="submitNew" type="submit" class="btn btn-default">Submit New</button>
          </br></br>
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
                  <dl class="dl-horizontal">
                      <dt>Submission ID:</dt><dd class="detail-submission-id"></dd>
                      <dt>Customer Name:</dt><dd class="detail-customer-name"></dd>
                      <dt>Customer Email:</dt><dd class="detail-customer-email"></dd>
                      <dt>Customer Phone:</dt><dd class="detail-customer-phone"></dd>
                      <hr></hr>
                      <dt>Summary:</dt><dd class="detail-summary"></dd>
                      <hr></hr>
                      <dt>Description:</dt><dd class="detail-description"></dd>
                      <hr></hr>
                      <dt>Waiting On:</dt><dd class="detail-waitingon"></dd>
                      <dt>Categorization:</dt><dd class="detail-categorization"></dd>
                      <dt>Method Received:</dt><dd class="detail-method"></dd>
                  </dl>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="notes" aria-labelledby="notes-tab">
                  Notes content will go here, waiting on sub-forms
                </div>
                <div role="tabpanel" class="tab-pane fade" id="resolution" aria-labelledby="resolution-tab">
                  Resolution content
                </div>
                <div role="tabpanel" class="tab-pane fade" id="related" aria-labelledby="related-tab">
                  Related content will go here, waiting on sub-forms
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>



    <app:bodyContent/>
</bundle:layout>
