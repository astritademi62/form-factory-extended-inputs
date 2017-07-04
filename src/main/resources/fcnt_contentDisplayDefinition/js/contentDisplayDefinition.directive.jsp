<%@ page contentType="text/javascript" %>
<%@ taglib prefix="formfactory" uri="http://www.jahia.org/formfactory/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

(function() {
    var contentDisplay = function(ffTemplateResolver) {
        return {
            restrict: 'E',
            require: ['^ffController'],
            controller:contentDisplayController,
            controllerAs: 'cdc',
            bindToController: true,
            templateUrl: function(el, attrs) {
                return ffTemplateResolver.resolveTemplatePath('${formfactory:addFormFactoryModulePath('/form-factory-definitions/content-display', renderContext)}', attrs.viewType);
            },
            link: linkFunction
        };

        function linkFunction(scope, el, attr, ctrl) {
            scope.cdc.mode = attr.viewType === "designView" ? "design" : "live";
        }
    };
    var contentDisplayController = function($scope, $ffRH, $timeout, $filter,
                                            i18n, $element) {
        var cdc = this;
        cdc.parsed = {};
        cdc.i18nMessageGetter = i18n.message;
        cdc.mode = "";
        var titleEl;
        var bodyEl;
        cdc.$onInit = function() {
            //If title position is a string convert it to int
            if(isNaN($scope.input.titlePosition)) {
                $scope.input.titlePosition = .0;
            } else if (_.isString($scope.input.titlePosition)) {
                $scope.input.titlePosition = Number($scope.input.titlePosition);
            }
            //If values are store as string convert them to boolean
            if (_.isString($scope.input.displayTitle)) {
                $scope.input.displayTitle = $scope.input.displayTitle == 'true';
            }

            if (_.isString($scope.input.displayBorder)) {
                $scope.input.displayBorder = $scope.input.displayBorder == 'true'
            }
            $timeout(function(){
                titleEl = angular.element('#' + $scope.input.name + '_title');
                bodyEl = angular.element('#' + $scope.input.name + '_body');
                if (cdc.mode === "design") {
                    //This is the design view directive, so we need to get the bodyId from the builderInput view.
                    $scope.input.bodyId = bodyEl.attr('data-render-id');
                } else if (cdc.mode === "live") {
                    //Unregistered designview directive, register it now.
                    $scope.input.bodyId = $ffRH.registerRenderDirective(bodyEl, $scope, angular.copy($scope.input.body));
                    //set the id onto the contentDisplayBody div element.
                    bodyEl.attr('data-render-id', $scope.input.bodyId);
                    if ($scope.input.displayTitle) {
                        cdc.updateTitlePosition();
                    }
                    $scope.$on('$destroy', function() {
                        $ffRH.deregisterRenderDirective($scope.input.bodyId);
                    });
                }
            });

            //Apply custom class
        };

        cdc.onUpdateEditor = function() {
            $ffRH.recompileRenderDirective($scope.input.bodyId, angular.copy($scope.input.body));
        };

        cdc.updateTitleElementRef = function() {
            if ($scope.input.displayTitle) {
                //Wait for digest cycle to complete so that element is available
                $timeout(function() {
                    titleEl = angular.element('#' + $scope.input.name + '_title');
                    cdc.updateTitlePosition();
                });
            }
        };

        cdc.updateTitlePosition = function(action) {
            if (!$scope.input.displayTitle) {
                return;
            }
            var offset = .05;
            switch (action) {
                case 'indent':
                    if ($scope.input.titlePosition < .95) {
                        $scope.input.titlePosition += offset;
                    }
                    break;
                case 'outdent':
                    if ($scope.input.titlePosition >= 0.05) {
                        $scope.input.titlePosition -= offset;
                    }
                    break;
                default:
                    //Do nothing just update css class.
            }
            titleEl.css('left', (bodyEl.width() * $scope.input.titlePosition - 10) + 'px');
            adjustTitle(false);
        };

        cdc.syncTitle = function() {
            titleEl.html($scope.input.title);
            adjustTitle(true);
        };

        function adjustTitle(readjustment) {
            var paddingOffset = 10;
            //If text is too long then we have to ellipsis it.
            if ((titleEl.width() - paddingOffset + titleEl[0].offsetLeft) > bodyEl.width()) {
                titleEl.html($filter('ellipsis')(titleEl.html()));
                adjustTitle(true);
            } else {
                //Dont reset value if this is an ellipsis value that is being condensed even further
                if (readjustment) {
                    return;
                }
                titleEl.html(angular.copy($scope.input.title));
            }
        }
    };
    contentDisplayController.$inject = ['$scope', '$ffRenderHtmlService',
        '$timeout', '$filter', 'i18nService', '$element'];
    angular
        .module('formFactory')
        .directive('ffContentDisplay', ['ffTemplateResolver', contentDisplay]);
})();