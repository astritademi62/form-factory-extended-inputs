<div class="row" ng-init="afic.setMode('builderDesign')">

    <div class="col-sm-12 top2" ng-if="!inTranslateMode" >

            <label class="text-left" style="padding-right: 10px"><span>Show Previews</span></label>
            <div class="inline-block float-right">
                <switch id="showPreviewSwitch" ng-change="afic.updateOptionsConfig('showPreview', afic.showPreview)" ng-model="afic.showPreview"></switch>
            </div>

        <hr>
    </div>

    <div class="col-sm-12">
        <div class="form-group">
            <label>File Upload Frequency</label>

            <div class="checkbox">
                <label >
                    <input type="radio" name="fileFrequency" value="single_file" ng-change="afic.updateOptionsConfig('fileFrequency', afic.fileFrequency)" ng-model="afic.fileFrequency">
                    <span>Single file</span></label>
            </div>

            <div class="checkbox">
                <label >
                    <input type="radio" name="fileFrequency" value="multiple_files" ng-change="afic.updateOptionsConfig('fileFrequency', afic.fileFrequency)" ng-model="afic.fileFrequency">
                    <span>Multiple files</span></label>
            </div>
            <hr>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="form-group">
            <label>Browser Label</label>
            <div class="top10"></div>
            <input id="bl-input" type="text" class="form-control" placeholder="Browse ..." ng-change="afic.updateOptionsConfig('browseLabel', afic.browseLabel)" ng-model="afic.browseLabel">
        </div>

    </div>
</div>
