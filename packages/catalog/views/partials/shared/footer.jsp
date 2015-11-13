<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../../../package/initialization.jspf" %>

<footer class="footer">
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
              <div>
                <h4>FOOTER HERE</h4>
              </div>
              <div>
                <h4>Me gusta la clase de español porque es divertido. Me no gusta la clase de comunicación porque es el lunes y miércoles. Me no gusta la universidad porque es lejos de mi casa. Me gusta la clase de computación porque computación es mi especialización. Me gusta mi compañeros. Son muy inteligente.</h4>
              </div>
          </div>
          <div class="col-md-3 visible-md-inline-block visible-lg-inline-block">
              <div>
                <h4>LINKS HERE</h4>
              </div>
              <div>
                <h5><a href="#">Links aquí</a></h5>
                <h5><a href="#">يرتبط هنا؟</a></h5>
                <h5><a href="#">liens ici</a></h5>
                <h5><a href="#">এখানে লিংক</a></h5>
                <h5><a href="#">這裡友情鏈接</a></h5>
              </div>
          </div>
          <div class="col-md-3 visible-md-inline-block visible-lg-inline-block">
              <div>
                <h4>LINKS HERE</h4>
              </div>
              <div>
                <h5><a href="#">ಸಂಪರ್ಕ ಕೂಡುತ್ತದೆ</a></h5>
                <h5><a href="#">לינקס דאָ</a></h5>
                <h5><a href="#">linki tutaj</a></h5>
                <h5><a href="#">länkar här</a></h5>
                <h5><a href="#">ການເຊື່ອມຕໍ່ທີ່ນີ້</a></h5>
              </div>
          </div>
        </div>
      </div>
    </div>
</footer>
<div class="subfooter">
  <div class="container">
    <div>Build Date: ${buildDate}</div>
    <div>Build Number: ${buildNumber}</div>
    <div>Version: ${buildVersion}</div>
  </div>
<div>

<!-- having the script tag her is a temporary work around due to url issue so that the twitter feed will show on the kapp page-->
   <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
   </script>