<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<% com.kineticdata.core.authentication.Identity identity = 
        (com.kineticdata.core.authentication.Identity) request.getAttribute("identity");
    java.util.Map<String,String[]> searchOptions = new java.util.HashMap<>();
    searchOptions.put("createdBy", new String[] {identity.getUsername()});
    searchOptions.put("end", new String[] {"2015-11-30T21:00:00.000Z"} );
    searchOptions.put("start", new String[] {"2015-11-01T21:00:00.000Z"} );
    request.setAttribute("searchOptions", searchOptions); 
    String view = "catalog";
    request.setAttribute("view", view);    
 %>

<bundle:layout page="views/layouts/packageLayout.jsp">
  <bundle:variable name="head">
      <title>Kinetic Data ${app:escape(kapp.name)}</title>
  </bundle:variable>
  <bundle:scriptpack>
      <bundle:script src="${bundle.packagePath}/js/catalog.js" />
  </bundle:scriptpack>
  <bundle:stylepack>
      <bundle:style src="${bundle.packagePath}/css/catalog.css "/>
  </bundle:stylepack>
 
  <div class="container hidden-xs mgn-bot-40 mgn-top-40 search-catalog">
    <h1 class="pad-bot-10 text-center">How can we help you today?!</h1>
    <form role="form"> 
      <div class="form-group has-feedback">
        <input type="text" class="form-control" />
        <i class="form-control-feedback fa fa-search search-catalog-icon"></i>
      </div>
    </form>
  </div>
  <div id="tealnav" class="mgn-bot-40">
    <div class="container">
      <div class="row">
        <c:forEach var="category" items="${kapp.categories}">
          <div class="col-sm-odd col-xs-odd">
            <a class="white" href="${bundle.spaceLocation}/${kapp.slug}/categories?category=${category.name}">
              <div class="box text-center">
                <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("FA Logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <div class="hidden-xs font-light">${app:escape(category.name)}</div>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <div class="container mgn-bot-40">
    <div class="row">
      <div class="col-sm-7 leftside">
        <div class="panel panel-default">
          <div class="panel-heading background-tertiary">
            <div class="panel-title"><h4 class="white">YOUR REQUESTS</h4></div>
          </div>
          <div class="panel-body">
            <table class="table mgn-none">
              <thead>
                <tr>
                  <td class="font-bold pad-top-none gray">SUMMARY</td>
                  <td class="font-bold pad-top-none text-right gray hidden-xs">STATUS</td>
                </tr>
              </thead>
              <tbody>
                <c:set var="table" value="request" scope="session"/>
                <h3>${app:escape(form.name)}</h3>
                <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
              </tbody>
              <tfoot>
                <tr>
                  <td class="font-bold" colspan="2"><center><a href="${bundle.spaceLocation}/${kapp.slug}/my-requests">VIEW MORE</a></center></td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
        <div class="panel panel-default ">
          <div class="panel-heading background-tertiary">
            <div class="panel-title"><h4 class="white">YOUR APPROVALS</h4></div>
          </div>
            <div class="panel-body">
              <table class="table mgn-none">
                <thead>
                  <tr>
                    <td class="font-bold pad-top-none gray">SUMMARY</td>
                    <td class="font-bold pad-top-none text-right gray hidden-xs">STATUS</td>
                  </tr>
                </thead>
                <tbody>
                  <c:set var="table" value="approval" scope="session"/>
                  <h3>${app:escape(form.name)}</h3>
                  <c:import url="views/partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
                </tbody>
                <tfoot>
                  <tr>
                    <td class="font-bold" colspan="2"><center><a href="#">VIEW MORE</a></center></td>
                  </tr>
                </tfoot>
              </table>
             </div>
          </div>
        </div>
      <div class="col-sm-5">
        <div class="panel panel-default">
          <div class="panel-heading background-quaternary">
            <div class="panel-title"><h4>ALERTS &amp OUTAGES</h4></div>
          </div>
          <div class="panel-body">
            <p>PeopleSoft offline October 17-18</p>
            <div>PeopleSoft will be offline this weekend for routine updates starting at midnight Friday, October 16. The system should be back online by Monday, October 19 at 8:00am.</div>
          </div>
        </div>
        <div class=" hidden-xs">
        <a class="twitter-timeline" href="https://twitter.com/KineticData" data-widget-id="569678005275226112" data-chrome="nofooter">Tweets by @KineticData</a>
        </div>
      </div>
    </div>
  </div>
  <app:bodyContent/>
</bundle:layout>
