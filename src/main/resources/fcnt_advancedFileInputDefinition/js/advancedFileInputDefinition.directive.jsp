<%@ page contentType="text/javascript" %>
    <%@ taglib prefix="formfactory" uri="http://www.jahia.org/formfactory/functions" %>
    <%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
    <%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

    (function (){
        var advancedFileInput = function (ffTemplateResolver){
            return {
                restrict: 'EA',
                require: ['^ffController'],
                controller:AdvancedFileInputController,
                controllerAs: 'afic',
                bindToController: true,
                templateUrl: function(el, attrs) {
                    return ffTemplateResolver.resolveTemplatePath('${formfactory:addFormFactoryModulePath('/form-factory-definitions/advanced-file-input', renderContext)}', attrs.viewType);
                },
                link: linkFunction
            };

            function linkFunction(scope, el, attr, ctrl) {
            }
        };

        angular
            .module('formFactory')
            .directive('ffAdvancedFileInput', ['ffTemplateResolver', advancedFileInput]);

        var AdvancedFileInputController = function () {
            var afic = this;

            afic.$onInit = function () {
               console.log('controller is initialized');
            };
        };

        AdvancedFileInputController.$inject = [];
    })();