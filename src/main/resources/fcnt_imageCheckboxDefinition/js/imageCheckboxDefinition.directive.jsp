<%@ page contentType="text/javascript" %>
    <%@ taglib prefix="formfactory" uri="http://www.jahia.org/formfactory/functions" %>
    <%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

    angular.module('formFactory')
        .directive('ffImageCheckbox', ['$log', '_', 'ffTemplateResolver', function ($log, _, ffTemplateResolver) {
            var directive = {
                restrict: 'E',
                templateUrl: function(el, attrs) {
                    return ffTemplateResolver.resolveTemplatePath('${formfactory:addFormFactoryModulePath('/form-factory-definitions/image-checkbox', renderContext)}', attrs.viewType);
                },
                link: linkFunc
            };

            return directive;

            function linkFunc(scope, el, attr, ctrl) {
                /*
                 *Do this only if input has not previously been initialized
                 *This way we do not override the values if we are moving back and forth through the steps
                 *Where different forms of serialization could occur.
                 * */ console.log("here");
                if (scope.input.value === null) {
                    scope.input.value = [];
                } else if(angular.isString(scope.input.value)){
                    scope.input.value = angular.fromJson(scope.input.value);
                }
                if (angular.isString(scope.input.checkboxes)) {
                    scope.input.checkboxes = angular.fromJson(scope.input.checkboxes);
                    console.log(scope.input.checkboxes);
                }
            }
        }]);