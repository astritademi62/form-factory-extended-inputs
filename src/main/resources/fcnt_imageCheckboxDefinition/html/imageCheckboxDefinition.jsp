<!-- Multiple Checkboxes (inline) -->
<style>
    .checkboxBackground {
        border-radius: 5px; line-height: 0.9; max-height:20px; max-width:20px; background-color: beige;
    }
    .checkboxPositionDiv {
        position:absolute; display:inline-block; top: 5px; right: 5px; float: right;
    }
    .imageContainer {
        position:relative; display:inline-block;
        border: 2px solid #666;
        max-height: 204px;
        border-radius: 10px;
    }

    .imageContainer:hover {
        margin-left:-5px;
        margin-top: -5px;
        opacity: .75;
        box-shadow: 6px 6px 12px -2px rgba(0,0,0,0.7);
    }
    .imageCheckbox {
        border-radius: 7px
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

            <div class="imageContainer" ng-click="updateCheckedImageBox(checkboxOption)">
                <div class="checkboxPositionDiv">
                    <i class="checkboxBackground fa fa-2x"
                    ng-class="{ 'fa-square-o': !checkboxOption.selected, 'fa-check-square-o' : checkboxOption.selected }"></i>
                </div>
                <p>
                    <img class="imageCheckbox" src="{{ checkboxOption.value }}" width="200" height="200" />
                </p>

            </div>
            <%--<span src=""></span>--%>
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