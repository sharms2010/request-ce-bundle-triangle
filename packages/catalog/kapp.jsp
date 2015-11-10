<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="package/initialization.jspf" %>

<bundle:layout page="views/layouts/packageLayout.jsp">
    <bundle:variable name="head">
        <title>Kinetic Data ${app:escape(kapp.name)}</title>
        <link rel="stylesheet" type="text/css" href="${bundle.packageLocation}/css/temp.css"/>
    </bundle:variable>
    
   
<div class="container hidden-xs margin-bottom-40 index">
      <h1 id="search-title">How can we help you today?</h1>
      <form role="form"> 
        <div class="form-group has-feedback">
          <input type="text" class="form-control" />
          <i class="form-control-feedback fa fa-search"></i>
        </div>
      </form>
    </div>
    <div id="tealnav" class="margin-bottom-40">
      <div class="container">
        <div class="row">
          <c:forEach items="${kapp.categories}" var="category">
            <div class="col-sm-odd col-xs-odd">
              <div class="box text-center">
                <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("Category FA logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("Category FA logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("Category FA logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <div class="hidden-xs">${app:escape(category.name)}</div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-sm-7 leftside">
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title"><h4>YOUR REQUESTS</h4></div>
            </div>
              <div class="panel-body">
                <table class="table">
                  <thead>
                    <tr>
                      <td>SUMMARY</td>
                      <td class="hidden-xs">STATUS</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>HR Request: Employee Onboarding Request</td>
                      <td class="hidden-xs" rowspan="2">Incomplete</td>
                    </tr>
                    <tr>
                      <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
                    </tr>
                    <tr>
                      <td>IT Request: iPad Request</td>
                      <td class="hidden-xs" rowspan="2">Approved</td>
                    </tr>
                    <tr>
                      <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
                    </tr>
                    <tr>
                      <td>HR Request: Employee Onboarding Request</td>
                      <td class="hidden-xs" rowspan="2">Fulfilled</td>
                    </tr>
                    <tr>
                      <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"><center><a href="#">VIEW MORE</a></center></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          <div class="panel panel-default">
            <div class="panel-heading">
              <div class="panel-title"><h4>YOUR APPROVALS</h4></div>
            </div>
              <div class="panel-body">
                <table class="table">
                  <thead>
                    <tr>
                      <td>SUMMARY</td>
                      <td class="hidden-xs">STATUS</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>HR Request: Employee Onboarding Request</td>
                      <td class="hidden-xs" rowspan="2">Incomplete</td>
                    </tr>
                    <tr>
                      <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
                    </tr>
                    <tr>
                      <td>IT Request: iPad Request</td>
                      <td class="hidden-xs" rowspan="2">Approved</td>
                    </tr>
                    <tr>
                      <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
                    </tr>
                    <tr>
                      <td>HR Request: Employee Onboarding Request</td>
                      <td class="hidden-xs" rowspan="2">Fulfilled</td>
                    </tr>
                    <tr>
                      <td><a href="#">Request #KR0000000000788923 - 10/28/2015</a></td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2"><center><a href="#">VIEW MORE</a></center></td>
                    </tr>
                  </tfoot>
                </table>
               </div>
            </div>
          </div>
        <div class="col-sm-5 rightside">
          <div class="panel panel-default">
            <div class="panel-heading">
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
