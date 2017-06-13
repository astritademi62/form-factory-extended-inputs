<div class="row">
    <div class="col-sm-12 text-right" ng-if="!inTranslateMode">
        <label><span message-key="ff.label.displayBorder"></span></label>
        <switch ng-model="input.displayBorder"></switch>
    </div>
    <div class="col-sm-12 text-right" ng-if="!inTranslateMode">
        <label><span message-key="ff.label.displayTitle"></span></label>
        <switch ng-change="cdc.updateTitleElementRef()" ng-model="input.displayTitle"></switch>
    </div>
    <div class="col-sm-12">
        <div class="form-group">
            <label message-key="ff.label.title"></label>
            &nbsp;
            <span class="cursorPointer preventSelect"
                  uib-tooltip="{{cdc.i18nMessageGetter('angular.contentDisplayDirective.tooltip.indent')}}">
                <i ng-click="cdc.updateTitlePosition('indent')" class="fa fa-indent"></i>
            </span>
            &nbsp;
            <span class="cursorPointer preventSelect"
                  uib-tooltip="{{cdc.i18nMessageGetter('angular.contentDisplayDirective.tooltip.indent')}}">
                <i ng-click="cdc.updateTitlePosition('outdent')" class="fa fa-outdent"></i>
            </span>
            <input type="text" class="form-control" ng-change="cdc.syncTitle()" ng-model="input.title"/>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="form-group">
            <label message-key="ff.label.bodyContent"></label>
            <textarea class="ckarea form-control"  rows="5" cols="60" ckeditor init-callback="cdc.onEditorInitialization()" ng-change="cdc.onUpdateEditor()" ng-model="input.body">
            </textarea>
        </div>
    </div>
</div>