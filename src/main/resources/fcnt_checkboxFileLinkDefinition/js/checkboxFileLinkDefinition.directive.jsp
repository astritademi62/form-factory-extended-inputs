<%--checkbox with file link directive--%>
    <%@ page contentType="text/javascript" %>
    <%@ taglib prefix="formfactory" uri="http://www.jahia.org/formfactory/functions" %>
    <%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

    angular.module('formFactory')
        .directive('ffCheckboxFileLink', ['$log', '_', 'ffTemplateResolver', '$sce', function ($log, _, ffTemplateResolver, $sce) {
            var directive = {
                restrict: 'E',
                templateUrl: function(el, attrs) {
                    return ffTemplateResolver.resolveTemplatePath('${formfactory:addFormFactoryModulePath('/form-factory-definitions/checkbox-file-link', renderContext)}', attrs.viewType);
                },
                link: linkFunc
            };

            return directive;

            function linkFunc(scope, el, attr, ctrl) {
                /*
                 *Do this only if input has not previously been initialized
                 *This way we do not override the values if we are moving back and forth through the steps
                 *Where different forms of serialization could occur.
                 * */
                if (scope.input.value === null) {
                    scope.input.value = {rendererName:'checkboxFileLink'};
                } else if(angular.isString(scope.input.value)){
                    scope.input.value = angular.merge(angular.fromJson(scope.input.value),{rendererName:'checkboxFileLink'});
                }
                if (angular.isString(scope.input.checked)) {
                    scope.input.checked = angular.fromJson(scope.input.checked);
                }

                scope.getFormattedMessage  = function() {
                    var startIndex = scope.input.termsLabel.indexOf('{');
                    var endIndex = scope.input.termsLabel.indexOf('}')
                    var label = scope.input.termsLabel.substring(0, startIndex);
                    label += '<a href="' + scope.input.link + '" onclick="window.open(this.href); return false;">'
                        + scope.input.termsLabel.substring(startIndex + 1, endIndex) + '</a>' + scope.input.termsLabel.substring(endIndex + 1);
                    return $sce.trustAsHtml(label);
                }

            }
        }]);