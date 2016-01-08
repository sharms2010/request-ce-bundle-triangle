<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../bundle/initialization.jspf" %>

<footer class="footer p-a-0">
    <div class="footer__overlay m-a-0">
      <div class="container">
        <div class="row white">
          <div class="col-md-6">
              <div>
                <h4 class="m-b-1">FOOTER HERE</h4>
              </div>
              <div>
                <h4 class="m-t-1">Acme stands out as an industry leader in a competitive field.  The quality of our products has won us the trust of our customers and the admiration of our industry peers.  Acme has had numerous accolades bestowed upon us in our 150 years in the business.  If you think Acme can be a solution to a problem you are having please let us know.</h4>
              </div>
          </div>
          <div class="col-md-3 visible-md-inline-block visible-lg-inline-block">
              <div>
                <h4 class="m-b-1">LINKS HERE</h4>
              </div>
              <div>
                <h5><a href="http://getbootstrap.com/">Bootstrap</a></h5>
                <h5><a href="https://jquery.com/">jQuery</a></h5>
                <h5><a href="https://www.ruby-lang.org/en/">Ruby</a></h5>
                <h5><a href="http://www.kineticdata.com/">Kinetic Data</a></h5>
                <h5><a href="http://www.exploreminnesota.com/index.aspx">Explore Minnesota</a></h5>
              </div>
          </div>
          <div class="col-md-3 visible-md-inline-block visible-lg-inline-block">
              <div>
                <h4 class="m-b-1">LINKS HERE</h4>
              </div>
              <div>
               <h5><a href="http://getbootstrap.com/">ブートストラップ</a></h5>
                <h5><a href="https://jquery.com/">јКуери</a></h5>
                <h5><a href="https://www.ruby-lang.org/en/">hồng ngọc</a></h5>
                <h5><a href="http://www.kineticdata.com/">кінэтычная дадзеных</a></h5>
                <h5><a href="http://www.exploreminnesota.com/index.aspx">Εξερευνήστε Μινεσότα</a></h5>
              </div>
          </div>
        </div>
      </div>
    </div>
</footer>
<div class="p-t-1 background-white">
  <div class="container">
      <div class="row">
        <div class="col-md-3 col-sm-6 gray line-height-50">Build Date: ${buildDate}</div>
        <div class="col-md-3 col-sm-3 line-height-50"><a href="${bundle.spaceLocation}/${kapp.slug}/feedback">feedback</a></div>
        <div class="col-md-6 col-sm-3">
        <a href="https://twitter.com">
            <span class="fa-stack fa-2x center-block pull-right">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        <a href="https://facebook.com">
            <span class="fa-stack fa-2x center-block pull-right">
              <i class="fa fa-circle fa-stack-2x"></i>
              <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
            </span>
        </a>
        </div>
      </div>
    </div>
<div>

<!-- having the script tag her is a temporary work around due to url issue so that the twitter feed will show on the kapp page-->
   <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
   </script>