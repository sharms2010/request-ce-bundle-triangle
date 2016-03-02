<%@page pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@include file="../bundle/initialization.jspf" %>
<footer class="footer">
    <div class="footer__overlay footer_header m-a-0">
        <div class="container">
            <div class="row footer__content white">
                <div class="col-md-6">
                    <h4 class="footer__header--description m-b-1">About us</h4>
                    <div>
                        <p>Acme stands out as an industry leader in a competitive field.  The quality of our products has won us the trust of our customers and the admiration of our industry peers.  Acme has had numerous accolades bestowed upon us in our 150 years in the business.  If you think Acme can be a solution to a problem you are having please let us know.</h4>
                    </div>
                </div>
                <div class="col-md-3 visible-md-inline-block visible-lg-inline-block">
                    <h4 class="footer__header m-b-1">Kinetic Favorites</h4>
                    <ul class="list-unstyled">
                        <li><a href="http://getbootstrap.com/">Bootstrap</a><li>
                        <li><a href="https://jquery.com/">jQuery</a></li>
                        <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
                        <li><a href="http://www.kineticdata.com/">Kinetic Data</a></li>
                        <li><a href="http://www.exploreminnesota.com/index.aspx">Explore Minnesota</a></li>
                    </ul>
                </div>
                <div class="col-md-3 visible-md-inline-block visible-lg-inline-block">
                    <h4 class="footer__header m-b-1">Legal</h4>
                    <ul class="list-unstyled">
                        <li><a href="http://getbootstrap.com/">Terms</a></li>
                        <li><a href="https://jquery.com/">Legal</a></li>
                        <li><a href="https://www.ruby-lang.org/en/">Privacy</a></li>
                        <li><a href="http://www.kineticdata.com/">License</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>
<div class="background-white">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-8 gray line-height-60">
                <p>Build Date: ${buildDate}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="${bundle.spaceLocation}/${kapp.slug}/feedback">feedback</a></p>
            </div>
            <div class="col-md-6 col-sm-4">
                <ul class="social-links pull-right">
                    <li>
                        <a href="https://twitter.com/kineticdata" class="line-height-60">
                            <span class="fa-stack fa-fw fa-2x center-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                    <li>
                        <a href="https://facebook.com/kineticdata" class="line-height-60">
                            <span class="fa-stack fa-fw fa-2x center-block">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>
    <!-- having the script tag her is a temporary work around due to url issue so that the twitter feed will show on the kapp page-->
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
    </script>