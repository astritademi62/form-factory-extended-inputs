<%--<link href="path/to/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />--%>
<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
<%--<!-- piexif.min.js is only needed if you wish to resize images before upload to restore exif data.--%>
<%--This must be loaded before fileinput.min.js -->--%>
<%--<script src="path/to/js/plugins/piexif.min.js" type="text/javascript"></script>--%>
<%--<!-- sortable.min.js is only needed if you wish to sort / rearrange files in initial preview.--%>
<%--This must be loaded before fileinput.min.js -->--%>
<%--<script src="path/to/js/plugins/sortable.min.js" type="text/javascript"></script>--%>
<%--<!-- purify.min.js is only needed if you wish to purify HTML content in your preview for HTML files.--%>
<%--This must be loaded before fileinput.min.js -->--%>
<%--<script src="path/to/js/plugins/purify.min.js" type="text/javascript"></script>--%>
<%--<!-- the main fileinput plugin file -->--%>
<%--<script src="path/to/js/fileinput.min.js"></script>--%>
<%--<!-- bootstrap.js below is needed if you wish to zoom and view file content--%>
<%--in a larger detailed modal dialog -->--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>--%>
<%--<!-- optionally if you need a theme like font awesome theme you can include--%>
<%--it as mentioned below -->--%>
<%--<script src="path/to/themes/fa/theme.js"></script>--%>
<%--<!-- optionally if you need translation for your language then include--%>
<%--locale file as mentioned below -->--%>
<%--<script src="path/to/js/locales/<lang>.js"></script>--%>
<div class="row">
    <div class="col-sm-12 text-right" ng-if="!inTranslateMode">
        <label>
            <span>Sample File Input</span>
        </label>
            <br>
        <label>
            <input id="input-01" type="file" class="file" angular-bfi/>

        </label>


    </div>
</div>
