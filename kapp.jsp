<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="bundle/initialization.jspf" %>

<% 
    String view = "catalog";
    request.setAttribute("view", view);    
 %>

<bundle:layout page="layouts/layout.jsp">
  <bundle:variable name="head">
      <title>Kinetic Data ${text.escape(kapp.name)}</title>
  </bundle:variable>
    <bundle:scriptpack>
        <bundle:script src="${bundle.location}/js/catalog.js" />
    </bundle:scriptpack>
  <bundle:stylepack>
      <bundle:style src="${bundle.location}/css/catalog.css "/>
  </bundle:stylepack>
      
 <!-- search -->
  <div class="container hidden-xs m-b-4 m-t-4 search-catalog">
    <h1 class="p-b-1 text-center">How can we help you today?</h1>
    <form action="/where" method="GET" role="form"> 
      <div class="form-group has-feedback">
        <input type="text" class="states form-control test buttonPress y" name="states"/>
        <i class="form-control-feedback fa fa-search search-catalog-icon"></i>
      </div>
    </form>  
  </div>
    <div class="container visible-xs m-b-4 m-t-4 search-catalog"> 
       <form action="/where" method="GET" class="border-none m-a-0" role="search"> 
         <div class="form-group">
           <input type="text" class="states form-control test buttonPress x" placeholder="search" name="states"/>
         </div>
       </form>
    </div>

  <div id="tealnav" class="m-b-4">
    <div class="container">
      <div class="row">
        <c:forEach var="category" items="${kapp.categories}">
          <div class="col-sm-odd col-xs-odd">
            <a class="white" href="${bundle.spaceLocation}/${kapp.slug}/categories?category=${category.name}">
              <div class="box text-center">
                <span class="fa-stack fa-4x center-block hidden-sm hidden-xs">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-3x center-block visible-sm-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <span class="fa-stack fa-2x center-block visible-xs-inline-block">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa ${category.getAttributeValue("fa-logo")} fa-stack-1x fa-inverse"></i>
                </span>
                <div class="hidden-xs font-light">${text.escape(category.name)}</div>
                <h5 class="visible-xs font-bold">${text.escape(category.name)}</h5>
              </div>
            </a>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <div class="container m-b-4">
    <div class="row">
      <div class="col-sm-7 leftside">
        <div class="panel panel-default">
          <div class="panel-heading background-tertiary">
            <div class="panel-title"><h4 class="white">YOUR REQUESTS</h4></div>
          </div>
          <div class="panel-body">
            <table class="table m-a-0">
              <thead>
                <tr>
                  <td class="font-bold p-t-0 gray">SUMMARY</td>
                  <td class="font-bold p-t-0 text-right gray hidden-xs">STATUS</td>
                </tr>
              </thead>
              <tbody>
                <c:set var="table" value="request" scope="session"/>
                <h3>${text.escape(form.name)}</h3>
                <c:import url="partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
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
              <table class="table m-a-0">
                <thead>
                  <tr>
                    <td class="font-bold p-t-0 gray">SUMMARY</td>
                    <td class="font-bold p-t-0 text-right gray hidden-xs">STATUS</td>
                  </tr>
                </thead>
                <tbody>
                  <c:set var="table" value="approval" scope="session"/>
                  <h3>${text.escape(form.name)}</h3>
                  <c:import url="partials/static/submissionsByKapp.jsp" charEncoding="UTF-8"/>
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
            <div class="panel-title"><h4>ALERTS</h4></div>
          </div>
          <c:import url="partials/static/alerts.jsp" charEncoding="UTF-8"/>
        </div>
        <div class=" hidden-xs">
        <a class="twitter-timeline" href="https://twitter.com/KineticData" data-widget-id="569678005275226112" data-chrome="nofooter">Tweets by @KineticData</a>
        </div>
      </div>
    </div>
  </div>
  <app:bodyContent/>
</bundle:layout>

 <script>
    var data = <json:array  name="array" var="form" items="${kapp.forms}">
                    <c:if test="${(form.type.name == 'Service') || (form.type.name == 'Template')}">
                    <json:object>
                        <json:property name="formName" value="${form.name}"/>
                        <json:property name="formSlug" value="${form.slug}"/>
                    </json:object>
                    </c:if>
                </json:array>;
                    
    forms = [];
    map = {};                  
                    
    $.each(data, function (i, form) {
        map[form.formName] = form;
        forms.push(form.formName);
    });
    
    var substringMatcher = function(strs) {
            return function findMatches(q, cb) {
        var matches, substringRegex;

        // an array that will be populated with substring matches
        matches = [];

        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');

        // iterate through the pool of strings and for any string that
        // contains the substring `q`, add it to the `matches` array
        $.each(strs, function(i, str) {
            if (substrRegex.test(str)) {
            matches.push(str);
            }
        });

        cb(matches);
        };
    };           
    
    $('.test').typeahead({
        hint: true,
        highlight: true,
        minLength: 1,
    },
    {
        source: substringMatcher(forms)
    }).on('typeahead:selected', function(event, datum) {
        window.location.href = window.bundle.kappLocation() + "/" + map[datum].formSlug;
});;

</script>