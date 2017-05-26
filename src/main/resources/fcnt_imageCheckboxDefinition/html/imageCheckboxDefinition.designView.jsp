<div class="row">
    <div class="col-md-12">
        <div class="row" ng-if="!inTranslateMode">
            <div class="col-md-12">
                <label class="control-label">
                    <span message-key="ff.label.changeInputFieldName"></span>
                </label>
                <input type="text"
                       class="form-control"
                       ng-model="input.name"
                       ff-name-uniqueness-check
                       ff-logics-syncronizer/>
                <span class="help-block hide">
                    <span message-key="angular.ffFormBuilderDirective.message.duplicateInputName"></span>
                </span>
            </div>
        </div>
        <br/>
        <label>
            <span message-key="ff.label.changeLabel"></span>
        </label>
        <input type="text" class="form-control" ng-model="input.label"/>
        <br/>
        <label>
            <span message-key="ff.label.changeHelpText"></span>
        </label>
        <input type="text" class="form-control" ng-model="input.helptext"/>
        <br/>
        <ff-key-value-maker ng-if="input.checkboxes"
                            input="input"
                            read-only="readOnly"
                            property="checkboxes"
                            multiple-default-value-selection="true"
                            in-translate-mode="inTranslateMode">
        </ff-key-value-maker>
    </div>
</div>