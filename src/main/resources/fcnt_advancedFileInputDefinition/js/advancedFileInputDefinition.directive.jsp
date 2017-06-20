<%@ page contentType="text/javascript" %>
    <%@ taglib prefix="formfactory" uri="http://www.jahia.org/formfactory/functions" %>
    <%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
    <%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

    (function (){
        var advancedFileInput = function (ffTemplateResolver, $compile){
            return {
                restrict: 'E',
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
            .directive('ffAdvancedFileInput', ['ffTemplateResolver', '$compile', advancedFileInput]);

        var AdvancedFileInputController = function ($scope, $timeout, $filter,
                                                    i18n, $element, $document) {
            var afic = this;
            afic.parsed = {};
            afic.i18nMessageGetter = i18n.message;

            afic.imageOnlyFileConfig = {
                browseLabel: 'shmeckles'
            }

            var modeWatch = $scope.$watch(function() {
                return !_.isEmpty(afic.mode);
            }, function(isDefined) {
               if (isDefined) {
                   console.log('is defined');
                   console.log(afic.mode);
                   if (afic.mode == 'builderLive'){
                       $scope.$watch('input.options', function() {
                           console.log($scope.input.options);
                           afic.optionsConfig = null;
                           afic.optionsConfig = angular.copy(afic.createOptionsConfig());

                           console.log(afic.optionsConfig);
                       });
                   } else {
                       afic.showPreview = parseOptions('showPreview').value;
                       afic.fileFrequency = parseOptions('fileFrequency').value;
                       afic.browseLabel = parseOptions('browseLabel').value;
                   }
                   modeWatch();
               }
            }, true);
            afic.setMode = function(mode) {
                afic.mode = mode;
            }
            afic.createOptionsConfig = function(){
                var optionsConfig = {};
                optionsConfig['showPreview'] = parseOptions('showPreview').value;
                optionsConfig['browseLabel'] = parseOptions('browseLabel').value;
                return optionsConfig;
            }

            afic.$onInit = function () {

            };

            afic.updateOptionsConfig = function(property, value) {
                parseOptions(property, value);
                $scope.input.options = angular.copy($scope.input.options);
            }

            function parseOptions(option, value) {
                for (var i = 0; i < $scope.input.options.length; i++) {
                    if ($scope.input.options[i].key == option) {
                        if (value === undefined) {
                            return $scope.input.options[i];
                        } else {
                            return $scope.input.options[i].value = value;
                        }
                    }
                }
            }
        };

        AdvancedFileInputController.$inject = ['$scope',
            '$timeout', '$filter', 'i18nService', '$element', '$document'];
    })();