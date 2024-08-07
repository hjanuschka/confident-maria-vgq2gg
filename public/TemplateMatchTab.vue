/* eslint-disable vue/require-v-for-key */
<template>
  <ValidationObserver ref="form">
    <form @submit.prevent="validateTemplate">
      <div class="md-layout">
        <div class="md-layout-item md-size-90 md-xsmall-size-100 mx-auto">
          <div class="parent">
            <div class="child">
              <md-radio
                v-model="templateModel.selectedTemplate.dltContentIdStatus"
                :value="true"
                v-on:change="setdltStatus"
              ></md-radio>
            </div>
            <div class="new_child">
              <ValidationProvider
                v-slot="{ passed, failed }"
                rules="required"
                name="dtlctid"
              >
                <md-field
                  :class="[{ 'md-error': failed }, { 'md-valid': passed }]"
                >
                  <md-autocomplete
                    :disabled="
                      !templateModel.selectedTemplate.dltContentIdStatus
                    "
                    md-layout="floating"
                    v-model="templateModel.selectedTemplate.dtlctid"
                    :md-options="templateModel.dtlctidList"
                    style="position: relative;top: 10px;"
                    @md-selected="setTempalte"
                  >
                    <label>DLT Content Id</label>
                    <template
                      slot="md-autocomplete-item"
                      slot-scope="{ item }"
                      >{{ item }}</template
                    >
                  </md-autocomplete>
                </md-field>
              </ValidationProvider>
            </div>
            <div class="child">
              <md-radio
                v-model="templateModel.selectedTemplate.templateLabelStatus"
                :value="true"
                v-on:change="setTemplateLabelStatus"
              ></md-radio>
            </div>
            <div class="new_child">
              <ValidationProvider
                v-slot="{ passed, failed }"
                rules="required"
                name="templateLabel"
              >
                <md-field
                  :class="[{ 'md-error': failed }, { 'md-valid': passed }]"
                >
                  <md-autocomplete
                    :disabled="
                      !templateModel.selectedTemplate.templateLabelStatus
                    "
                    md-layout="floating"
                    v-model="templateModel.selectedTemplate.templateLabel"
                    :md-options="templateModel.templateLabelList"
                    style="position: relative;top: 10px;"
                    @md-selected="setTemplateLabel"
                  >
                    <label>Template Label</label>
                    <template
                      slot="md-autocomplete-item"
                      slot-scope="{ item }"
                      >{{ item }}</template
                    >
                  </md-autocomplete>
                </md-field>
              </ValidationProvider>
            </div>
            <div class="new_child1">
              <div class="child">
                <md-radio
                  v-model="templateModel.selectedTemplate.templateTextStatus"
                  :value="true"
                  v-on:change="setTemplateTextStatus"
                ></md-radio>
              </div>
              <div class="new_child2">
                <md-field>
                  <label>Template Text</label>
                  <md-textarea
                    v-model="templateModel.selectedTemplate.templateText"
                    md-autogrow
                    :disabled="
                      !templateModel.selectedTemplate.templateTextStatus
                    "
                  ></md-textarea>
                </md-field>
              </div>
            </div>
          </div>
          <div class="md-layout-item md-size-90 mt-4 md-small-size-100">
            <md-field>
              <label>Actual Text*</label>
              <md-textarea
                v-model="templateModel.selectedTemplate.actualText"
                md-autogrow
                :rules="'required'"
                :icon="'campaign'"
              ></md-textarea>
            </md-field>
          </div>
          <div
            class="md-layout-item md-size-90 mt-4 md-small-size-100"
            align="center"
          >
            <md-button
              class="md-raised md-primary"
              align="center"
              ref="form"
              v-on:click="validateTemplate"
              >Template Match</md-button
            >
          </div>
          <div
            class="md-layout-item md-size-90 mt-4 md-small-size-100"
            v-if="responseData.responseStatus == true"
          >
            <validation-component
              :name="'templateStatus'"
              :keyName="'templateStatus'"
              v-model="responseData"
              :label="'Template Status'"
              :disabled="disabledStatus"
            ></validation-component>
          </div>
          <div
            class="md-layout-item md-size-90 mt-4 md-small-size-100"
            v-if="
              responseData.responseStatus == true &&
                responseData.templateStatus == 'Not Matched'
            "
          >
            <validation-component
              :name="'templateReason'"
              :keyName="'templateReason'"
              v-model="responseData"
              :label="'Reason'"
              :disabled="disabledStatus"
            ></validation-component>
          </div>
          <div
            class="md-layout-item md-size-90 mt-4 md-small-size-100"
            v-if="
              responseData.responseStatus == true &&
                responseData.templateStatus == 'Not Matched'
            "
          >
            <div class="root">
              <div
                v-for="item of templateModel.disMsg"
                :key="item.indx"
                :class="item.class"
              >
                {{ item.msg }}
                <md-tooltip
                  md-direction="bottom"
                  v-if="item.tooltipmsg && item.tooltipmsg.length > 0"
                  >{{ item.tooltipmsg }}</md-tooltip
                >
              </div>
            </div>
          </div>
          <div
            class="md-layout-item md-size-90 mt-4 md-small-size-100"
            v-if="
              responseData.responseStatus == true &&
                responseData.templateStatus == 'Not Matched'
            "
          >
            <validation-component
              :name="'templateMissingText'"
              :keyName="'templateMissingText'"
              v-model="responseData"
              :label="'Template Missing Text'"
              :disabled="disabledStatus"
            ></validation-component>
          </div>
          <div
            class="md-layout-item md-size-90 mt-4 md-small-size-100"
            v-if="
              responseData.responseStatus == true &&
                responseData.templateStatus == 'Not Matched'
            "
          >
            <validation-component
              :name="'templateExtraText'"
              :keyName="'templateExtraText'"
              v-model="responseData"
              :label="'Template Extra Text'"
              :disabled="disabledStatus"
            ></validation-component>
          </div>
        </div>
      </div>
    </form>
  </ValidationObserver>
</template>

<script>
import ValidationComponent from "../../../../../components/ValidationComponent.vue";
import templateService from "../../../../../services/template-service";
import ErrorHandler from "../../../../../services/error-handler";
import { ErrorComponent } from "@/components";
import Notifier from "@/services/notify";

export default {
  name: "RegularCards",
  components: {
    ValidationComponent
  },
  data: () => ({
    disabledStatus: true,
    radio: "dlt",
    templateModel: {
      templateList: [],
      dtlctidList: [],
      templateLabelList: [],
      selectedTemplate: {
        actualText: "",
        templateText: "",
        dtlctid: "",
        templateLabel: "",
        dltContentIdStatus: true,
        templateLabelStatus: false,
        templateTextStatus: false
      },
      disMsg: []
    },
    responseData: { responseStatus: false, templateStatus: "Not Matched" }
  }),
  methods: {
    setTempalte() {
      if (this.templateModel.selectedTemplate.dtlctid.length > 0) {
        var getTemplate = this.templateModel.templateList.find(
          x => x.dltContentId == this.templateModel.selectedTemplate.dtlctid
        );
        if (getTemplate.dltContentId && getTemplate.dltContentId.length > 0) {
          this.templateModel.selectedTemplate.templateText =
            getTemplate.templateText;
          this.templateModel.selectedTemplate.templateLabel =
            getTemplate.templateLabel;
        }
      }
    },
    setTemplateTextStatus() {
      this.templateModel.selectedTemplate.dltContentIdStatus = false;
      this.templateModel.selectedTemplate.templateLabelStatus = false;
      this.templateModel.selectedTemplate.templateTextStatus = true;
      this.templateModel.selectedTemplate.dtlctid = "";
      this.templateModel.selectedTemplate.templateLabel = "";
      this.templateModel.selectedTemplate.templateText = "";
      this.responseData.responseStatus = false;
    },
    setdltStatus() {
      this.templateModel.selectedTemplate.dltContentIdStatus = true;
      this.templateModel.selectedTemplate.templateLabelStatus = false;
      this.templateModel.selectedTemplate.templateTextStatus = false;
      this.responseData.responseStatus = false;
    },
    setTemplateLabelStatus() {
      this.templateModel.selectedTemplate.dltContentIdStatus = false;
      this.templateModel.selectedTemplate.templateLabelStatus = true;
      this.templateModel.selectedTemplate.templateTextStatus = false;
      this.responseData.responseStatus = false;
    },
    setTemplateLabel() {
      if (this.templateModel.selectedTemplate.templateLabel.length > 0) {
        var getTemplate = this.templateModel.templateList.find(
          x =>
            x.templateLabel == this.templateModel.selectedTemplate.templateLabel
        );
        if (getTemplate.dltContentId && getTemplate.dltContentId.length > 0) {
          this.templateModel.selectedTemplate.templateText =
            getTemplate.templateText;
          this.templateModel.selectedTemplate.dtlctid =
            getTemplate.dltContentId;
        }
      }
    },
    loadInitialdata() {
      const loader = this.$loading.show({ loader: "bars", color: "#2dce89" });
      templateService
        .getActiveTemplates()
        .then(response => {
          loader.hide();
          this.templateModel.templateList = response.data;
          if (response.data && response.data.length > 0) {
            this.templateModel.dtlctidList = response.data.map(
              s => s.dltContentId
            );
            this.templateModel.templateLabelList = response.data.map(
              s => s.templateLabel
            );
          }
        })
        .catch(error => {
          loader.hide();
          ErrorHandler.handle(this, error);
        });
    },
    validateTemplate() {
      if (
        ((this.templateModel.selectedTemplate.dtlctid &&
          this.templateModel.selectedTemplate.dtlctid.length > 0) ||
          (this.templateModel.selectedTemplate.templateText &&
            this.templateModel.selectedTemplate.templateText.length > 0)) &&
        this.templateModel.selectedTemplate.actualText &&
        this.templateModel.selectedTemplate.actualText.length > 0
      ) {
        const loader = this.$loading.show({ loader: "bars", color: "#2dce89" });

        var templateObj = {
          dtlctid: this.templateModel.selectedTemplate.dtlctid,
          templateText: this.templateModel.selectedTemplate.templateText,
          actualText: this.templateModel.selectedTemplate.actualText
        };
        templateService
          .templateMatch(templateObj)
          .then(response => {
            loader.hide();
            this.responseData = {
              responseStatus: true,
              templateStatus: "Not Matched"
            };
            if (response.data && response.data.matchStatus)
              this.responseData.templateStatus = "Matched";
            else {
              this.responseData.templateStatus = "Not Matched";
              if (response.data.missing && response.data.missing.length > 0) {
                this.responseData.templateMissingText = response.data.missing.map(
                  function(item) {
                    return item["text"];
                  }
                );
                this.responseData.templateMissingText = this.responseData.templateMissingText.toString();
              }
              if (response.data.extra && response.data.extra.length > 0) {
                this.responseData.templateExtraText = response.data.extra.map(
                  function(item) {
                    return item["text"];
                  }
                );
                this.responseData.templateExtraText = this.responseData.templateExtraText.toString();
              }
              if (response.data.reason)
                this.responseData.templateReason = response.data.reason;
              this.templateModel.disMsg = [
                { msg: "Result:", class: "grayText", tooltipmsg: "", indx: -1 }
              ];
              let data_extra_missing = [];
              let data_extra = [];
              if (response.data.extra && response.data.extra.length > 0) {
                var ex_obj = response.data.extra[0];
                for (
                  var ex_indx = 1;
                  ex_indx < response.data.extra.length;
                  ex_indx++
                ) {
                  if (
                    ex_obj.endIdx + 1 ==
                    response.data.extra[ex_indx].startIdx
                  ) {
                    ex_obj.endIdx = response.data.extra[ex_indx].endIdx;
                    ex_obj.text =
                      ex_obj.text + " " + response.data.extra[ex_indx].text;
                  } else {
                    data_extra.push(ex_obj);
                    ex_obj = response.data.extra[ex_indx];
                  }
                }
                data_extra.push(ex_obj);
              }
              let data_missing = [];
              var extralen = 0;
              if (response.data.missing && response.data.missing.length > 0) {
                var ex_obj = response.data.missing[0];
                for (
                  var ex_indx = 1;
                  ex_indx < response.data.missing.length;
                  ex_indx++
                ) {
                  if (
                    ex_obj.endIdx + 1 ==
                    response.data.missing[ex_indx].startIdx
                  ) {
                    ex_obj.endIdx = response.data.missing[ex_indx].endIdx;
                    ex_obj.text =
                      ex_obj.text + " " + response.data.missing[ex_indx].text;
                  } else {
                    data_missing.push(ex_obj);
                    ex_obj = response.data.missing[ex_indx];
                  }
                }
                data_missing.push(ex_obj);
              }
              if (data_extra.length > 0 || data_missing.length > 0) {
                while (data_extra.length > 0 && data_missing.length > 0) {
                  var data_extra_missing_obj = {
                    msg: "",
                    startIdx: 0,
                    endIdx: 0,
                    class: "redText",
                    tooltipmsg: "Extra Text",
                    indx: ""
                  };
                  var data_extra_missing_obj1 = {
                    msg: "",
                    startIdx: 0,
                    endIdx: 0,
                    class: "blueText",
                    tooltipmsg: "Missing Text",
                    indx: ""
                  };
                  let data_extra_obj = data_extra[0];
                  let data_missing_obj = data_missing[0];
                  if (
                    data_extra_obj.startIdx ==
                    data_missing_obj.startIdx + extralen
                  ) {
                    data_extra_missing_obj.msg = data_extra_obj.text;
                    data_extra_missing_obj.startIdx = data_extra_obj.startIdx;
                    data_extra_missing_obj.endIdx = data_extra_obj.endIdx;
                    data_extra_missing_obj.indx =
                      data_extra_obj.startIdx + "Extra";
                    data_extra_missing.push(data_extra_missing_obj);
                    extralen = extralen + data_extra_obj.text.length + 1;
                    data_extra_missing_obj1.msg = data_missing_obj.text;
                    data_extra_missing_obj1.startIdx =
                      data_missing_obj.startIdx + extralen;
                    data_extra_missing_obj1.endIdx =
                      data_missing_obj.endIdx + extralen;
                    data_extra_missing_obj1.indx =
                      data_missing_obj.startIdx + "Missing";
                    data_extra_missing.push(data_extra_missing_obj1);
                    data_extra.shift();
                    data_missing.shift();
                  } else if (
                    data_extra_obj.startIdx <
                    data_missing_obj.startIdx + extralen
                  ) {
                    data_extra_missing_obj.msg = data_extra_obj.text;
                    data_extra_missing_obj.startIdx = data_extra_obj.startIdx;
                    data_extra_missing_obj.endIdx = data_extra_obj.endIdx;
                    data_extra_missing_obj.indx =
                      data_extra_obj.startIdx + "Extra";
                    data_extra_missing.push(data_extra_missing_obj);
                    extralen = extralen + data_extra_obj.text.length + 1;
                    data_extra.shift();
                  } else {
                    data_extra_missing_obj1.msg = data_missing_obj.text;
                    data_extra_missing_obj1.startIdx =
                      data_missing_obj.startIdx + extralen;
                    data_extra_missing_obj1.endIdx =
                      data_missing_obj.endIdx + extralen;
                    data_extra_missing_obj1.indx =
                      data_missing_obj.startIdx + "Missing";
                    data_extra_missing.push(data_extra_missing_obj1);
                    data_missing.shift();
                  }
                }
                while (data_extra.length > 0) {
                  var data_extra_missing_obj = {
                    msg: "",
                    startIdx: 0,
                    endIdx: 0,
                    class: "redText",
                    tooltipmsg: "Extra Text",
                    indx: ""
                  };

                  let data_extra_obj = data_extra[0];
                  data_extra_missing_obj.msg = data_extra_obj.text;
                  data_extra_missing_obj.startIdx = data_extra_obj.startIdx;
                  data_extra_missing_obj.endIdx = data_extra_obj.endIdx;
                  data_extra_missing_obj.indx =
                    data_extra_obj.startIdx + "Extra";
                  data_extra_missing.push(data_extra_missing_obj);
                  extralen = extralen + data_extra_obj.text.length + 1;
                  data_extra.shift();
                }
                while (data_missing.length > 0) {
                  var data_extra_missing_obj1 = {
                    msg: "",
                    startIdx: 0,
                    endIdx: 0,
                    class: "blueText",
                    tooltipmsg: "Missing Text",
                    indx: ""
                  };
                  let data_missing_obj = data_missing[0];
                  data_extra_missing_obj1.msg = data_missing_obj.text;
                  data_extra_missing_obj1.startIdx =
                    data_missing_obj.startIdx + extralen;
                  data_extra_missing_obj1.endIdx =
                    data_missing_obj.endIdx + extralen;
                  data_extra_missing_obj1.indx =
                    data_missing_obj.startIdx + "Missing";
                  data_extra_missing.push(data_extra_missing_obj1);
                  data_missing.shift();
                }
              }
              var cindx = 0;
              var maxindx = response.data.inputText.length;
              for (let indx = 0; indx < data_extra_missing.length; indx++) {
                let obj = data_extra_missing[indx];
                var msgobj = {
                  msg: "",
                  class: "",
                  tooltipmsg: "",
                  indx: ""
                };
                var msgobj1 = {
                  msg: "",
                  class: "",
                  tooltipmsg: "",
                  indx: ""
                };
                if (obj.startIdx == cindx) {
                  msgobj.msg = obj.msg;
                  msgobj.class = obj.class;
                  msgobj.tooltipmsg = obj.tooltipmsg;
                  msgobj.indx = obj.indx;
                  this.templateModel.disMsg.push(msgobj);
                  if (obj.class == "blueText") {
                    msgobj1.msg = response.data.inputText.substring(
                      cindx,
                      obj.endIdx
                    );
                    msgobj1.class = "greenText";
                    msgobj1.tooltipmsg = "";
                    msgobj1.indx = cindx + "Green";
                    this.templateModel.disMsg.push(msgobj1);
                  }
                  cindx = obj.endIdx + 1;
                } else if (obj.startIdx > cindx) {
                  msgobj1.msg = response.data.inputText.substring(
                    cindx,
                    obj.startIdx
                  );
                  msgobj1.class = "greenText";
                  msgobj1.tooltipmsg = "";
                  msgobj1.indx = cindx + "Green";
                  this.templateModel.disMsg.push(msgobj1);
                  msgobj.indx = obj.indx;
                  msgobj.msg = obj.msg;
                  msgobj.class = obj.class;
                  msgobj.tooltipmsg = obj.tooltipmsg;
                  cindx = obj.endIdx + 1;
                  this.templateModel.disMsg.push(msgobj);
                }
              }
              if (cindx < maxindx) {
                var msgobj1 = {
                  msg: "",
                  class: "",
                  tooltipmsg: "",
                  indx: cindx
                };
                msgobj1.msg = response.data.inputText.substring(cindx, maxindx);
                msgobj1.class = "greenText";
                msgobj1.tooltipmsg = "";
                this.templateModel.disMsg.push(msgobj1);
              }
            }
          })
          .catch(error => {
            loader.hide();
            ErrorHandler.handle(this, error);
          });
      } else if (
        !(
          this.templateModel.selectedTemplate.actualText &&
          this.templateModel.selectedTemplate.actualText.length > 0
        )
      ) {
        ErrorHandler.handle(this, "Please enter the actual text");
      } else {
        ErrorHandler.handle(
          this,
          "Please select the dlt Content Id or selct the template label or enter the template text"
        );
      }
    }
  },
  mounted() {
    this.loadInitialdata();
  },
  watch: {
    "templateModel.selectedTemplate.actualText"(value) {
      this.responseData.responseStatus = false;
    }
  }
};
</script>
<style lang="scss" scoped>
.md-card .md-card-actions {
  border: none;
}
.root {
  text-align: left;
}
.redText {
  text-align: left;
  display: inline;
  font-weight: bold;
  color: red;
  margin-right: 2px;
}
.greenText {
  text-align: left;
  display: inline;
  font-weight: bold;
  color: green;
  margin-right: 2px;
}
.blueText {
  text-align: left;
  display: inline;
  font-weight: bold;
  color: blue;
  margin-right: 2px;
}
.grayText {
  text-align: left;
  display: inline;
  font-weight: bold;
  color: gray;
  margin-right: 5px;
}
.parent {
  margin: 1rem;
  text-align: left;
}
.child {
  display: inline-block;
  vertical-align: middle;
}
.new_child {
  display: inline-block;
  vertical-align: left;
  margin-right: 2em;
}
.new_child1 {
  display: inline-block;
  vertical-align: left;
  margin-right: 2em;
  min-width: 42%;
}
.new_child2 {
  display: inline-block;
  vertical-align: left;
  min-width: 85%;
}
body.modal-open {
  overflow: hidden;
  background-color: orange;
}
</style>
