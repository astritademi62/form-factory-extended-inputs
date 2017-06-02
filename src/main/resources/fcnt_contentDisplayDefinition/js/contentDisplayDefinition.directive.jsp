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
        }
    };
    var contentDisplayController = function($scope, $ffRH, $timeout, $filter,
                                            i18n, $element) {
        var cdc = this;
        cdc.parsed = {};
        cdc.i18nMessageGetter = i18n.message;
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
                if (!$scope.input.bodyId) {
                    $scope.input.bodyId = $ffRH.registerRenderDirective($element.find('.contentDisplayBody'), $scope, angular.copy($scope.input.body));
                }
                titleEl = angular.element('#' + $scope.input.name);
                bodyEl = angular.element('.contentDisplayBody');
                cdc.updateTitlePosition();
            });
        };

        cdc.onUpdateEditor = function() {
            $ffRH.recompileRenderDirective($scope.input.bodyId, angular.copy($scope.input.body));
        };

        cdc.updateTitleElementRef = function() {
            if ($scope.input.displayTitle) {
                //Wait for digest cycle to complete so that element is available
                $timeout(function() {
                    titleEl = angular.element('#' + $scope.input.name);
                    cdc.updateTitlePosition();
                });
            }
        };

        cdc.updateTitlePosition = function(action) {
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