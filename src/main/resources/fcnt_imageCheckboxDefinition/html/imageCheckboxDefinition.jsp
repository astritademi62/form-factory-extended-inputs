<!-- Image Checkboxes -->
<%--TODO !!! REMOVE STYLES FROM JSP !!!--%>
<style>
    .checkboxBackground {
        border-radius: 4px; line-height: 0.85; max-height:20px; max-width:20px; background-color: #d9d9d9;
        opacity: .75;
    }
    .checkboxPositionDiv {
        position:absolute; display:inline-block; top: 5px; right: 5px; float: right;
        /*box-shadow: inset 0px 2px 10px 0px rgba(0,0,0,0.7);*/
        border-radius: 4px;
        opacity: .90;
    }
    .imageContainer {
        position:relative; display:inline-block;
        /*border: 2px solid #666;*/
        max-height: 204px;
        border-radius: 10px;
        min-height: 204px;
        min-width: 204px;
        max-width: 204px;
        height: 204px;
    }

    .imageContainer:hover {
        /*margin-left:-5px;*/
        /*margin-top: -5px;*/
        opacity: .75;
        /*box-shadow: 6px 6px 12px -2px rgba(0,0,0,0.7);*/
    }

    .imageCheckbox {
        border-radius: 7px;
        width: 100%;
        height: 100%;
        object-fit: cover;
        overflow: hidden;
    }
</style>

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