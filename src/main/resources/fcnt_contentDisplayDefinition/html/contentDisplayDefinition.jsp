<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-sm-12">
        <div ng-class="{'input-wrap': input.displayBorder, 'bottom5': input.displayBorder}">
            <div style="display:inline-block;height:10px;background-color:#ffffff">
                <h3 id="{{input.name}}" class="contentDisplayTitle" ng-if="input.displayTitle">{{$scope.input.title}}</h3>
            </div>
            <br/>
            <div class="contentDisplayBody">
                <ff-render-html model="input.body"></ff-render-html>
            </div>
        </div>
    </div>
</div>
<br/>