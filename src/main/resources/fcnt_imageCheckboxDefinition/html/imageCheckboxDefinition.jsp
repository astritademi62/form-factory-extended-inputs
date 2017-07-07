<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<!-- Image Checkboxes -->

<template:addResources type="css" resources="${url.context}/modules/form-factory-extended-inputs/css/imageCheckboxDefinition.css${endOfUri}"/>

<div class="form-group"
     ng-class="{'has-error': form[input.name].$invalid&&form[input.name].$dirty}"
     ng-show="resolveLogic()">
    <label class="col-sm-2 control-label">
        {{input.label}}
        <span ng-if="isRequired()"
              ng-show="form.$dirty">
            <sup>&nbsp;<i class="fa fa-asterisk fa-sm"></i></sup>
        </span>
    </label>

    <div class="col-sm-10" ff-validations ff-logic>

        <label class="checkbox-inline" ng-repeat="checkboxOption in input.checkboxes">

            <input type="checkbox"
                   class="hidden"
                   name="{{input.name}}" checklist-model="input.value"
                   ng-required="checkValues()"
                   checklist-value="checkboxOption.key"
                   checklist-change="makeDirty(); ffValidate()"
                   ng-model-options="{'allowInvalid':true}"
                   ng-disabled="readOnly">

            <div class="imageContainer"
                 ng-click="updateCheckedImageBox(checkboxOption)"
                 ff-focus-tracker="{{input.name}}"
                 tabindex="0">
                <div class="checkboxPositionDiv">
                    <i class="checkboxBackground fa fa-2x"
                       ng-class="{ 'fa-square-o': !checkboxOption.selected, 'fa-check-square-o' : checkboxOption.selected }"></i>
                </div>
                    <img class="imageCheckbox" src="{{ checkboxOption.value }}" />
            </div>

        </label>
        <span class="help-block"
              ng-show="input.helptext != undefined">
            {{input.helptext}}
        </span>
        <span class="help-block"
              ng-repeat="(validationName, validation) in input.validations"
              ng-show="form[input.name].$error[(validationName | normalize)]&&form[input.name].$dirty">
                {{validation.message}}
        </span>
    </div>
    <div class="clearfix"/>
</div>