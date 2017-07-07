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

    <div class="col-sm-10" ff-validations ff-logic ng-load="afic.refreshInput">

        <input id='afi_input' type="file" class="form-control file-loading" angular-bfi >
        <%--<div class="upload-avatar">--%>
            <%--<label>Upload Avatar</label>--%>

            <%--<div id="kv-avatar-error-01" class="center-block" style="width:800px;display:none"></div>--%>

            <%--<div class="kv-avatar text-center" style="width:200px">--%>

                <%--<input id="avatar-01" name="avatar-01" type="file" class="file-loading" angular-bfi="afic.avatarUploadConfig" >--%>

            <%--</div>--%>
        <%--</div>--%>

        <%--<div class="default-fileinput">--%>
            <%--<label>Simple File Upload</label>--%>
            <%--<input id="input-a" class="file" angular-bfi type="file">--%>
            <%--&lt;%&ndash;readonly="true" disabled="true" these attr can be set to disable the whole input &ndash;%&gt;--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<div class="multiple-fileinput">--%>
            <%--<label>Multiple Files</label>--%>
            <%--<input id="input-b" name="inputb[]" multiple class="file-loading" angular-bfi="{'showCaption':true}" type="file" >--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<div class="allowedexts-fileinput">--%>
            <%--<label>Only Files With Specific Extensions</label>--%>
            <%--<input id="input-c" name="inputc[]" class="file file-loading" angular-bfi="{'showCaption':true, 'allowedFileExtensions': ['txt', 'png', 'jpg']}" type="file" multiple>--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<div class="preset-fileinput">--%>
            <%--<label>Preset Files/Images</label>--%>
            <%--<input id="input-d" name="inputd[]" class="file file-loading" type="file" multiple--%>
                   <%--angular-bfi="afic.presetFilesConfig" >--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<div class="specific-acception-fileinput">--%>
            <%--<label>Accepts Image Only</label>--%>
            <%--<input id='input-e' class="file file-loading" type="file" accept="image/*" angular-bfi="afic.imageOnlyFileConfig" >--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<div class="specified-max-and-filetypes-fileinput">--%>
            <%--<label>Maximum of 10 of Specified File Types with Drag and Drop Dock</label>--%>
            <%--<input id="input-f" name="inputf[]" class="file" angular-bfi="{'maxFileCount':10, 'allowedFileTypes': ['image','video'], 'uploadUrl': '/file-upload-batch/2'}" type="file" multiple>--%>
        <%--</div>--%>
        <%--<br>--%>
        <%--<div class="multiple-from-folder-fileinput">--%>
            <%--<label>Multiple Files From Specific Folder</label>--%>
            <%--<input id="input-g" name="inputg[]" class="file-loading" angular-bfi="afic.folderUploadConfig" type="file" multiple webkitdirectory accept="image/*">--%>
        <%--</div>--%>


    </div>

    <div class="clearfix"/>
</div>